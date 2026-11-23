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
