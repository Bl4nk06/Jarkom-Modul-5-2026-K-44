# Tambahkan konfig berikut di node tokyo

#!/bin/bash

# 1. Bersihkan rule lama agar tidak dobel saat dijalankan ulang
iptables -F INPUT

# 2. Biarkan policy default ACCEPT agar layanan port 80, 8080, dan trafik lain tetap aman
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

# 3. Izinkan trafik loopback
iptables -A INPUT -i lo -j ACCEPT

# 4. Rate-limit ping masuk (ICMP echo-request) maksimal 5 paket/detik
#    WAJIB diletakkan SEBELUM rule ESTABLISHED,RELATED agar ping beruntun tidak lolos
iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 5/second --limit-burst 5 -j ACCEPT

# 5. Buang (DROP) sisa ping masuk yang melebihi batas agar counter pembuangan naik
iptables -A INPUT -p icmp --icmp-type echo-request -j DROP

# 6. Izinkan balasan koneksi keluar (termasuk echo-reply saat Tokyo3-Core ping keluar)
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# jalankan

chmod +x /root/tokyo3-core.sh
bash /root/tokyo3-core.sh
iptables -L INPUT -n -v --line-numbers

# Di Lilith: ping rapat -> tunggu 3 detik -> ping biasa
ping -i 0.1 -c 50 <IP_TOKYO3>
sleep 3
ping -c 5 <IP_TOKYO3>

# cek counter di tokyo dan uji ping

iptables -L INPUT -n -v

ping -c 10 -i 0.05 8.8.8.8
ss -tlnp | grep -E ':80|:8080'




