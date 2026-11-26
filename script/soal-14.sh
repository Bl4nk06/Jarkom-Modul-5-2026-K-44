# tambahkan konfig ini di pen-pen

#!/bin/bash

# === VARIABEL JADWAL WAJIB (FORMAT UTC = WIB - 7 JAM) ===
PILOT_START="01:00"
PILOT_STOP="09:00"
PILOT_DAYS="Mon,Tue,Wed,Thu,Fri"
STAF_START="10:00"
STAF_STOP="16:00"

# === ISI DENGAN IP ASLI KELOMPOK K44 ===
IP_UNIT01="192.233.x.x"
IP_UNIT02="192.233.x.x"
IP_UNIT00="192.233.x.x"
IP_SACHIEL="192.233.x.x"

IP_LILITH="192.233.x.x"
IP_ADAM="192.233.x.x"

IP_DUMMYPLUG="192.233.x.x"
IP_ENTRYPLUG="192.233.x.x"
IP_SPY="192.233.x.x"

# 1. Bersihkan rule lama agar tidak dobel saat script dijalankan ulang
iptables -F INPUT

# 2. Policy default ACCEPT agar kategori "Lainnya" tetap bebas
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

# 3. Izinkan loopback dan balasan koneksi keluar dari Pen-Pen
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# 4. Aturan PILOT: hanya boleh ping & TCP 80 sesuai jadwal, di luar itu DROP
for IP in "$IP_UNIT01" "$IP_UNIT02" "$IP_UNIT00" "$IP_SACHIEL"; do
    iptables -A INPUT -s "$IP" -p icmp --icmp-type echo-request -m time --timestart "$PILOT_START" --timestop "$PILOT_STOP" --weekdays "$PILOT_DAYS" --utc -j ACCEPT
    iptables -A INPUT -s "$IP" -p tcp --dport 80 -m time --timestart "$PILOT_START" --timestop "$PILOT_STOP" --weekdays "$PILOT_DAYS" --utc -j ACCEPT
    iptables -A INPUT -s "$IP" -p icmp --icmp-type echo-request -j DROP
    iptables -A INPUT -s "$IP" -p tcp --dport 80 -j DROP
done

# 5. Aturan STAF GEOFRONT: hanya boleh ping & TCP 80 sesuai jadwal setiap hari, di luar itu DROP
for IP in "$IP_LILITH" "$IP_ADAM"; do
    iptables -A INPUT -s "$IP" -p icmp --icmp-type echo-request -m time --timestart "$STAF_START" --timestop "$STAF_STOP" --utc -j ACCEPT
    iptables -A INPUT -s "$IP" -p tcp --dport 80 -m time --timestart "$STAF_START" --timestop "$STAF_STOP" --utc -j ACCEPT
    iptables -A INPUT -s "$IP" -p icmp --icmp-type echo-request -j DROP
    iptables -A INPUT -s "$IP" -p tcp --dport 80 -j DROP
done

# 6. Aturan TERDUGA DUMMY SYSTEM: selalu ditolak untuk ping & TCP 80
for IP in "$IP_DUMMYPLUG" "$IP_ENTRYPLUG" "$IP_SPY"; do
    iptables -A INPUT -s "$IP" -p icmp --icmp-type echo-request -j DROP
    iptables -A INPUT -s "$IP" -p tcp --dport 80 -j DROP
done

# jalankan

chmod +x /root/pen-pen.sh
bash /root/pen-pen.sh
iptables -L INPUT -n -v

# jalankan di lillith , unit - 01 , dan spy

ping -c 3 <IP_PENPEN>

