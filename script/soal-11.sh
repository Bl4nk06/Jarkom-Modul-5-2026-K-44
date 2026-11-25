# Tambahkan konfig di magi-casper

nano /root/magi-casper.sh

#!/bin/bash

# 1. Bersihkan rule lama agar tidak dobel jika script dijalankan ulang
iptables -F

# 2. Pastikan policy default masih ACCEPT (sebelum masuk Soal 12)
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

# 3. Izinkan trafik loopback (localhost)
iptables -A INPUT -i lo -j ACCEPT

# 4. Izinkan balasan koneksi yang sudah ada (termasuk echo-reply saat Casper ping keluar)
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# 5. Blokir semua ping masuk (ICMP echo-request) dari mana pun, termasuk satu switch
iptables -A INPUT -p icmp --icmp-type echo-request -j DROP

# eksekusi

chmod +x /root/magi-casper.sh
bash /root/magi-casper.sh

#verif

iptables -S
iptables -L INPUT -n -v

# aktifkan listener

nc -l -p 5000

# pengujian
#Di console Magi-Balthasar:
ping -c 4 <IP_CASPER>
#Di console lillith:
ping -c 4 <IP_CASPER>

#Di console Magi-Casper:
ping -c 4 <IP_BALTHASAR>
ping -c 4 <IP_LILITH>

# dari lillith / balthasar
echo "tes casper port 5000" | nc -w 2 <IP_CASPER> 5000

