# Jarkom-Modul-5-2026-K-44

link sps: https://docs.google.com/spreadsheets/d/1-mP5GT1M9KDlxcKpBtNkRUqrD9dem_2P/edit?usp=sharing&ouid=107487448307781723146&rtpof=true&sd=true

## Nomor 1 — Perancangan Topologi & Pembagian IP VLSM

### Ringkasan Konfigurasi & Perancangan
Pada tahap Nomor 1, topologi jaringan **Modul 5 Komda K-44** dibangun di GNS3 dengan router inti **Gendou** (terhubung ke **NAT1** di `eth0`) beserta 16 router bawahan (**Yui**, **Mari**, **Rei**, **Shinji**, **Hikari**, **Kaworu**, **Asuka**, **Kensuke**, **Ritsuko**, **Kaji**, **Misato**, **Shigeru**, **Makoto**, **Fuyutsuki**, **Maya**, dan **Toji**), switch, serta node *end-host* pada blok alamat `192.233.0.0/21` (`A1`–`A33`). Pembagian subnet menggunakan skema **VLSM** sesuai kebutuhan host pada tiap rute.

### Tabel Alokasi Subnet VLSM (`A1`–`A33`)

| Subnet | Rute / Topologi | Network ID | Netmask | Range IP | Broadcast |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `A1` | Gendou > Switch-Cmd > Tokyo3-Core | `192.233.4.104` | `255.255.255.252` | `192.233.4.105 - 192.233.4.106` | `192.233.4.107` |
| `A2` | Gendou > Yui | `192.233.4.108` | `255.255.255.252` | `192.233.4.109 - 192.233.4.110` | `192.233.4.111` |
| `A3` | Yui > Switch-Hangar > Hangar-Crew | `192.233.3.0` | `255.255.255.128` | `192.233.3.1 - 192.233.3.126` | `192.233.3.127` |
| `A4` | Yui > Mari | `192.233.4.112` | `255.255.255.252` | `192.233.4.113 - 192.233.4.114` | `192.233.4.115` |
| `A5` | Mari > Switch-Dock > Dock-Crew | `192.233.4.32` | `255.255.255.240` | `192.233.4.33 - 192.233.4.46` | `192.233.4.47` |
| `A6` | Yui > Rei | `192.233.4.116` | `255.255.255.252` | `192.233.4.117 - 192.233.4.118` | `192.233.4.119` |
| `A7` | Rei > Switch-Quarters > Quarters | `192.233.0.0` | `255.255.254.0` | `192.233.0.1 - 192.233.1.254` | `192.233.1.255` |
| `A8` | Yui > Shinji | `192.233.4.120` | `255.255.255.252` | `192.233.4.121 - 192.233.4.122` | `192.233.4.123` |
| `A9` | Shinji > Switch-Garden > Garden-Staff | `192.233.4.0` | `255.255.255.224` | `192.233.4.1 - 192.233.4.30` | `192.233.4.31` |
| `A10` | Gendou > Hikari | `192.233.4.124` | `255.255.255.252` | `192.233.4.125 - 192.233.4.126` | `192.233.4.127` |
| `A11` | Hikari > Switch-Comm > Comm-Net | `192.233.2.0` | `255.255.255.0` | `192.233.2.1 - 192.233.2.254` | `192.233.2.255` |
| `A12` | Hikari > Kaworu | `192.233.4.128` | `255.255.255.252` | `192.233.4.129 - 192.233.4.130` | `192.233.4.131` |
| `A13` | Kaworu > Switch-Relay > Relay-Node | `192.233.3.224` | `255.255.255.224` | `192.233.3.225 - 192.233.3.254` | `192.233.3.255` |
| `A14` | Gendou > Asuka | `192.233.4.132` | `255.255.255.252` | `192.233.4.133 - 192.233.4.134` | `192.233.4.135` |
| `A15` | Asuka > Switch-Archive > Archive-Vault | `192.233.4.96` | `255.255.255.252` | `192.233.4.97 - 192.233.4.98` | `192.233.4.99` |
| `A16` | Asuka > Kensuke | `192.233.4.136` | `255.255.255.252` | `192.233.4.137 - 192.233.4.138` | `192.233.4.139` |
| `A17` | Kensuke > Switch-Bunker > Sachiel | `192.233.3.128` | `255.255.255.192` | `192.233.3.129 - 192.233.3.190` | `192.233.3.191` |
| `A18` | Asuka > Ritsuko | `192.233.4.140` | `255.255.255.252` | `192.233.4.141 - 192.233.4.142` | `192.233.4.143` |
| `A19` | Ritsuko > Switch-Lab > Entry-Plug, Dummy-Plug | `192.233.4.48` | `255.255.255.248` | `192.233.4.49 - 192.233.4.54` | `192.233.4.55` |
| `A20` | Gendou > Kaji | `192.233.4.144` | `255.255.255.252` | `192.233.4.145 - 192.233.4.146` | `192.233.4.147` |
| `A21` | Kaji > Switch-Intel > Spy | `192.233.4.100` | `255.255.255.252` | `192.233.4.101 - 192.233.4.102` | `192.233.4.103` |
| `A22` | Gendou > Misato | `192.233.4.148` | `255.255.255.252` | `192.233.4.149 - 192.233.4.150` | `192.233.4.151` |
| `A23` | Misato > Switch-Cage > Unit-01, Unit-02, Unit-00 | `192.233.4.64` | `255.255.255.248` | `192.233.4.65 - 192.233.4.70` | `192.233.4.71` |
| `A24` | Gendou > Shigeru | `192.233.4.152` | `255.255.255.252` | `192.233.4.153 - 192.233.4.154` | `192.233.4.155` |
| `A25` | Shigeru > Switch-Monolith > Zeruel, Armisael | `192.233.4.80` | `255.255.255.248` | `192.233.4.81 - 192.233.4.86` | `192.233.4.87` |
| `A26` | Shigeru > Makoto | `192.233.4.156` | `255.255.255.252` | `192.233.4.157 - 192.233.4.158` | `192.233.4.159` |
| `A27` | Makoto > Switch-Radar > Radar-Array | `192.233.4.88` | `255.255.255.248` | `192.233.4.89 - 192.233.4.94` | `192.233.4.95` |
| `A28` | Gendou > Fuyutsuki | `192.233.4.160` | `255.255.255.252` | `192.233.4.161 - 192.233.4.162` | `192.233.4.163` |
| `A29` | Fuyutsuki > Switch-Terminal > Magi-Casper, Magi-Balthasar, Magi-Melchior | `192.233.4.56` | `255.255.255.248` | `192.233.4.57 - 192.233.4.62` | `192.233.4.63` |
| `A30` | Fuyutsuki > Maya | `192.233.4.164` | `255.255.255.252` | `192.233.4.165 - 192.233.4.166` | `192.233.4.167` |
| `A31` | Maya > Switch-Medic > Pen-Pen, Medic-Bay | `192.233.3.192` | `255.255.255.224` | `192.233.3.193 - 192.233.3.222` | `192.233.3.223` |
| `A32` | Fuyutsuki > Toji | `192.233.4.168` | `255.255.255.252` | `192.233.4.169 - 192.233.4.170` | `192.233.4.171` |
| `A33` | Toji > Switch-Dogma > Lilith, Adam | `192.233.4.72` | `255.255.255.248` | `192.233.4.73 - 192.233.4.78` | `192.233.4.79` |

### Verifikasi & Kendala
- Seluruh koneksi antar-router, switch, dan node telah dihubungkan sesuai gambar topologi (`topologi-modul-5.png`) dan tabel rute/VLSM (`K-44_Spreadsheet_Modul_5_Komda_Rute.csv` serta `K-44_Spreadsheet_Modul_5_Komda_Pembagian_IP_VLSM.csv`).
- Jika ada penyesuaian urutan port `ethX` pada node di GNS3, pemetaan alamat IP tetap mengacu pada tabel VLSM di atas.

## Nomor 2 — Konfigurasi Interface Router & IP Forwarding

