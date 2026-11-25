# tambahkan konfig di node balthasar

#!/bin/bash

# === ISI DENGAN IP ASLI KELOMPOK K44 ===
IP_CASPER="192.233.x.x"
IP_UNIT01="192.233.x.x"
IP_UNIT02="192.233.x.x"
IP_UNIT00="192.233.x.x"
IP_SACHIEL="192.233.x.x"

# 1. Bersihkan rule lama agar tidak dobel saat dijalankan ulang
iptables -F INPUT

# 2. Pastikan lalu lintas lain tidak terganggu
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

# 3. Izinkan loopback dan balasan koneksi keluar (ping 8.8.8.8, DNS, dll.)
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# 4. Izinkan hanya Casper dan semua Pilot ke TCP 5000 dan 5001
for IP in "$IP_CASPER" "$IP_UNIT01" "$IP_UNIT02" "$IP_UNIT00" "$IP_SACHIEL"; do
    iptables -A INPUT -p tcp -s "$IP" --dport 5000 -j ACCEPT
    iptables -A INPUT -p tcp -s "$IP" --dport 5001 -j ACCEPT
done

# 5. Tolak SEKETIKA semua sumber lain ke TCP 5000 dan 5001 (tidak menggantung/timeout)
iptables -A INPUT -p tcp --dport 5000 -j REJECT --reject-with tcp-reset
iptables -A INPUT -p tcp --dport 5001 -j REJECT --reject-with tcp-reset

#jalankan 

chmod +x /root/magi-balthasar.sh
bash /root/magi-balthasar.sh
iptables -L INPUT -n -v --line-numbers

# di balthasar jalankan listener di port 5000 dan 5001

while true; do nc -l -p 5000; done &
while true; do nc -l -p 5001; done &

#pengujian
# di unit - 01

echo "Unit-01 ke 5000" | nc -w 3 <IP_BALTHASAR> 5000; echo "exit=$?"
echo "Unit-01 ke 5001" | nc -w 3 <IP_BALTHASAR> 5001; echo "exit=$?"

# di lillith dan melchior

time nc -w 5 <IP_BALTHASAR> 5000 < /dev/null; echo "exit=$?"
time nc -w 5 <IP_BALTHASAR> 5001 < /dev/null; echo "exit=$?"

# uji di balthasar

ping -c 4 8.8.8.8

iptables -L INPUT -n -v

