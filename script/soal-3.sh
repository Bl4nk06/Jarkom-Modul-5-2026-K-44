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

# Yui
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.110
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
    address 192.233.3.1
    netmask 255.255.255.128

auto eth2
iface eth2 inet static
    address 192.233.4.113
    netmask 255.255.255.252

auto eth3
iface eth3 inet static
    address 192.233.4.117
    netmask 255.255.255.252

auto eth4
iface eth4 inet static
    address 192.233.4.121
    netmask 255.255.255.252
    up bash /root/soal-3.sh

# Mari
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.114
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
    address 192.233.4.33
    netmask 255.255.255.240
    up bash /root/soal-3.sh

# Rei
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.118
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
    address 192.233.0.1
    netmask 255.255.254.0
    up bash /root/soal-3.sh

# Shinji
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.122
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
    address 192.233.4.1
    netmask 255.255.255.224
    up bash /root/soal-3.sh

# Hikari
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.126
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
    address 192.233.2.1
    netmask 255.255.255.0

auto eth2
iface eth2 inet static
    address 192.233.4.129
    netmask 255.255.255.252
    up bash /root/soal-3.sh

# Kaworu
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.130
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
    address 192.233.3.225
    netmask 255.255.255.224
    up bash /root/soal-3.sh

# Asuka
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.134
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
    address 192.233.4.97
    netmask 255.255.255.252

auto eth2
iface eth2 inet static
    address 192.233.4.137
    netmask 255.255.255.252

auto eth3
iface eth3 inet static
    address 192.233.4.141
    netmask 255.255.255.252
    up bash /root/soal-3.sh

# Kensuke
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.138
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
    address 192.233.3.129
    netmask 255.255.255.192
    up bash /root/soal-3.sh

# Ritsuko
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.142
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
    address 192.233.4.49
    netmask 255.255.255.248
    up bash /root/soal-3.sh

# Kaji
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.146
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
    address 192.233.4.101
    netmask 255.255.255.252
    up bash /root/soal-3.sh

# Misato
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.150
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
    address 192.233.4.65
    netmask 255.255.255.248
    up bash /root/soal-3.sh

# Shigeru
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.154
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
    address 192.233.4.81
    netmask 255.255.255.248

auto eth2
iface eth2 inet static
    address 192.233.4.157
    netmask 255.255.255.252
    up bash /root/soal-3.sh

# Makoto
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.158
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
    address 192.233.4.89
    netmask 255.255.255.248
    up bash /root/soal-3.sh

# Fuyutsuki
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.162
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
    address 192.233.4.57
    netmask 255.255.255.248

auto eth2
iface eth2 inet static
    address 192.233.4.165
    netmask 255.255.255.252

auto eth3
iface eth3 inet static
    address 192.233.4.169
    netmask 255.255.255.252
    up bash /root/soal-3.sh

# Maya
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.166
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
    address 192.233.3.193
    netmask 255.255.255.224
    up bash /root/soal-3.sh

# Toji
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.170
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
    address 192.233.4.73
    netmask 255.255.255.248
    up bash /root/soal-3.sh


# ================================================================
# Terminal
# ================================================================

# --- 1. Buat & Jalankan /root/soal-3.sh di masing-masing Router ---

# Gendou
cat << 'EOF' > /root/soal-3.sh
#!/bin/bash
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
EOF
chmod +x /root/soal-3.sh && bash /root/soal-3.sh

# Yui
cat << 'EOF' > /root/soal-3.sh
#!/bin/bash
ip route replace default via 192.233.4.109
ip route replace 192.233.4.32/28 via 192.233.4.114
ip route replace 192.233.0.0/23 via 192.233.4.118
ip route replace 192.233.4.0/27 via 192.233.4.122
EOF
chmod +x /root/soal-3.sh && bash /root/soal-3.sh

# Hikari
cat << 'EOF' > /root/soal-3.sh
#!/bin/bash
ip route replace default via 192.233.4.125
ip route replace 192.233.3.224/27 via 192.233.4.130
EOF
chmod +x /root/soal-3.sh && bash /root/soal-3.sh

