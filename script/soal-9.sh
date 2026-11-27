# perbaikan di shigeru

# 1. Aktifkan kembali IP Forwarding
sysctl -w net.ipv4.ip_forward=1

# 2. Hapus Policy-Based Routing sabotase (rule priority 90 & table 100)
ip rule del priority 90 2>/dev/null || true
ip route flush table 100 2>/dev/null || true

# 3. Hapus rute blackhole menuju Dogma (Lilith)
ip route del blackhole 192.233.4.72/29 2>/dev/null || true

# 4. Kembalikan default route Shigeru menuju Gendou (192.233.4.153)
ip route replace default via 192.233.4.153

# 5. Jalankan ulang skrip routing permanen Shigeru
bash /root/soal-3.sh
