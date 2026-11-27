# pasang firewall di shigeru

# === [Soal 18] Gerbang Monolith dan Radar di Shigeru ===
IF_GENDO="eth0"                  # GANTI sesuai 'dev <ethX>' pada baris default route Shigeru
SUBNET_TERMINAL="192.233.x.x/y"  # GANTI sesuai CIDR dari 'ip route' di Magi-Casper

# 1. Bersihkan rule FORWARD lama agar tidak dobel saat script dijalankan ulang (penting untuk Soal 20)
iptables -F FORWARD

# 2. Policy default ACCEPT agar koneksi keluar dari Monolith/Radar & antar-zona tetap lancar
iptables -P FORWARD ACCEPT

# 3. Izinkan balasan koneksi yang dimulai DARI dalam zona (Monolith & Radar) ke luar
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# 4. Pengecualian: izinkan ping (ICMP echo-request) dari subnet Switch-Terminal yang masuk dari arah Gendo
iptables -A FORWARD -i "$IF_GENDO" -s "$SUBNET_TERMINAL" -p icmp --icmp-type echo-request -j ACCEPT

# 5. Tolak semua koneksi baru lainnya yang datang dari sisi Gendo (tanpa menuliskan subnet luar satu per satu)
iptables -A FORWARD -i "$IF_GENDO" -j DROP

# jalankan

chmod +x /root/<nama-script-shigeru>.sh
bash /root/<nama-script-shigeru>.sh
iptables -L FORWARD -n -v --line-numbers

# ping dari magi-casper 

ping -c 4 <IP_ZERUEL>

# ping dri lillith ke zeruel

ping -c 4 <IP_ZERUEL>

# di zeruel

ping -c 3 <IP_LILITH>
ping -c 3 8.8.8.8

# di radar-array

ping -c 3 8.8.8.8