# Asuka
cat << 'EOF' > /root/soal-3.sh
#!/bin/bash
ip route replace default via 192.233.4.133
ip route replace 192.233.3.128/26 via 192.233.4.138
ip route replace 192.233.4.48/29 via 192.233.4.142
EOF
chmod +x /root/soal-3.sh && bash /root/soal-3.sh

# Shigeru
cat << 'EOF' > /root/soal-3.sh
#!/bin/bash
ip route replace default via 192.233.4.153
ip route replace 192.233.4.88/29 via 192.233.4.158
EOF
chmod +x /root/soal-3.sh && bash /root/soal-3.sh

# Fuyutsuki
cat << 'EOF' > /root/soal-3.sh
#!/bin/bash
ip route replace default via 192.233.4.161
ip route replace 192.233.3.192/27 via 192.233.4.166
ip route replace 192.233.4.72/29 via 192.233.4.170
EOF
chmod +x /root/soal-3.sh && bash /root/soal-3.sh

# Router Leaf (masing-masing cukup 1 default route ke atas)
# Mari
cat << 'EOF' > /root/soal-3.sh
#!/bin/bash
ip route replace default via 192.233.4.113
EOF
chmod +x /root/soal-3.sh && bash /root/soal-3.sh

# Rei
cat << 'EOF' > /root/soal-3.sh
#!/bin/bash
ip route replace default via 192.233.4.117
EOF
chmod +x /root/soal-3.sh && bash /root/soal-3.sh

# Shinji
cat << 'EOF' > /root/soal-3.sh
#!/bin/bash
ip route replace default via 192.233.4.121
EOF
chmod +x /root/soal-3.sh && bash /root/soal-3.sh

# Kaworu
cat << 'EOF' > /root/soal-3.sh
#!/bin/bash
ip route replace default via 192.233.4.129
EOF
chmod +x /root/soal-3.sh && bash /root/soal-3.sh

# Kensuke
cat << 'EOF' > /root/soal-3.sh
#!/bin/bash
ip route replace default via 192.233.4.137
EOF
chmod +x /root/soal-3.sh && bash /root/soal-3.sh

# Ritsuko
cat << 'EOF' > /root/soal-3.sh
#!/bin/bash
ip route replace default via 192.233.4.141
EOF
chmod +x /root/soal-3.sh && bash /root/soal-3.sh

# Kaji
cat << 'EOF' > /root/soal-3.sh
#!/bin/bash
ip route replace default via 192.233.4.145
EOF
chmod +x /root/soal-3.sh && bash /root/soal-3.sh

# Misato
cat << 'EOF' > /root/soal-3.sh
#!/bin/bash
ip route replace default via 192.233.4.149
EOF
chmod +x /root/soal-3.sh && bash /root/soal-3.sh

# Makoto
cat << 'EOF' > /root/soal-3.sh
#!/bin/bash
ip route replace default via 192.233.4.157
EOF
chmod +x /root/soal-3.sh && bash /root/soal-3.sh

# Maya
cat << 'EOF' > /root/soal-3.sh
#!/bin/bash
ip route replace default via 192.233.4.165
EOF
chmod +x /root/soal-3.sh && bash /root/soal-3.sh

# Toji
cat << 'EOF' > /root/soal-3.sh
#!/bin/bash
ip route replace default via 192.233.4.169
EOF
chmod +x /root/soal-3.sh && bash /root/soal-3.sh

# --- 2. IP & Gateway Sementara pada 4 Node Uji (Soal 3 - 5) ---

# Armisael
ip addr flush dev eth0
ip addr add 192.233.4.83/29 dev eth0
ip route replace default via 192.233.4.81

# Lilith
ip addr flush dev eth0
ip addr add 192.233.4.74/29 dev eth0
ip route replace default via 192.233.4.73

# Sachiel
ip addr flush dev eth0
ip addr add 192.233.3.130/26 dev eth0
ip route replace default via 192.233.3.129

# Comm-Net
ip addr flush dev eth0
ip addr add 192.233.2.2/24 dev eth0
ip route replace default via 192.233.2.1

# --- 3. Pengujian Wajib dari Terminal Armisael ---
ping -c 3 192.233.4.74     # ke Lilith
ping -c 3 192.233.3.130    # ke Sachiel
ping -c 3 192.233.2.2      # ke Comm-Net