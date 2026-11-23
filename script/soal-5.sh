# ================================================================
# Interface
# ================================================================

# Gendou
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
    address 192.233.4.105
    netmask 255.255.255.252

auto eth2
iface eth2 inet static
    address 192.233.4.109
    netmask 255.255.255.252

auto eth3
iface eth3 inet static
    address 192.233.4.125
    netmask 255.255.255.252

auto eth4
iface eth4 inet static
    address 192.233.4.133
    netmask 255.255.255.252

auto eth5
iface eth5 inet static
    address 192.233.4.145
    netmask 255.255.255.252

auto eth6
iface eth6 inet static
    address 192.233.4.149
    netmask 255.255.255.252

auto eth7
iface eth7 inet static
    address 192.233.4.153
    netmask 255.255.255.252

auto eth8
iface eth8 inet static
    address 192.233.4.161
    netmask 255.255.255.252
    up bash /root/gendou.sh


# ================================================================
# Terminal
# ================================================================

# --- 1. Jalankan di Router Gendou (Membuat /root/gendou.sh & symlink gendo.sh) ---
cat << 'EOF' > /root/gendou.sh
#!/bin/bash

# === SOAL 2: IP Forwarding ===
sysctl -w net.ipv4.ip_forward=1

# === SOAL 3: Static Routing & CIDR Summarization ===
# Cabang Yui (A4 + A6 diringkas ke 192.233.4.112/29)
ip route replace 192.233.0.0/23 via 192.233.4.110
ip route replace 192.233.3.0/25 via 192.233.4.110
ip route replace 192.233.4.0/27 via 192.233.4.110
ip route replace 192.233.4.32/28 via 192.233.4.110
ip route replace 192.233.4.112/29 via 192.233.4.110
ip route replace 192.233.4.120/30 via 192.233.4.110

# Cabang Hikari
ip route replace 192.233.2.0/24 via 192.233.4.126
ip route replace 192.233.3.224/27 via 192.233.4.126
ip route replace 192.233.4.128/30 via 192.233.4.126

# Cabang Asuka (A16 + A18 diringkas ke 192.233.4.136/29)
ip route replace 192.233.3.128/26 via 192.233.4.134
ip route replace 192.233.4.48/29 via 192.233.4.134
ip route replace 192.233.4.96/30 via 192.233.4.134
ip route replace 192.233.4.136/29 via 192.233.4.134

# Cabang Kaji & Misato
ip route replace 192.233.4.100/30 via 192.233.4.146
ip route replace 192.233.4.64/29 via 192.233.4.150

# Cabang Shigeru (A25 + A27 diringkas ke 192.233.4.80/28)
ip route replace 192.233.4.80/28 via 192.233.4.154
ip route replace 192.233.4.156/30 via 192.233.4.154

# Cabang Fuyutsuki
ip route replace 192.233.3.192/27 via 192.233.4.162
ip route replace 192.233.4.56/29 via 192.233.4.162
ip route replace 192.233.4.72/29 via 192.233.4.162
ip route replace 192.233.4.164/30 via 192.233.4.162
ip route replace 192.233.4.168/30 via 192.233.4.162

# === SOAL 4: NAT Masquerade & DNS Resolver ===
iptables -t nat -F
iptables -t nat -A POSTROUTING -s 192.233.0.0/21 -o eth0 -j MASQUERADE
echo "nameserver 192.168.122.1" > /etc/resolv.conf
echo "nameserver 8.8.8.8" >> /etc/resolv.conf

# === SOAL 5: Firewall Stateful pada Gendou ===
# Reset seluruh rule & custom chain filter
iptables -F
iptables -X

# Default Policy: kunci INPUT & FORWARD
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Loopback & DHCP dari NAT1 (eth0) tetap jalan
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -i eth0 -p udp --sport 67 --dport 68 -j ACCEPT

# (a) Izinkan balasan koneksi yang sudah ada
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# (b) Izinkan traffic dari jaringan internal ke internet (via eth0)
iptables -A FORWARD -s 192.233.0.0/21 -o eth0 -j ACCEPT

# (c) Izinkan traffic antar-LAN
iptables -A FORWARD -s 192.233.0.0/21 -d 192.233.0.0/21 -j ACCEPT

# (d) Izinkan traffic dari jaringan internal ke Gendou sendiri
iptables -A INPUT -s 192.233.0.0/21 -j ACCEPT
EOF
chmod +x /root/gendou.sh && bash /root/gendou.sh
ln -sf /root/gendou.sh /root/gendo.sh


# --- 2. Pengujian Wajib ---
# Jalankan di Gendou:
iptables -S

# Jalankan di Armisael:
ping -c 3 8.8.8.8
