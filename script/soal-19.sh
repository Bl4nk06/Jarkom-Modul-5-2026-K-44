# tambahkan script firewall di shigeru

# === [Soal 18 & 19] Proteksi Zona Sensitif + Isolasi Total Armisael di Shigeru ===
IF_GENDO="eth0"
SUBNET_TERMINAL="192.233.x.x/y"  # tetap isi CIDR Switch-Terminal dari Soal 18
IP_ARMISAEL="192.233.4.83"       # GANTI sesuai hasil 'ip -br a' di Armisael

# 1. Bersihkan rule lama agar tidak dobel saat dijalankan ulang
iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD

# 2. Policy default ACCEPT
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

# 3. [Soal 19] Blokir komunikasi Armisael <-> Gateway (Shigeru)
iptables -A INPUT -s "$IP_ARMISAEL" -j DROP
iptables -A OUTPUT -d "$IP_ARMISAEL" -j DROP

# 4. [Soal 19] Blokir SEMUA trafik masuk & keluar Armisael melewati Shigeru
#    WAJIB di paling atas FORWARD (sebelum ESTABLISHED,RELATED dan pengecualian Terminal)
iptables -A FORWARD -s "$IP_ARMISAEL" -j DROP
iptables -A FORWARD -d "$IP_ARMISAEL" -j DROP

# 5. [Soal 18] Proteksi zona sensitif (Monolith & Radar)
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i "$IF_GENDO" -s "$SUBNET_TERMINAL" -p icmp --icmp-type echo-request -j ACCEPT
iptables -A FORWARD -i "$IF_GENDO" -j DROP

# jalankan

chmod +x /root/soal-3.sh
bash /root/soal-3.sh
iptables -L -n -v --line-numbers

# buat script /root/zeruel.sh di console Zeruel:

cat << 'EOF' > /root/zeruel.sh
#!/bin/bash

# === [Soal 19] Isolasi Armisael dari tetangga satu switch (Zeruel) ===
IP_ARMISAEL="192.233.4.83"  # GANTI sesuai hasil 'ip -br a' di Armisael

# 1. Bersihkan rule lama agar tidak dobel saat dijalankan ulang
iptables -F INPUT
iptables -F OUTPUT

# 2. Policy default ACCEPT agar akses Zeruel ke Seele, Lilith, dll. tetap normal
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT

# 3. Blokir semua lalu lintas masuk dan keluar antara Zeruel dan Armisael
iptables -A INPUT -s "$IP_ARMISAEL" -j DROP
iptables -A OUTPUT -d "$IP_ARMISAEL" -j DROP
EOF

chmod +x /root/zeruel.sh
bash /root/zeruel.sh
iptables -L -n -v --line-numbers

# nyalakan listener TCP port 9000 di Armisael, Zeruel, dan Lilith,

while true; do nc -l -p 9000; done &

# uji di armiasel

# Ke Seele (8.8.8.8, TCP 53)
ping -c 3 8.8.8.8
nc -v -w 3 8.8.8.8 53 < /dev/null; echo "exit=$?"

# Ke Zeruel (tetangga satu switch, TCP 9000)
ping -c 3 <IP_ZERUEL>
echo "tes armisael" | nc -v -w 3 <IP_ZERUEL> 9000; echo "exit=$?"

# Ke Lilith (TCP 9000)
ping -c 3 <IP_LILITH>
echo "tes armisael" | nc -v -w 3 <IP_LILITH> 9000; echo "exit=$?"

# Ke Gateway Shigeru (bukti isolasi gateway)
ping -c 3 192.233.4.81


# uji di zeruel
# Ke Seele (8.8.8.8, TCP 53)
ping -c 3 8.8.8.8
nc -v -w 3 8.8.8.8 53 < /dev/null; echo "exit=$?"

# Ke Lilith (TCP 9000)
ping -c 3 <IP_LILITH>
echo "halo dari Zeruel" | nc -v -w 3 <IP_LILITH> 9000; echo "exit=$?"
