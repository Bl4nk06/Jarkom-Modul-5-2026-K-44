# ================================================================
# Interface (Copy-paste ke Network Configuration masing-masing node)
# ================================================================

# Quarters (A7 - Switch-Quarters | Gateway: Rei)
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.0.2
    netmask 255.255.254.0
    gateway 192.233.0.1
    up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Comm-Net (A11 - Switch-Comm | Gateway: Hikari)
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.2.2
    netmask 255.255.255.0
    gateway 192.233.2.1
    up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Hangar-Crew (A3 - Switch-Hangar | Gateway: Yui)
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.3.2
    netmask 255.255.255.128
    gateway 192.233.3.1
    up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Sachiel (A17 - Switch-Bunker | Gateway: Kensuke)
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.3.130
    netmask 255.255.255.192
    gateway 192.233.3.129
    up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Pen-Pen (A31 - Switch-Medic | Gateway: Maya)
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.3.194
    netmask 255.255.255.224
    gateway 192.233.3.193
    up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Medic-Bay (A31 - Switch-Medic | Gateway: Maya)
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.3.195
    netmask 255.255.255.224
    gateway 192.233.3.193
    up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Relay-Node (A13 - Switch-Relay | Gateway: Kaworu)
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.3.226
    netmask 255.255.255.224
    gateway 192.233.3.225
    up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Garden-Staff (A9 - Switch-Garden | Gateway: Shinji)
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.2
    netmask 255.255.255.224
    gateway 192.233.4.1
    up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Dock-Crew (A5 - Switch-Dock | Gateway: Mari)
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.34
    netmask 255.255.255.240
    gateway 192.233.4.33
    up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Entry-Plug (A19 - Switch-Lab | Gateway: Ritsuko)
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.50
    netmask 255.255.255.248
    gateway 192.233.4.49
    up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Dummy-Plug (A19 - Switch-Lab | Gateway: Ritsuko)
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.51
    netmask 255.255.255.248
    gateway 192.233.4.49
    up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Magi-Casper (A29 - Switch-Terminal | Gateway: Fuyutsuki)
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.58
    netmask 255.255.255.248
    gateway 192.233.4.57
    up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Magi-Balthasar (A29 - Switch-Terminal | Gateway: Fuyutsuki)
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.59
    netmask 255.255.255.248
    gateway 192.233.4.57
    up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Magi-Melchior (A29 - Switch-Terminal | Gateway: Fuyutsuki)
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.60
    netmask 255.255.255.248
    gateway 192.233.4.57
    up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Unit-01 (A23 - Switch-Cage | Gateway: Misato)
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.66
    netmask 255.255.255.248
    gateway 192.233.4.65
    up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Unit-02 (A23 - Switch-Cage | Gateway: Misato)
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.67
    netmask 255.255.255.248
    gateway 192.233.4.65
    up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Unit-00 (A23 - Switch-Cage | Gateway: Misato)
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.68
    netmask 255.255.255.248
    gateway 192.233.4.65
    up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Lilith (A33 - Switch-Dogma | Gateway: Toji)
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.74
    netmask 255.255.255.248
    gateway 192.233.4.73
    up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Adam (A33 - Switch-Dogma | Gateway: Toji)
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.75
    netmask 255.255.255.248
    gateway 192.233.4.73
    up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Zeruel (A25 - Switch-Monolith | Gateway: Shigeru)
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.82
    netmask 255.255.255.248
    gateway 192.233.4.81
    up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Armisael (A25 - Switch-Monolith | Gateway: Shigeru)
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.83
    netmask 255.255.255.248
    gateway 192.233.4.81
    up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Radar-Array (A27 - Switch-Radar | Gateway: Makoto)
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.90
    netmask 255.255.255.248
    gateway 192.233.4.89
    up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Archive-Vault (A15 - Switch-Archive | Gateway: Asuka)
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.98
    netmask 255.255.255.252
    gateway 192.233.4.97
    up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Spy (A21 - Switch-Intel | Gateway: Kaji)
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.102
    netmask 255.255.255.252
    gateway 192.233.4.101
    up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Tokyo3-Core (A1 - Switch-Cmd | Gateway: Gendou)
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.106
    netmask 255.255.255.252
    gateway 192.233.4.105
    up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# ================================================================
# Terminal (Opsional: Terapkan langsung tanpa restart & Verifikasi)
# ================================================================

# --- 1. Jalankan di tiap node jika belum restart container ---
ip addr flush dev eth0
ifdown eth0 2>/dev/null; ifup eth0

# --- 2. Pengujian Wajib di Unit-01 (setelah restart container) ---
ip -br a
ping -c 3 192.233.4.65
