#jalankan break_fw.sh di cesper

# perbarui script di cesper 

# 1. Perbaiki firewall DULU sebelum akses internet / apt-get
iptables -F INPUT
iptables -F OUTPUT
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --dport 5000 -j ACCEPT

# 2. Pastikan DNS resolver ada
echo "nameserver 8.8.8.8" > /etc/resolv.conf

echo 'Acquire::Check-Date "false";' > /etc/apt/apt.conf.d/99no-check-date

# jalankan 

chmod +x /root/magi-casper.sh
bash /root/magi-casper.sh

# nyalakan di cesper

nc -l -p 5000

# tes nc dar unit 00 ke cesper

echo "tes unit-00 ke casper" | nc -w 3 <IP_CASPER> 5000

# tes apt update di cesper

ping -c 4 8.8.8.8
apt-get update