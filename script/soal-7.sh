# ================================================================
# Skrip Konfigurasi & Layanan MAGI (Nomor 7)
# ================================================================

# --- 1. Jalankan di Magi-Casper (192.233.4.58) ---
cat << 'EOF' > /root/magi-casper.sh
#!/bin/bash
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y iptables netcat-traditional

# Hentikan listener lama jika ada
pkill -f "nc.traditional.*5000" 2>/dev/null || true

# Jalankan listener TCP port 5000 (persistent & log ke file + stdout)
nohup nc.traditional -lk -p 5000 >> /var/log/magi-casper-5000.log 2>&1 &
EOF
chmod +x /root/magi-casper.sh && bash /root/magi-casper.sh


# --- 2. Jalankan di Magi-Balthasar (192.233.4.59) ---
cat << 'EOF' > /root/magi-balthasar.sh
#!/bin/bash
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y iptables netcat-traditional

# Hentikan listener lama jika ada
pkill -f "nc.traditional.*5000" 2>/dev/null || true
pkill -f "nc.traditional.*5001" 2>/dev/null || true

# Jalankan listener TCP port 5000 dan 5001
nohup nc.traditional -lk -p 5000 >> /var/log/magi-balthasar-5000.log 2>&1 &
nohup nc.traditional -lk -p 5001 >> /var/log/magi-balthasar-5001.log 2>&1 &
EOF
chmod +x /root/magi-balthasar.sh && bash /root/magi-balthasar.sh


# --- 3. Jalankan di Magi-Melchior (192.233.4.60) ---
cat << 'EOF' > /root/magi-melchior.sh
#!/bin/bash
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y iptables netcat-traditional

# Hentikan listener lama jika ada
pkill -f "nc.traditional.*5000" 2>/dev/null || true

# Jalankan listener TCP port 5000
nohup nc.traditional -lk -p 5000 >> /var/log/magi-melchior-5000.log 2>&1 &
EOF
chmod +x /root/magi-melchior.sh && bash /root/magi-melchior.sh


# ================================================================
# Pengujian Wajib (Kirim Pesan dari Lilith & Cek Hasil)
# ================================================================

# --- 4. Jalankan di Lilith (192.233.4.74) ---
echo "Halo Casper dari Lilith (Port 5000)" | nc -w 2 192.233.4.58 5000
echo "Halo Balthasar dari Lilith (Port 5000)" | nc -w 2 192.233.4.59 5000
echo "Halo Balthasar Rahasia dari Lilith (Port 5001)" | nc -w 2 192.233.4.59 5001
echo "Halo Melchior dari Lilith (Port 5000)" | nc -w 2 192.233.4.60 5000

# --- 5. Tampilkan Pesan yang Diterima di Masing-Masing MAGI ---
# Di Magi-Casper:
cat /var/log/magi-casper-5000.log

# Di Magi-Balthasar:
cat /var/log/magi-balthasar-5000.log
cat /var/log/magi-balthasar-5001.log

# Di Magi-Melchior:
cat /var/log/magi-melchior-5000.log
