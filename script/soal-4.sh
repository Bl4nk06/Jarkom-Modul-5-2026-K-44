# ================================================================
# Interface
# ================================================================

# Gendou
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp
    up sysctl -w net.ipv4.ip_forward=1

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

up bash /root/soal-3.sh
up bash /root/soal-4.sh

# ================================================================
# Terminal
# ================================================================

# --- 1. Jalankan di Router Gendou ---
cat << 'EOF' > /root/soal-4.sh
#!/bin/bash
sysctl -w net.ipv4.ip_forward=1
iptables -t nat -F
iptables -t nat -A POSTROUTING -s 192.233.0.0/21 -o eth0 -j MASQUERADE
echo "nameserver 192.168.122.1" > /etc/resolv.conf
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
EOF
chmod +x /root/soal-4.sh && bash /root/soal-4.sh

# --- 2. Set DNS Resolver pada Node Uji (Armisael, Lilith, Sachiel, Comm-Net) ---
cat << 'EOF' > /etc/resolv.conf
nameserver 192.168.122.1
nameserver 8.8.8.8
EOF

# --- 3. Pengujian Wajib ---
# Jalankan di Armisael & Lilith:
ping -c 3 8.8.8.8
ping -c 3 deb.debian.org

# Jalankan di Gendou (tunjukkan counter paket & byte rule NAT bertambah):
iptables -t nat -L POSTROUTING -n -v