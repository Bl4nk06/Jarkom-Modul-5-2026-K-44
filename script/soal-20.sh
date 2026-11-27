# di node fuyutsuki

iptables-save > /root/fuyutsuki.rules
ip route

# hapus semua rule

iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X

# Hapus semua rute statis/default (jangan hapus rute 'proto kernel')
ip route show | grep ' via ' | while read -r r; do ip route del $r; done

# Verifikasi kondisi kosong (bukti "dihancurkan")
iptables -S
iptables -t nat -S
ip route

# pemulihan

iptables-restore < /root/fuyutsuki.rules
bash /root/fuyutsuki.sh

echo "=== PEMULIHAN 1 ==="
echo "filter lines: $(iptables -S | wc -l)"
echo "nat lines   : $(iptables -t nat -S | wc -l)"
echo "route lines : $(ip route | wc -l)"

iptables-restore < /root/fuyutsuki.rules
bash /root/fuyutsuki.sh

echo "=== PEMULIHAN 2 ==="
echo "filter lines: $(iptables -S | wc -l)"
echo "nat lines   : $(iptables -t nat -S | wc -l)"
echo "route lines : $(ip route | wc -l)"

# di shigeru

iptables-save > /root/shigeru.rules
ip route

iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X

ip route show | grep ' via ' | while read -r r; do ip route del $r; done

iptables -S
iptables -t nat -S
ip route

# pemulihan

iptables-restore < /root/shigeru.rules
bash /root/shigeru.sh
echo "=== PEMULIHAN 1 ==="
echo "filter lines: $(iptables -S | wc -l)"
echo "nat lines   : $(iptables -t nat -S | wc -l)"
echo "route lines : $(ip route | wc -l)"

iptables-restore < /root/shigeru.rules
bash /root/shigeru.sh
echo "=== PEMULIHAN 2 ==="
echo "filter lines: $(iptables -S | wc -l)"
echo "nat lines   : $(iptables -t nat -S | wc -l)"
echo "route lines : $(ip route | wc -l)"

# di tokyo3

iptables-save > /root/tokyo3-core.rules
ip route

# hancurkan rules

iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X

ip route show | grep ' via ' | while read -r r; do ip route del $r; done

iptables -S
iptables -t nat -S
ip route

# uji pemulihan

iptables-restore < /root/tokyo3-core.rules
bash /root/tokyo3-core.sh
echo "=== PEMULIHAN 1 ==="
echo "filter lines: $(iptables -S | wc -l)"
echo "nat lines   : $(iptables -t nat -S | wc -l)"
echo "route lines : $(ip route | wc -l)"

iptables-restore < /root/tokyo3-core.rules
bash /root/tokyo3-core.sh
echo "=== PEMULIHAN 2 ==="
echo "filter lines: $(iptables -S | wc -l)"
echo "nat lines   : $(iptables -t nat -S | wc -l)"
echo "route lines : $(ip route | wc -l)"

