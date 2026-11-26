# tambahkan di fuyutsuki bagian bawah

# === [Soal 17] Pengalihan TCP (DNAT + MASQUERADE) Casper -> Zeruel ke Pen-Pen ===
IP_CASPER="192.233.x.x"
IP_ZERUEL="192.233.x.x"
IP_PENPEN="192.233.x.x"

# 1. Bersihkan rule NAT lama agar tidak dobel saat script dijalankan ulang
iptables -t nat -F PREROUTING
iptables -t nat -F POSTROUTING

# 2. Pastikan IP forwarding aktif
sysctl -w net.ipv4.ip_forward=1 >/dev/null

# 3. DNAT: Alihkan semua trafik TCP dari Magi-Casper ke Zeruel agar menuju Pen-Pen
iptables -t nat -A PREROUTING -p tcp -s "$IP_CASPER" -d "$IP_ZERUEL" -j DNAT --to-destination "$IP_PENPEN"

# 4. SNAT/MASQUERADE: Ubah sumber ke IP Fuyutsuki agar balasan Pen-Pen pasti kembali lewat Fuyutsuki
#    (Tujuan di POSTROUTING sudah berubah menjadi IP_PENPEN)
iptables -t nat -A POSTROUTING -p tcp -s "$IP_CASPER" -d "$IP_PENPEN" -j MASQUERADE

# jalankan 

chmod +x /root/fuyutsuki.sh
bash /root/fuyutsuki.sh
iptables -t nat -L -n -v --line-numbers

# jalankan di pen-pen dan zeruel

nc -l -p 9000

# uji koneksi dari Casper ke Zeruel agar diteruskan ke Pen-Pen

nc <IP_ZERUEL> 9000

# di fuyutsuki

iptables -t nat -L -n -v

