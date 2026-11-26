# tambahkan di tokyo3

#!/bin/bash

# === ISI DENGAN IP ASLI DUMMY-PLUG KELOMPOK K44 ===
IP_DUMMYPLUG="192.233.x.x"

# 1. Bersihkan rule lama agar tidak dobel saat dijalankan ulang
iptables -F INPUT

# 2. Policy default ACCEPT agar layanan port 80, 8080, dan trafik lain tetap aman
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

# 3. Izinkan trafik loopback
iptables -A INPUT -i lo -j ACCEPT

# 4. [Soal 15] Rate-limit ping masuk (ICMP echo-request) maks 5/detik
#    WAJIB di atas ESTABLISHED,RELATED
iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 5/second --limit-burst 5 -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-request -j DROP

# 5. Izinkan balasan koneksi keluar
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# 6. [Soal 16] Catat log (SCAN-NERV: ) lalu tolak SEKETIKA (REJECT)
#    koneksi TCP dari Dummy-Plug ke port 22, 23, dan 3306
for PORT in 22 23 3306; do
    iptables -A INPUT -p tcp -s "$IP_DUMMYPLUG" --dport "$PORT" -j LOG --log-prefix "SCAN-NERV: " --log-level 4
    iptables -A INPUT -p tcp -s "$IP_DUMMYPLUG" --dport "$PORT" -j REJECT --reject-with tcp-reset
done

# jalankan

chmod +x /root/tokyo3-core.sh
bash /root/tokyo3-core.sh
iptables -L INPUT -n -v --line-numbers

# di consol dummy-plug jalankan pengujian

time nc -w 5 <IP_TOKYO3> 22 < /dev/null; echo "exit=$?"
time nc -w 5 <IP_TOKYO3> 23 < /dev/null; echo "exit=$?"
time nc -w 5 <IP_TOKYO3> 3306 < /dev/null; echo "exit=$?"

# cek log di tokyo3-core

dmesg | grep "SCAN-NERV:" | tail -n 10

iptables -L INPUT -n -v

# uji dari dummy-plug ke port 80 dan 8080 agar tetap bisa diakses

nc -w 3 <IP_TOKYO3> 80 < /dev/null
nc -w 3 <IP_TOKYO3> 8080 < /dev/null