### Ringkasan Konfigurasi
Pada tahap Nomor 2, seluruh 17 router (**Gendou**, **Yui**, **Mari**, **Rei**, **Shinji**, **Hikari**, **Kaworu**, **Asuka**, **Kensuke**, **Ritsuko**, **Kaji**, **Misato**, **Shigeru**, **Makoto**, **Fuyutsuki**, **Maya**, dan **Toji**) dipasang di GNS3 sesuai topologi[cite: 42]. Setiap router dikonfigurasi pada `/etc/network/interfaces` dengan detail berikut:
- **Gendou (`eth0`)** menggunakan `dhcp` untuk terhubung ke **NAT1**[cite: 42].
- Seluruh interface internal pada **Gendou (`eth1`–`eth8`)** serta 16 router lainnya diberi alamat IP `static` berdasarkan pembagian VLSM pada Nomor 1[cite: 41, 42].
- Fitur **IP Forwarding** diaktifkan secara otomatis saat interface naik melalui perintah `up sysctl -w net.ipv4.ip_forward=1`[cite: 42].

### Konfigurasi `/etc/network/interfaces` Tiap Router

#### 1. Gendou
```text
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp
    up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
    address 192.233.4.105
    netmask 255.255.255.252

auto eth2
iface eth2 inet static
    address 192.233.4.109
    netmask 255.255.255.252

auto eth3
iface eth3 inet static
    address 192.233.4.125
    netmask 255.255.255.252

auto eth4
iface eth4 inet static
    address 192.233.4.133
    netmask 255.255.255.252

auto eth5
iface eth5 inet static
    address 192.233.4.145
    netmask 255.255.255.252

auto eth6
iface eth6 inet static
    address 192.233.4.149
    netmask 255.255.255.252

auto eth7
iface eth7 inet static
    address 192.233.4.153
    netmask 255.255.255.252

auto eth8
iface eth8 inet static
    address 192.233.4.161
    netmask 255.255.255.252

```

#### 2. Cabang Yui (Yui, Mari, Rei, Shinji)

* **Yui**

```text
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.110
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
    address 192.233.3.1
    netmask 255.255.255.128

auto eth2
iface eth2 inet static
    address 192.233.4.113
    netmask 255.255.255.252

auto eth3
iface eth3 inet static
    address 192.233.4.117
    netmask 255.255.255.252

auto eth4
iface eth4 inet static
    address 192.233.4.121
    netmask 255.255.255.252

```

* **Mari**

```text
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.114
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
    address 192.233.4.33
    netmask 255.255.255.240

```

* **Rei**

```text
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.118
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
    address 192.233.0.1
    netmask 255.255.254.0

```

* **Shinji**

```text
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.122
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
    address 192.233.4.1
    netmask 255.255.255.224

```

#### 3. Cabang Hikari (Hikari, Kaworu)

* **Hikari**

```text
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.126
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
    address 192.233.2.1
    netmask 255.255.255.0

auto eth2
iface eth2 inet static
    address 192.233.4.129
    netmask 255.255.255.252

```

* **Kaworu**

```text
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.130
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
    address 192.233.3.225
    netmask 255.255.255.224

```

#### 4. Cabang Asuka (Asuka, Kensuke, Ritsuko)

* **Asuka**

```text
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.134
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
    address 192.233.4.97
    netmask 255.255.255.252

auto eth2
iface eth2 inet static
    address 192.233.4.137
    netmask 255.255.255.252

auto eth3
iface eth3 inet static
    address 192.233.4.141
    netmask 255.255.255.252

```

* **Kensuke**

```text
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.138
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
    address 192.233.3.129
    netmask 255.255.255.192

```

* **Ritsuko**

```text
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.142
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
    address 192.233.4.49
    netmask 255.255.255.248

```

#### 5. Cabang Kaji, Misato, & Shigeru (Kaji, Misato, Shigeru, Makoto)

* **Kaji**

```text
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.146
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
    address 192.233.4.101
    netmask 255.255.255.252

```

* **Misato**

```text
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.150
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
    address 192.233.4.65
    netmask 255.255.255.248

```

* **Shigeru**

```text
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.154
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
    address 192.233.4.81
    netmask 255.255.255.248

auto eth2
iface eth2 inet static
    address 192.233.4.157
    netmask 255.255.255.252

```

* **Makoto**

```text
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.158
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
    address 192.233.4.89
    netmask 255.255.255.248

```

#### 6. Cabang Fuyutsuki (Fuyutsuki, Maya, Toji)

* **Fuyutsuki**

```text
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.162
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
    address 192.233.4.57
    netmask 255.255.255.248

auto eth2
iface eth2 inet static
    address 192.233.4.165
    netmask 255.255.255.252

auto eth3
iface eth3 inet static
    address 192.233.4.169
    netmask 255.255.255.252

```

* **Maya**

```text
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.166
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
    address 192.233.3.193
    netmask 255.255.255.224

```

* **Toji**

```text
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.170
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
    address 192.233.4.73
    netmask 255.255.255.248

```

### Pengujian & Verifikasi

1. **Pengecekan Status Interface & IP Forwarding di Tiap Router**
Jalankan perintah berikut pada terminal masing-masing dari 17 router untuk memastikan seluruh interface berstatus `UP`, memiliki IP sesuai tabel VLSM, dan `ip_forward` bernilai `1`:
```bash
ip -br a
sysctl net.ipv4.ip_forward

```


2. **Pengujian Konektivitas Point-to-Point Antar-Link Router (16 Link)**
Lakukan `ping` antara dua ujung interface yang terhubung langsung dalam satu subnet `/30`:

| Link | Router Asal | Interface & IP Asal | Router Tujuan | Interface & IP Tujuan | Perintah Uji (`ping`) |
| --- | --- | --- | --- | --- | --- |
| `A2` | Gendou | `eth2` (`192.233.4.109`) | Yui | `eth0` (`192.233.4.110`) | `ping -c 3 192.233.4.110` |
| `A4` | Yui | `eth2` (`192.233.4.113`) | Mari | `eth0` (`192.233.4.114`) | `ping -c 3 192.233.4.114` |
| `A6` | Yui | `eth3` (`192.233.4.117`) | Rei | `eth0` (`192.233.4.118`) | `ping -c 3 192.233.4.118` |
| `A8` | Yui | `eth4` (`192.233.4.121`) | Shinji | `eth0` (`192.233.4.122`) | `ping -c 3 192.233.4.122` |
| `A10` | Gendou | `eth3` (`192.233.4.125`) | Hikari | `eth0` (`192.233.4.126`) | `ping -c 3 192.233.4.126` |
| `A12` | Hikari | `eth2` (`192.233.4.129`) | Kaworu | `eth0` (`192.233.4.130`) | `ping -c 3 192.233.4.130` |
| `A14` | Gendou | `eth4` (`192.233.4.133`) | Asuka | `eth0` (`192.233.4.134`) | `ping -c 3 192.233.4.134` |
| `A16` | Asuka | `eth2` (`192.233.4.137`) | Kensuke | `eth0` (`192.233.4.138`) | `ping -c 3 192.233.4.138` |
| `A18` | Asuka | `eth3` (`192.233.4.141`) | Ritsuko | `eth0` (`192.233.4.142`) | `ping -c 3 192.233.4.142` |
| `A20` | Gendou | `eth5` (`192.233.4.145`) | Kaji | `eth0` (`192.233.4.146`) | `ping -c 3 192.233.4.146` |
| `A22` | Gendou | `eth6` (`192.233.4.149`) | Misato | `eth0` (`192.233.4.150`) | `ping -c 3 192.233.4.150` |
| `A24` | Gendou | `eth7` (`192.233.4.153`) | Shigeru | `eth0` (`192.233.4.154`) | `ping -c 3 192.233.4.154` |
| `A26` | Shigeru | `eth2` (`192.233.4.157`) | Makoto | `eth0` (`192.233.4.158`) | `ping -c 3 192.233.4.158` |
| `A28` | Gendou | `eth8` (`192.233.4.161`) | Fuyutsuki | `eth0` (`192.233.4.162`) | `ping -c 3 192.233.4.162` |
| `A30` | Fuyutsuki | `eth2` (`192.233.4.165`) | Maya | `eth0` (`192.233.4.166`) | `ping -c 3 192.233.4.166` |
| `A32` | Fuyutsuki | `eth3` (`192.233.4.169`) | Toji | `eth0` (`192.233.4.170`) | `ping -c 3 192.233.4.170` |


