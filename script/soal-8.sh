# ================================================================
# Skrip Konfigurasi & Layanan Normal (Nomor 8)
# ================================================================

# --- 1. Jalankan di Pen-Pen (192.233.3.194) ---
cat << 'EOF' > /root/pen-pen.sh
#!/bin/bash
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y iptables netcat-traditional

# Hentikan listener lama pada port 80 jika ada
pkill -f "nc.traditional.*80" 2>/dev/null || true

# Jalankan listener TCP port 80 yang membalas "Welcome to Pen-Pen"
nohup bash -c 'while true; do printf "Welcome to Pen-Pen\n" | nc.traditional -l -p 80 -q 1; done' >/dev/null 2>&1 &
EOF
chmod +x /root/pen-pen.sh && bash /root/pen-pen.sh


# --- 2. Jalankan di Tokyo3-Core (192.233.4.106) ---
cat << 'EOF' > /root/tokyo3-core.sh
#!/bin/bash
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y iptables netcat-traditional

# Hentikan listener lama pada port 80 & 8080 jika ada
pkill -f "nc.traditional.*80" 2>/dev/null || true
pkill -f "nc.traditional.*8080" 2>/dev/null || true

# Jalankan listener TCP port 80 ("Welcome to Tokyo3-Core") & port 8080 ("syifa imutz")
nohup bash -c 'while true; do printf "Welcome to Tokyo3-Core\n" | nc.traditional -l -p 80 -q 1; done' >/dev/null 2>&1 &
nohup bash -c 'while true; do printf "syifa imutz\n" | nc.traditional -l -p 8080 -q 1; done' >/dev/null 2>&1 &
EOF
chmod +x /root/tokyo3-core.sh && bash /root/tokyo3-core.sh


# ================================================================
# Pengujian Wajib (Jalankan di Lilith - 192.233.4.74)
# ================================================================

# 1. Uji koneksi ke ketiga port aktif (harus menampilkan jawaban sesuai ketentuan)
nc -w 2 192.233.3.194 80
nc -w 2 192.233.4.106 80
nc -w 2 192.233.4.106 8080

# 2. Uji port yang tidak dilayani (port 22) -> harus langsung gagal (Connection refused / exit code 1) tanpa menggantung
time nc -zv -w 2 192.233.3.194 22 ; echo "Exit code: $?"
time nc -zv -w 2 192.233.4.106 22 ; echo "Exit code: $?"