3. **Bukti Screenshot**
* Output `ip -br a` dan `sysctl net.ipv4.ip_forward`

Gendou,Yui, Mari, Rei

![](./screenshots/ip-Gendou,Yui,%20Mari,%20Rei.png)


Shinji, Hikari, Kaworu, Asuka

![](./screenshots/ip-Shinji,Hikari,Kaworu,Asuka.png)


Kaji, Misato, Shigeru, Makoto

![](./screenshots/ip-Kaji,Misato,Shigeru,Makoto.png)


Fuyutsuki, Maya, Toji

![](./screenshots/ip-Fuyutsuki,Maya,Toji.png)


* Ping Point-to-Point


Dari Gendou ke Yui, Hikari, Asuka, Kaji, Misato, Shigeru, Fuyutsuki

![](./screenshots/Gendou-Yui,Hikari,Asuka,Kaji,Misato.png)

![](./screenshots/Gendou-Shigeru,Fuyutsuki.png)


Dari Yui ke Mari, Rei, Shinji

![](./screenshots/Yui-Mari,Rei,Shinji.png)


Dari Hikari ke Kaworu

![](./screenshots/Hikari-Kaworu.png)


Dari Asuka ke Kensuke dan Ritsuko

![](./screenshots/Asuka-Kensuke,Ritsuko.png)


Dari Shigeru ke Makoto

![](./screenshots/Shigeru-Makoto.png)


Dari Fuyutsuki ke Maya dan Toji

![](./screenshots/Fuyutsuki-Maya,Toji.png)

---

## Nomor 3 — Static Routing & CIDR Summarization

### Ringkasan Konfigurasi
Pada tahap Nomor 3, seluruh segmen jaringan yang terpisah dihubungkan menggunakan **static routing** dengan jumlah rute seminimal mungkin:
- **Gendou** mempertahankan *default route* otomatis dari `eth0` (DHCP menuju **NAT1**) dan memiliki rute statis ke setiap cabang di bawahnya.
- Subnet satu cabang yang bersebelahan dan dapat digabung tepat menjadi satu blok CIDR diringkas (*route summarization*):
  - **Cabang Yui:** `A4` (`192.233.4.112/30`) + `A6` (`192.233.4.116/30`) $\rightarrow$ `192.233.4.112/29`
  - **Cabang Asuka:** `A16` (`192.233.4.136/30`) + `A18` (`192.233.4.140/30`) $\rightarrow$ `192.233.4.136/29`
  - **Cabang Shigeru:** `A25` (`192.233.4.80/29`) + `A27` (`192.233.4.88/29`) $\rightarrow$ `192.233.4.80/28`
- **16 router lainnya** cukup memiliki **1 default route ke atas** serta rute statis ke subnet di bawahnya (khusus router ujung/*leaf* hanya memiliki 1 *default route* ke atas).
- Konfigurasi rute disimpan di `/root/soal-3.sh` pada tiap router dan dipanggil otomatis saat boot melalui `up bash /root/soal-3.sh` di `/etc/network/interfaces`.
- Untuk kebutuhan pengujian Nomor 3 hingga Nomor 5, 4 node uji (**Armisael**, **Lilith**, **Sachiel**, dan **Comm-Net**) diberi IP dan *default gateway* sementara.

### Tabel Rute Statis & CIDR Summarization

| Router | Tujuan Network / CIDR | Next-Hop (`via`) | Keterangan |
| :--- | :--- | :--- | :--- |
| **Gendou** | `192.233.0.0/23`, `192.233.3.0/25`, `192.233.4.0/27`, `192.233.4.32/28`, `192.233.4.112/29`, `192.233.4.120/30` | `192.233.4.110` | Cabang Yui (`A4`+`A6` diringkas ke `/29`) |
| **Gendou** | `192.233.2.0/24`, `192.233.3.224/27`, `192.233.4.128/30` | `192.233.4.126` | Cabang Hikari |
| **Gendou** | `192.233.3.128/26`, `192.233.4.48/29`, `192.233.4.96/30`, `192.233.4.136/29` | `192.233.4.134` | Cabang Asuka (`A16`+`A18` diringkas ke `/29`) |
| **Gendou** | `192.233.4.100/30` | `192.233.4.146` | Cabang Kaji |
| **Gendou** | `192.233.4.64/29` | `192.233.4.150` | Cabang Misato |
| **Gendou** | `192.233.4.80/28`, `192.233.4.156/30` | `192.233.4.154` | Cabang Shigeru (`A25`+`A27` diringkas ke `/28`) |
| **Gendou** | `192.233.3.192/27`, `192.233.4.56/29`, `192.233.4.72/29`, `192.233.4.164/30`, `192.233.4.168/30` | `192.233.4.162` | Cabang Fuyutsuki |
| **Yui** | `default` / `192.233.4.32/28` / `192.233.0.0/23` / `192.233.4.0/27` | `.109` / `.114` / `.118` / `.122` | Atas (Gendou) & bawah (Mari, Rei, Shinji) |
| **Hikari** | `default` / `192.233.3.224/27` | `.125` / `.130` | Atas (Gendou) & bawah (Kaworu) |
| **Asuka** | `default` / `192.233.3.128/26` / `192.233.4.48/29` | `.133` / `.138` / `.142` | Atas (Gendou) & bawah (Kensuke, Ritsuko) |
| **Shigeru** | `default` / `192.233.4.88/29` | `.153` / `.158` | Atas (Gendou) & bawah (Makoto) |
| **Fuyutsuki** | `default` / `192.233.3.192/27` / `192.233.4.72/29` | `.161` / `.166` / `.170` | Atas (Gendou) & bawah (Maya, Toji) |
| **Router Leaf** | `default` | IP ujung atas masing-masing | Mari, Rei, Shinji, Kaworu, Kensuke, Ritsuko, Kaji, Misato, Makoto, Maya, Toji |

### Pengalamatan Sementara 4 Node Uji (Soal 3–5)

| Node Uji | Subnet | IP Sementara | Gateway |
| :--- | :--- | :--- | :--- |
| **Armisael** | `A25` (`192.233.4.80/29`) | `192.233.4.83/29` | `192.233.4.81` |
| **Lilith** | `A33` (`192.233.4.72/29`) | `192.233.4.74/29` | `192.233.4.73` |
| **Sachiel** | `A17` (`192.233.3.128/26`) | `192.233.3.130/26` | `192.233.3.129` |
| **Comm-Net** | `A11` (`192.233.2.0/24`) | `192.233.2.2/24` | `192.233.2.1` |

### Skrip Konfigurasi (`/root/soal-3.sh`)

#### 1. Gendou
```bash
#!/bin/bash
# Cabang Yui (A4 + A6 diringkas ke 192.233.4.112/29)
ip route replace 192.233.0.0/23 via 192.233.4.110
ip route replace 192.233.3.0/25 via 192.233.4.110
ip route replace 192.233.4.0/27 via 192.233.4.110
ip route replace 192.233.4.32/28 via 192.233.4.110
ip route replace 192.233.4.112/29 via 192.233.4.110
ip route replace 192.233.4.120/30 via 192.233.4.110

# Cabang Hikari
ip route replace 192.233.2.0/24 via 192.233.4.126
ip route replace 192.233.3.224/27 via 192.233.4.126
ip route replace 192.233.4.128/30 via 192.233.4.126

# Cabang Asuka (A16 + A18 diringkas ke 192.233.4.136/29)
ip route replace 192.233.3.128/26 via 192.233.4.134
ip route replace 192.233.4.48/29 via 192.233.4.134
ip route replace 192.233.4.96/30 via 192.233.4.134
ip route replace 192.233.4.136/29 via 192.233.4.134

# Cabang Kaji & Misato
ip route replace 192.233.4.100/30 via 192.233.4.146
ip route replace 192.233.4.64/29 via 192.233.4.150

# Cabang Shigeru (A25 + A27 diringkas ke 192.233.4.80/28)
ip route replace 192.233.4.80/28 via 192.233.4.154
ip route replace 192.233.4.156/30 via 192.233.4.154

# Cabang Fuyutsuki
ip route replace 192.233.3.192/27 via 192.233.4.162
ip route replace 192.233.4.56/29 via 192.233.4.162
ip route replace 192.233.4.72/29 via 192.233.4.162
ip route replace 192.233.4.164/30 via 192.233.4.162
ip route replace 192.233.4.168/30 via 192.233.4.162

```

#### 2. Router Tengah (Yui, Hikari, Asuka, Shigeru, Fuyutsuki)

* **Yui**

```bash
#!/bin/bash
ip route replace default via 192.233.4.109
ip route replace 192.233.4.32/28 via 192.233.4.114
ip route replace 192.233.0.0/23 via 192.233.4.118
ip route replace 192.233.4.0/27 via 192.233.4.122

```

* **Hikari**

```bash
#!/bin/bash
ip route replace default via 192.233.4.125
ip route replace 192.233.3.224/27 via 192.233.4.130

```

* **Asuka**

```bash
#!/bin/bash
ip route replace default via 192.233.4.133
ip route replace 192.233.3.128/26 via 192.233.4.138
ip route replace 192.233.4.48/29 via 192.233.4.142

```

* **Shigeru**

```bash
#!/bin/bash
ip route replace default via 192.233.4.153
ip route replace 192.233.4.88/29 via 192.233.4.158

```

* **Fuyutsuki**

```bash
#!/bin/bash
ip route replace default via 192.233.4.161
ip route replace 192.233.3.192/27 via 192.233.4.166
ip route replace 192.233.4.72/29 via 192.233.4.170

```

#### 3. Router Leaf

```bash
# Mari      : ip route replace default via 192.233.4.113
# Rei       : ip route replace default via 192.233.4.117
# Shinji    : ip route replace default via 192.233.4.121
# Kaworu    : ip route replace default via 192.233.4.129
# Kensuke   : ip route replace default via 192.233.4.137
# Ritsuko   : ip route replace default via 192.233.4.141
# Kaji      : ip route replace default via 192.233.4.145
# Misato    : ip route replace default via 192.233.4.149
# Makoto    : ip route replace default via 192.233.4.157
# Maya      : ip route replace default via 192.233.4.165
# Toji      : ip route replace default via 192.233.4.169

```

### Pengujian & Verifikasi

1. **Pengecekan Tabel Routing di Router Utama & Cabang**
Jalankan `ip route` pada **Gendou**, **Yui**, **Hikari**, **Asuka**, **Shigeru**, dan **Fuyutsuki** untuk memverifikasi bahwa rute statis dan rute hasil *CIDR summarization* (`/29` dan `/28`) sudah terpasang dengan benar:
```bash
ip route

```


2. **Pengujian Konektivitas Antar-LAN dari Armisael**
Dari terminal **Armisael** (`192.233.4.83`), lakukan `ping` menuju **Lilith**, **Sachiel**, dan **Comm-Net**:
```bash
ping -c 3 192.233.4.74     # Armisael -> Lilith
ping -c 3 192.233.3.130    # Armisael -> Sachiel
ping -c 3 192.233.2.2      # Armisael -> Comm-Net

```


3. **Bukti Screenshot**
* Output `ip route` pada semua router

Gendou, Yui, Mari

![](./screenshots/route-Gendou,Yui,Mari.png)


Rei, Shinji, Hikari, Kaworu

![](./screenshots/route-Rei,Shinji,Hikari,Kaworu.png)


Asuka, Kensuke, Ritsuko, Kaji

![](./screenshots/route-Asuka,Kensuke,Ritsuko,Kaji.png)


Misato, Shigeru, Makoto, Fuyutsuki

![](./screenshots/route-Misato,Shigeru,Makoto,Fuyutsuki.png)

Maya dan Toji

![](./screenshots/route-Maya,Toji.png)


* Hasil `ping` dari Armisael ke Lilith, Sachiel, dan Comm-Net dengan status `0% packet loss`

![](./screenshots/Armisael-Lilith,Sachiel,CommNet.png)


---

## Nomor 4 — Akses Internet (NAT Masquerade) & DNS Resolver

### Ringkasan Konfigurasi
Pada tahap Nomor 4, seluruh jaringan internal (`192.233.0.0/21`) diberikan akses internet melalui router gerbang **Gendou** (`eth0` menuju **NAT1**) sebelum pemasangan paket dilakukan pada node lainnya. Konfigurasi diterapkan dengan ketentuan sebagai berikut:
- Menggunakan target **`MASQUERADE`** pada rantai `POSTROUTING` tabel `nat` agar translasi alamat IP menyesuaikan secara otomatis apabila alamat IP DHCP pada interface `eth0` (dari **NAT1**) berubah.
- Membatasi translasi alamat hanya untuk lalu lintas yang berasal dari blok prefix internal `-s 192.233.0.0/21` dan keluar melalui interface WAN `-o eth0`. Dengan demikian, komunikasi antar-LAN internal tidak terkena NAT dan tetap membawa alamat IP asli pengirim.
- Menambahkan konfigurasi DNS resolver (`192.168.122.1` dan `8.8.8.8`) pada `/etc/resolv.conf` agar seluruh node mampu melakukan resolusi nama domain (*domain name resolution*).
- Skrip disimpan pada `/root/soal-4.sh` di router **Gendou** dan dipanggil otomatis saat interface `eth0` aktif melalui perintah `up bash /root/soal-4.sh` di `/etc/network/interfaces`.

### Konfigurasi Interface & Skrip

#### 1. Konfigurasi `/etc/network/interfaces` pada Gendou (`eth0`)
```text
auto eth0
iface eth0 inet dhcp
    up sysctl -w net.ipv4.ip_forward=1
    up bash /root/soal-4.sh
```

#### 2. Skrip `/root/soal-4.sh` pada Gendou
```bash
#!/bin/bash
sysctl -w net.ipv4.ip_forward=1
iptables -t nat -F
iptables -t nat -A POSTROUTING -s 192.233.0.0/21 -o eth0 -j MASQUERADE
echo "nameserver 192.168.122.1" > /etc/resolv.conf
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
```

#### 3. Konfigurasi DNS Resolver (`/etc/resolv.conf`) pada Node Uji
```text
nameserver 192.168.122.1
nameserver 8.8.8.8
```

### Pengujian & Verifikasi

1. **Pengujian Koneksi Internet & Resolusi Nama Domain dari Armisael dan Lilith**
   Jalankan perintah `ping` ke IP publik (`8.8.8.8`) dan domain (`deb.debian.org`) dari terminal **Armisael** (`192.233.4.83`) dan **Lilith** (`192.233.4.74`) untuk memastikan koneksi keluar melalui NAT serta DNS resolver berfungsi:
   ```bash
   ping -c 3 8.8.8.8
   ping -c 3 deb.debian.org
   ```

2. **Verifikasi Counter Rule NAT pada Gendou**
   Jalankan perintah berikut pada terminal **Gendou** untuk memastikan aturan `MASQUERADE` aktif dengan source `192.233.0.0/21`, out-interface `eth0`, serta memastikan nilai kolom `pkts` dan `bytes` bertambah setelah pengujian `ping`:
   ```bash
   iptables -t nat -L POSTROUTING -n -v
   ```

3. **Bukti Screenshot**
   - Hasil `ping 8.8.8.8` dan `ping deb.debian.org` dari terminal **Armisael** dan **Lilith** dengan status `0% packet loss`

![](./screenshots/ping-Armisael,Lilith.png)

   - Output `iptables -t nat -L POSTROUTING -n -v` pada **Gendou** yang memperlihatkan rule `MASQUERADE` dan counter paket/byte yang bertambah

![](./screenshots/postmasq-gendou.png)

---

## Nomor 5 — Firewall Stateful pada Gerbang Gendou (`/root/gendou.sh`)

### Ringkasan Konfigurasi
Pada tahap Nomor 5, router gerbang **Gendou** diamankan menggunakan **stateful firewall** (`iptables`) untuk mengunci koneksi baru dari arah luar (**NAT1** / `eth0`) sekaligus memastikan seluruh konfigurasi pada **Nomor 2** (*IP forwarding*), **Nomor 3** (*static routing* & *CIDR summarization*), dan **Nomor 4** (*NAT masquerade* & *DNS resolver*) terpusat di dalam skrip `/root/gendou.sh` (serta *symlink* `/root/gendo.sh`).

Kebijakan dan aturan firewall yang diterapkan pada **Gendou**:
- **Default Policy:** Mengubah kebijakan default `INPUT` dan `FORWARD` menjadi **`DROP`**, sedangkan `OUTPUT` tetap **`ACCEPT`** sehingga koneksi baru yang masuk dari sisi **NAT1** (`eth0`) otomatis diblokir.
- **Loopback & DHCP Client:** Mengizinkan lalu lintas interface loopback (`-i lo`) dan paket balasan/pembaruan sewa DHCP dari server **NAT1** pada `eth0` (UDP port `67` $\rightarrow$ `68`).
- **Empat Akses yang Diizinkan:**
  - **(a) Balasan koneksi yang sudah ada:** Mengizinkan state `ESTABLISHED,RELATED` pada rantai `INPUT` dan `FORWARD`.
  - **(b) Traffic dari jaringan internal ke internet:** Mengizinkan paket dari blok internal `-s 192.233.0.0/21` yang keluar menuju `-o eth0` pada rantai `FORWARD`.
  - **(c) Traffic antar-LAN:** Mengizinkan lalu lintas dari `-s 192.233.0.0/21` menuju `-d 192.233.0.0/21` pada rantai `FORWARD`.
  - **(d) Traffic dari jaringan internal ke Gendou sendiri:** Mengizinkan akses dari `-s 192.233.0.0/21` pada rantai `INPUT`.

### Konfigurasi Interface & Skrip

#### 1. Konfigurasi `/etc/network/interfaces` pada Gendou (`eth8`)
```text
auto eth8
iface eth8 inet static
    address 192.233.4.161
    netmask 255.255.255.252
    up bash /root/gendou.sh
```

#### 2. Skrip Gabungan `/root/gendou.sh` (Soal 2 – Soal 5)
```bash
#!/bin/bash

# === SOAL 2: IP Forwarding ===
sysctl -w net.ipv4.ip_forward=1

# === SOAL 3: Static Routing & CIDR Summarization ===
# Cabang Yui (A4 + A6 diringkas ke 192.233.4.112/29)
ip route replace 192.233.0.0/23 via 192.233.4.110
ip route replace 192.233.3.0/25 via 192.233.4.110
ip route replace 192.233.4.0/27 via 192.233.4.110
ip route replace 192.233.4.32/28 via 192.233.4.110
ip route replace 192.233.4.112/29 via 192.233.4.110
ip route replace 192.233.4.120/30 via 192.233.4.110

# Cabang Hikari
ip route replace 192.233.2.0/24 via 192.233.4.126
ip route replace 192.233.3.224/27 via 192.233.4.126
ip route replace 192.233.4.128/30 via 192.233.4.126

# Cabang Asuka (A16 + A18 diringkas ke 192.233.4.136/29)
ip route replace 192.233.3.128/26 via 192.233.4.134
ip route replace 192.233.4.48/29 via 192.233.4.134
ip route replace 192.233.4.96/30 via 192.233.4.134
ip route replace 192.233.4.136/29 via 192.233.4.134

# Cabang Kaji & Misato
ip route replace 192.233.4.100/30 via 192.233.4.146
ip route replace 192.233.4.64/29 via 192.233.4.150

# Cabang Shigeru (A25 + A27 diringkas ke 192.233.4.80/28)
ip route replace 192.233.4.80/28 via 192.233.4.154
ip route replace 192.233.4.156/30 via 192.233.4.154

# Cabang Fuyutsuki
ip route replace 192.233.3.192/27 via 192.233.4.162
ip route replace 192.233.4.56/29 via 192.233.4.162
ip route replace 192.233.4.72/29 via 192.233.4.162
ip route replace 192.233.4.164/30 via 192.233.4.162
ip route replace 192.233.4.168/30 via 192.233.4.162

# === SOAL 4: NAT Masquerade & DNS Resolver ===
iptables -t nat -F
iptables -t nat -A POSTROUTING -s 192.233.0.0/21 -o eth0 -j MASQUERADE
echo "nameserver 192.168.122.1" > /etc/resolv.conf
echo "nameserver 8.8.8.8" >> /etc/resolv.conf

# === SOAL 5: Firewall Stateful pada Gendou ===
iptables -F
iptables -X

# Default Policy: kunci INPUT & FORWARD
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Loopback & DHCP dari NAT1 (eth0) tetap jalan
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -i eth0 -p udp --sport 67 --dport 68 -j ACCEPT

# (a) Izinkan balasan koneksi yang sudah ada
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# (b) Izinkan traffic dari jaringan internal ke internet (via eth0)
iptables -A FORWARD -s 192.233.0.0/21 -o eth0 -j ACCEPT

# (c) Izinkan traffic antar-LAN
iptables -A FORWARD -s 192.233.0.0/21 -d 192.233.0.0/21 -j ACCEPT

# (d) Izinkan traffic dari jaringan internal ke Gendou sendiri
iptables -A INPUT -s 192.233.0.0/21 -j ACCEPT
```

### Pengujian & Verifikasi

1. **Verifikasi Policy dan Aturan Firewall di Gendou**
   Jalankan perintah berikut pada terminal **Gendou** untuk menampilkan seluruh daftar aturan firewall beserta kebijakan default `-P INPUT DROP` dan `-P FORWARD DROP`:
   ```bash
   iptables -S
   ```

2. **Pengujian Akses Internet dari Armisael**
   Dari terminal **Armisael** (`192.233.4.83`), jalankan `ping` menuju `8.8.8.8` untuk memastikan lalu lintas internal keluar ke internet serta paket balasannya (`ESTABLISHED,RELATED`) tetap berjalan lancar setelah policy `FORWARD` diubah menjadi `DROP`:
   ```bash
   ping -c 3 8.8.8.8
   ```

3. **Pengujian Tambahan (Antar-LAN, Akses ke Gendou, & Blokir dari Luar)**
   - Dari **Armisael**, uji komunikasi antar-LAN ke **Lilith** dan akses langsung ke IP internal **Gendou**:
     ```bash
     ping -c 2 192.233.4.74     # Traffic antar-LAN
     ping -c 2 192.233.4.153    # Traffic internal ke Gendou
     ```
   - Jika dilakukan `ping` dari sisi luar (**NAT1**) menuju IP `eth0` milik **Gendou**, paket akan diblokir (`100% packet loss`) karena tidak ada aturan yang mengizinkan koneksi baru dari `eth0`.

4. **Bukti Screenshot**
   - Output `iptables -S` pada terminal **Gendou** dan hasil `ping -c 3 8.8.8.8` dari terminal **Armisael** dengan status `0% packet loss`

   ![](./screenshots/iptables,ping8888-Gendou,Armisael.png)

--- 

## Nomor 6 — Pengalamatan Statis Persisten pada Seluruh Node Non-Router

### Ringkasan Konfigurasi

Pada tahap Nomor 6, seluruh 25 node non-router (*end-host* / server) dikonfigurasi dengan alamat IP statis dan *default gateway* yang bersifat persisten (bertahan setelah container di-restart). Konfigurasi diterapkan dengan ketentuan berikut:

* **Aturan Pengalamatan:** Setiap gateway router menggunakan alamat IP *usable* pertama pada subnet masing-masing, sedangkan node di bawah switch diberikan alamat IP *usable* berikutnya secara berurutan dari kiri ke kanan sesuai topologi.
* **Persistensi & DNS:** Konfigurasi disimpan langsung pada `/etc/network/interfaces` di masing-masing container GNS3, dilengkapi baris `up echo "nameserver 8.8.8.8" > /etc/resolv.conf` agar konfigurasi IP, *default route*, dan resolusi DNS otomatis aktif setiap kali container di-restart.

### Tabel Alokasi IP & Gateway Seluruh Node Non-Router

| Subnet | Switch | Router Gateway | Nama Node | IP Address & Prefix | Netmask | Default Gateway |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **A7** | Switch-Quarters | Rei | **Quarters** | `192.233.0.2/23` | `255.255.254.0` | `192.233.0.1` |
| **A11** | Switch-Comm | Hikari | **Comm-Net** | `192.233.2.2/24` | `255.255.255.0` | `192.233.2.1` |
| **A3** | Switch-Hangar | Yui | **Hangar-Crew** | `192.233.3.2/25` | `255.255.255.128` | `192.233.3.1` |
| **A17** | Switch-Bunker | Kensuke | **Sachiel** | `192.233.3.130/26` | `255.255.255.192` | `192.233.3.129` |
| **A31** | Switch-Medic | Maya | **Pen-Pen** | `192.233.3.194/27` | `255.255.255.224` | `192.233.3.193` |
| **A31** | Switch-Medic | Maya | **Medic-Bay** | `192.233.3.195/27` | `255.255.255.224` | `192.233.3.193` |
| **A13** | Switch-Relay | Kaworu | **Relay-Node** | `192.233.3.226/27` | `255.255.255.224` | `192.233.3.225` |
| **A9** | Switch-Garden | Shinji | **Garden-Staff** | `192.233.4.2/27` | `255.255.255.224` | `192.233.4.1` |
| **A5** | Switch-Dock | Mari | **Dock-Crew** | `192.233.4.34/28` | `255.255.255.240` | `192.233.4.33` |
| **A19** | Switch-Lab | Ritsuko | **Entry-Plug** | `192.233.4.50/29` | `255.255.255.248` | `192.233.4.49` |
| **A19** | Switch-Lab | Ritsuko | **Dummy-Plug** | `192.233.4.51/29` | `255.255.255.248` | `192.233.4.49` |
| **A29** | Switch-Terminal | Fuyutsuki | **Magi-Casper** | `192.233.4.58/29` | `255.255.255.248` | `192.233.4.57` |
| **A29** | Switch-Terminal | Fuyutsuki | **Magi-Balthasar** | `192.233.4.59/29` | `255.255.255.248` | `192.233.4.57` |
| **A29** | Switch-Terminal | Fuyutsuki | **Magi-Melchior** | `192.233.4.60/29` | `255.255.255.248` | `192.233.4.57` |
| **A23** | Switch-Cage | Misato | **Unit-01** | `192.233.4.66/29` | `255.255.255.248` | `192.233.4.65` |
| **A23** | Switch-Cage | Misato | **Unit-02** | `192.233.4.67/29` | `255.255.255.248` | `192.233.4.65` |
| **A23** | Switch-Cage | Misato | **Unit-00** | `192.233.4.68/29` | `255.255.255.248` | `192.233.4.65` |
| **A33** | Switch-Dogma | Toji | **Lilith** | `192.233.4.74/29` | `255.255.255.248` | `192.233.4.73` |
| **A33** | Switch-Dogma | Toji | **Adam** | `192.233.4.75/29` | `255.255.255.248` | `192.233.4.73` |
| **A25** | Switch-Monolith | Shigeru | **Zeruel** | `192.233.4.82/29` | `255.255.255.248` | `192.233.4.81` |
| **A25** | Switch-Monolith | Shigeru | **Armisael** | `192.233.4.83/29` | `255.255.255.248` | `192.233.4.81` |
| **A27** | Switch-Radar | Makoto | **Radar-Array** | `192.233.4.90/29` | `255.255.255.248` | `192.233.4.89` |
| **A15** | Switch-Archive | Asuka | **Archive-Vault** | `192.233.4.98/30` | `255.255.255.252` | `192.233.4.97` |
| **A21** | Switch-Intel | Kaji | **Spy** | `192.233.4.102/30` | `255.255.255.252` | `192.233.4.101` |
| **A1** | Switch-Cmd | Gendou | **Tokyo3-Core** | `192.233.4.106/30` | `255.255.255.252` | `192.233.4.105` |

### Contoh Konfigurasi `/etc/network/interfaces` (Node Unit-01)

Setiap node menggunakan struktur `/etc/network/interfaces` yang serupa dengan parameter IP, netmask, dan gateway yang disesuaikan berdasarkan tabel di atas:

```text
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.233.4.66
    netmask 255.255.255.248
    gateway 192.233.4.65
    up echo "nameserver 8.8.8.8" > /etc/resolv.conf
```

### Pengujian & Verifikasi

1. **Uji Persistensi Konfigurasi Setelah Restart**
   Lakukan *Stop* dan *Start* (restart) pada container node di GNS3 untuk memastikan konfigurasi `/etc/network/interfaces` termuat otomatis saat *booting* tanpa perlu konfigurasi ulang di terminal.

2. **Verifikasi Interface & Koneksi ke Gateway di Unit-01**
   Buka terminal **Unit-01** setelah node menyala kembali, lalu jalankan perintah berikut untuk mengecek alamat IP interface `eth0` dan konektivitas menuju router gateway **Misato** (`192.233.4.65`):

   ```bash
   ip -br a
   ping -c 3 192.233.4.65
   ```

3. **Pengujian Tambahan (Konektivitas Antar-Node & Internet)**
   Pastikan node yang baru dikonfigurasi juga mampu menjangkau subnet lain dan internet:

   ```bash
   ping -c 2 192.233.4.74     # Uji ke Lilith
   ping -c 2 8.8.8.8          # Uji ke Internet via Gendou
   ```

4. **Bukti Screenshot**
   * Output `ip -br a` dan `ping -c 3 192.233.4.65` pada terminal **Unit-01**, Ping Lilith dari Sachiel, dan Ping Internet dari Lilith setelah container di-restart

   ![](./screenshots/persistent-Unit01,Sachiel,Lilith.png)

--- 

## Nomor 7 — Aktivasi Layanan & Listener TCP pada Node MAGI

### Ringkasan Konfigurasi

Pada tahap Nomor 7, ketiga server inti **MAGI** di **Switch-Terminal** (**Magi-Casper**, **Magi-Balthasar**, dan **Magi-Melchior**) diaktifkan untuk mulai melayani koneksi jaringan sesuai dengan ketentuan port pada glosarium:

* **Instalasi Paket:** Setiap node memasang paket `iptables` dan `netcat-traditional` menggunakan skrip yang disimpan pada direktori `/root/` (`/root/magi-casper.sh`, `/root/magi-balthasar.sh`, dan `/root/magi-melchior.sh`).

* **Listener TCP Persisten:** Menggunakan `nc.traditional -lk -p <port>` yang dijalankan di latar belakang (*background*) agar layanan tetap mendengarkan koneksi masuk meskipun sesi klien sebelumnya telah ditutup, serta menyimpan log pesan masuk ke `/var/log/`.

### Rincian Port Layanan Node MAGI

| Nama Node | Alamat IP | Port TCP | Skrip Konfigurasi | File Log Penerima |
| :--- | :--- | :--- | :--- | :--- |
| **Magi-Casper** | `192.233.4.58` | `5000` | `/root/magi-casper.sh` | `/var/log/magi-casper-5000.log` |
| **Magi-Balthasar** | `192.233.4.59` | `5000`, `5001` | `/root/magi-balthasar.sh` | `/var/log/magi-balthasar-5000.log`<br>`/var/log/magi-balthasar-5001.log` |
| **Magi-Melchior** | `192.233.4.60` | `5000` | `/root/magi-melchior.sh` | `/var/log/magi-melchior-5000.log` |

### Skrip Konfigurasi

#### 1. Skrip `/root/magi-casper.sh` (Magi-Casper — `192.233.4.58`)

```bash
#!/bin/bash
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y iptables netcat-traditional

pkill -f "nc.traditional.*5000" 2>/dev/null || true
nohup nc.traditional -lk -p 5000 >> /var/log/magi-casper-5000.log 2>&1 &
```

#### 2. Skrip `/root/magi-balthasar.sh` (Magi-Balthasar — `192.233.4.59`)

```bash
#!/bin/bash
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y iptables netcat-traditional

pkill -f "nc.traditional.*5000" 2>/dev/null || true
pkill -f "nc.traditional.*5001" 2>/dev/null || true
nohup nc.traditional -lk -p 5000 >> /var/log/magi-balthasar-5000.log 2>&1 &
nohup nc.traditional -lk -p 5001 >> /var/log/magi-balthasar-5001.log 2>&1 &
```

#### 3. Skrip `/root/magi-melchior.sh` (Magi-Melchior — `192.233.4.60`)

```bash
#!/bin/bash
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y iptables netcat-traditional

pkill -f "nc.traditional.*5000" 2>/dev/null || true
nohup nc.traditional -lk -p 5000 >> /var/log/magi-melchior-5000.log 2>&1 &
```

### Pengujian & Verifikasi

1. **Verifikasi Port Listener Aktif di Tiap Node MAGI**
   Jalankan perintah berikut pada terminal **Magi-Casper**, **Magi-Balthasar**, dan **Magi-Melchior** untuk memastikan proses `nc.traditional` berstatus `LISTEN` pada port `5000` (dan `5001` khusus pada Balthasar):

   ```bash
   ss -tlpn
   ```

2. **Pengiriman Pesan Uji dari Terminal Lilith (`192.233.4.74`)**
   Kirimkan pesan teks menggunakan `nc` menuju port `5000` pada ketiga node MAGI serta ke port `5001` pada **Magi-Balthasar**:

   ```bash
   echo "Halo Casper dari Lilith (Port 5000)" | nc -w 2 192.233.4.58 5000
   echo "Halo Balthasar dari Lilith (Port 5000)" | nc -w 2 192.233.4.59 5000
   echo "Halo Balthasar Rahasia dari Lilith (Port 5001)" | nc -w 2 192.233.4.59 5001
   echo "Halo Melchior dari Lilith (Port 5000)" | nc -w 2 192.233.4.60 5000
   ```

3. **Menampilkan Pesan yang Diterima pada Masing-Masing Node MAGI**
   Periksa isi file log pada setiap node untuk memastikan seluruh pesan dari **Lilith** berhasil diterima:

   * **Di Magi-Casper:**
     ```bash
     cat /var/log/magi-casper-5000.log
     ```

   * **Di Magi-Balthasar:**
     ```bash
     cat /var/log/magi-balthasar-5000.log
     cat /var/log/magi-balthasar-5001.log
     ```

   * **Di Magi-Melchior:**
     ```bash
     cat /var/log/magi-melchior-5000.log
     ```

4. **Bukti Screenshot**

   * Pengiriman pesan dari terminal **Lilith** dan output pesan yang diterima pada terminal **Magi-Casper**, **Magi-Balthasar** port `5000` & `5001`, serta **Magi-Melchior**

   ![](./screenshots/Lilith-Magi-Casper,Balthasar,Melchior.png)

--- 

## Nomor 8 — Mengenali Kondisi Normal (Pen-Pen & Tokyo3-Core)

### Ringkasan Konfigurasi

Pada tahap Nomor 8, node **Pen-Pen** (`192.233.3.194`) dan **Tokyo3-Core** (`192.233.4.106`) dikonfigurasi untuk melayani koneksi TCP pada port tertentu sebagai *baseline* kondisi normal sebelum aturan firewall proteksi diterapkan:

* **Instalasi Paket:** Kedua node memasang paket `iptables` dan `netcat-traditional` menggunakan skrip pada direktori `/root/` (`/root/pen-pen.sh` dan `/root/tokyo3-core.sh`).
* **Layanan Banner Otomatis:** Menggunakan *loop* `while true; do printf "..." | nc.traditional -l -p <port> -q 1; done` di latar belakang (*background*) agar setiap koneksi masuk langsung dijawab sesuai spesifikasi dan *listener* otomatis aktif kembali untuk melayani permintaan berikutnya:
  * **Pen-Pen** (`192.233.3.194`) port `80` menjawab: `Welcome to Pen-Pen`
  * **Tokyo3-Core** (`192.233.4.106`) port `80` menjawab: `Welcome to Tokyo3-Core`
  * **Tokyo3-Core** (`192.233.4.106`) port `8080` menjawab: `syifa imutz`
* **Kondisi Port Tertutup (Baseline):** Port yang tidak memiliki layanan aktif (misalnya port `22`) secara default akan langsung menolak koneksi baru dengan mengirimkan paket `TCP RST` (*Connection refused*), sehingga klien langsung menerima status gagal secara instan tanpa menggantung (*timeout*).

### Rincian Layanan Node Target

| Nama Node | Alamat IP | Port TCP | Respon Layanan | Skrip Konfigurasi |
| :--- | :--- | :--- | :--- | :--- |
| **Pen-Pen** | `192.233.3.194` | `80` | `Welcome to Pen-Pen` | `/root/pen-pen.sh` |
| **Tokyo3-Core** | `192.233.4.106` | `80` | `Welcome to Tokyo3-Core` | `/root/tokyo3-core.sh` |
| **Tokyo3-Core** | `192.233.4.106` | `8080` | `syifa imutz` | `/root/tokyo3-core.sh` |

### Skrip Konfigurasi

#### 1. Skrip `/root/pen-pen.sh` (Pen-Pen — `192.233.3.194`)

```bash
#!/bin/bash
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y iptables netcat-traditional

pkill -f "nc.traditional.*80" 2>/dev/null || true
nohup bash -c 'while true; do printf "Welcome to Pen-Pen\n" | nc.traditional -l -p 80 -q 1; done' >/dev/null 2>&1 &
```

#### 2. Skrip `/root/tokyo3-core.sh` (Tokyo3-Core — `192.233.4.106`)

```bash
#!/bin/bash
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y iptables netcat-traditional

pkill -f "nc.traditional.*80" 2>/dev/null || true
pkill -f "nc.traditional.*8080" 2>/dev/null || true
nohup bash -c 'while true; do printf "Welcome to Tokyo3-Core\n" | nc.traditional -l -p 80 -q 1; done' >/dev/null 2>&1 &
nohup bash -c 'while true; do printf "syifa imutz\n" | nc.traditional -l -p 8080 -q 1; done' >/dev/null 2>&1 &
```

### Pengujian & Verifikasi

1. **Verifikasi Port Listener Aktif pada Pen-Pen & Tokyo3-Core**
   Jalankan perintah berikut pada terminal **Pen-Pen** dan **Tokyo3-Core** untuk memastikan port `80` (dan `8080` pada Tokyo3-Core) berstatus `LISTEN`, sementara port `22` tidak aktif:

   ```bash
   ss -tlpn
   ```

2. **Pengujian Koneksi ke Ketiga Port Aktif dari Terminal Lilith (`192.233.4.74`)**
   Jalankan `nc` dari **Lilith** menuju masing-masing port layanan untuk memastikan jawaban *banner* yang diterima sesuai ketentuan:

   ```bash
   nc -w 2 192.233.3.194 80
   nc -w 2 192.233.4.106 80
   nc -w 2 192.233.4.106 8080
   ```

3. **Pengujian Port yang Tidak Dilayani (Port `22`) dari Terminal Lilith**
   Jalankan perintah berikut dari **Lilith** untuk membuktikan bahwa koneksi menuju port `22` pada **Pen-Pen** dan **Tokyo3-Core** langsung gagal seketika (*Connection refused* / `Exit code: 1`) dalam hitungan milidetik tanpa menggantung hingga batas *timeout* `-w 2`:

   ```bash
   time nc -zv -w 2 192.233.3.194 22 ; echo "Exit code: $?"
   time nc -zv -w 2 192.233.4.106 22 ; echo "Exit code: $?"
   ```

4. **Bukti Screenshot**

   * Hasil `nc` dari terminal **Lilith** ke port `80` Pen-Pen (`Welcome to Pen-Pen`), port `80` Tokyo3-Core (`Welcome to Tokyo3-Core`), dan port `8080` Tokyo3-Core (`syifa imutz`) dan juga hasil pengujian `time nc -zv -w 2 ... 22` dari terminal **Lilith** yang menunjukkan koneksi langsung gagal (`Connection refused` / `Exit code: 1`) dalam waktu sangat singkat

   ![](./screenshots/nc,time-Lilith-Tokyo3,PenPen.png)

--- 

## Nomor 9 — Sabotase Jalur Routing di Sekitar Shigeru (`break_routing.sh`)

### Analisis Penyebab Gejala & Kerusakan
Setelah skrip `break_routing.sh` dijalankan pada router **Shigeru**, ditemukan **empat titik kerusakan** yang menyebabkan lalu lintas dari **Lilith** (`192.233.4.74`) ke **Armisael** (`192.233.4.83`) terputus sementara **Armisael** masih dapat mem-ping gateway-nya sendiri (`192.233.4.81`):

1. **IP Forwarding Dinonaktifkan (`net.ipv4.ip_forward = 0`):**
   Skrip menimpa `/proc/sys/net/ipv4/ip_forward` menjadi `0`. Akibatnya, Shigeru berhenti meneruskan paket antar-interface. Armisael tetap bisa mem-ping gateway-nya (`192.233.4.81`) karena berada dalam satu segmen Layer 2 (*Switch-Monolith*), namun seluruh paket lintas subnet langsung ditolak oleh kernel Shigeru.
2. **Default Route Dibelokkan ke Makoto:**
   Rute default pada Shigeru diubah dari **Gendou** (`192.233.4.153`) menjadi ke arah bawah menuju **Makoto** (`192.233.4.158`), menyebabkan *routing loop* dan hilangnya jalur keluar menuju jaringan atas.
3. **Blackhole Route ke Subnet Dogma (`192.233.4.72/29`):**
   Skrip menyisipkan rute `blackhole 192.233.4.72/29` di tabel routing `main` Shigeru, sehingga paket balasan ICMP *Echo Reply* dari Armisael yang ditujukan ke Lilith (`192.233.4.74`) langsung dibuang secara diam-diam.
4. **Policy-Based Routing (`ip rule` + Tabel `100` `unreachable`):**
   Skrip menambahkan aturan kebijakan `iif eth1 lookup 100 priority 90` yang mengarahkan semua paket masuk dari LAN *Switch-Monolith* (`eth1`) ke tabel routing `100` berisi `unreachable default`, sehingga paket diblokir sebelum sempat membaca tabel routing `main`.

### Langkah Perbaikan pada Router Shigeru
Jalankan perintah berikut pada terminal **Shigeru** untuk membersihkan seluruh jejak sabotase dan memulihkan konfigurasi awal:

```bash
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
```

### Pengujian & Verifikasi Nomor 9
1. **Verifikasi Status Routing & Rule pada Shigeru**
   Pastikan `ip_forward` bernilai `1`, `ip rule` kembali bersih, dan tabel routing `ip route` tidak lagi memuat rute `blackhole`:
   ```bash
   sysctl net.ipv4.ip_forward
   ip rule show
   ip route
   ```

2. **Pengujian Konektivitas dari Lilith (`192.233.4.74`) ke Armisael (`192.233.4.83`)**
   Jalankan perintah `ping` dari terminal **Lilith** menuju **Armisael**:
   ```bash
   ping -c 3 192.233.4.83
   ```

3. **Bukti Screenshot**
   - *(Lampirkan screenshot saat menjalankan `break_routing.sh` dan kondisi `ping` gagal sebelum diperbaiki)*
   - *(Lampirkan screenshot output `sysctl`, `ip rule`, `ip route` di **Shigeru** serta hasil `ping -c 3 192.233.4.83` dari **Lilith** dengan status `0% packet loss`)*

---

## Nomor 10 — Sabotase NAT pada Misato dan Gendou (`break_nat.sh`)

### Analisis Penyebab Gejala & Kerusakan
Setelah skrip `break_nat.sh` dijalankan pada router **Misato** dan **Gendou**, ditemukan **dua aturan sabotase NAT** pada rantai `POSTROUTING` tabel `nat`:

1. **Pada Router Misato (SNAT Palsu ke `172.31.99.1`):**
   ```bash
   iptables -t nat -A POSTROUTING -s 192.233.4.64/29 ! -d 192.233.0.0/16 -o eth0 -j SNAT --to-source 172.31.99.1
   ```
   Setiap paket dari subnet *Switch-Cage* (`192.233.4.64/29`) yang menuju ke luar jaringan internal (`! -d 192.233.0.0/16`) diterjemahkan alamat sumbernya secara keliru menjadi `172.31.99.1` sebelum mencapai Gendou.
2. **Pada Router Gendou (Pengecualian `RETURN` di Urutan Pertama):**
   ```bash
   iptables -t nat -I POSTROUTING 1 -s 192.233.4.64/29 -o eth0 -j RETURN
   ```
   Aturan ini disisipkan pada baris paling atas (`index 1`) rantai `POSTROUTING` Gendou. Akibatnya, paket dari subnet *Switch-Cage* (`192.233.4.64/29`) langsung keluar dari rantai `POSTROUTING` tanpa pernah menyentuh aturan `MASQUERADE` di baris bawahnya, sehingga alamat privat `192.233.4.66` keluar ke **NAT1** tanpa diterjemahkan.

### Jawaban Pertanyaan Analisis
- **Mengapa Cage terdampak tetapi Intel (Spy) tidak, dan mengapa ping dari Cage ke Lilith tetap normal?**
  1. **Cage terdampak ke internet (`8.8.8.8`):** Karena kedua aturan sabotase (`SNAT --to-source 172.31.99.1` di Misato dan `-j RETURN` di Gendou) secara spesifik hanya menargetkan prefix sumber `-s 192.233.4.64/29` milik subnet *Switch-Cage* (`Unit-01`, `Unit-02`, `Unit-00`).
  2. **Intel (`Spy`) tidak terdampak:** Karena `Spy` (`192.233.4.102/30`) berada di bawah cabang router **Kaji** (`192.233.4.100/30`), sehingga tidak melewati router Misato maupun mencocokkan filter `-s 192.233.4.64/29` pada Gendou.
  3. **Ping dari Cage ke Lilith tetap normal:** Karena aturan di Misato memiliki pengecualian `! -d 192.233.0.0/16` dan aturan di Gendou hanya berlaku untuk interface keluar `-o eth0` (WAN), lalu lintas antar-LAN menuju **Lilith** (`192.233.4.74`) tidak tersentuh kedua rule tersebut.
- **Di router mana alamat sumber diterjemahkan?**
  Alamat sumber jaringan internal diterjemahkan (menggunakan `MASQUERADE`) di router gerbang utama **Gendou** pada interface keluar `eth0` yang terhubung langsung ke **NAT1**.

### Langkah Perbaikan pada Router Misato dan Gendou
Jalankan perintah berikut untuk menghapus masing-masing aturan sabotase:

1. **Pada Router Misato:**
   ```bash
   iptables -t nat -D POSTROUTING -s 192.233.4.64/29 ! -d 192.233.0.0/16 -o eth0 -j SNAT --to-source 172.31.99.1
   ```

2. **Pada Router Gendou:**
   ```bash
   iptables -t nat -D POSTROUTING -s 192.233.4.64/29 -o eth0 -j RETURN
   ```
   *(Atau jalankan ulang `bash /root/gendou.sh` pada Gendou agar tabel `nat` di-flush dan dibangun ulang secara bersih).*

### Pengujian & Verifikasi Nomor 10
1. **Verifikasi Tabel NAT pada Misato dan Gendou**
   Pastikan tabel `nat` pada **Misato** sudah kosong dan pada **Gendou** hanya menyisakan rule `MASQUERADE -s 192.233.0.0/21 -o eth0`:
   ```bash
   iptables -t nat -S
   ```

2. **Pengujian Konektivitas Internet dari Unit-01 (`192.233.4.66`)**
   Jalankan `ping` menuju `8.8.8.8` dari terminal **Unit-01**:
   ```bash
   ping -c 3 8.8.8.8
   ```

3. **Bukti Screenshot**
   - *(Lampirkan screenshot output `iptables -t nat -S` pada **Misato** dan **Gendou** sebelum dan sesudah perbaikan)*
   - *(Lampirkan screenshot hasil `ping -c 3 8.8.8.8` dari terminal **Unit-01** dengan status `0% packet loss`)*

---