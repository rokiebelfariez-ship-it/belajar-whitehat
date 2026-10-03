# Laporan Capstone Modul 4 — Monitoring dan Analisis Log

**Nama:** Rokib Elfariz
**Tanggal:** 28 September 2026
**Modul:** SOC-12 Linux — Modul 4 Capstone
**Tools:** Termux (bash), `monitor.sh`

---

## 1. Tujuan

Menganalisis file log server untuk mendeteksi aktivitas mencurigakan, khususnya percobaan login ilegal (brute force) terhadap layanan SSH, serta menyusun timeline kejadian untuk keperluan investigasi.

## 2. Metodologi

Analisis dilakukan dengan script `monitor.sh` yang dijalankan dari direktori kerjanya sendiri (diperbaiki dengan menambahkan `cd "$(dirname "$0")"` agar path relatif selalu valid). Script ini memiliki tiga bagian utama:

1. **Ranking IP** — menghitung IP dengan percobaan login gagal terbanyak.
2. **Timeline** — menampilkan urutan kronologis kejadian dari log.
3. **Cek Accepted** — memeriksa apakah ada login yang berhasil (indikasi kompromi).

## 3. Temuan Utama: Serangan Brute Force SSH

Ditemukan serangan brute force terhadap layanan SSH pada host `web`, seluruhnya berasal dari satu IP sumber.

### 3.1 Ringkasan Serangan

| Item | Detail |
|---|---|
| IP penyerang | 198.51.100.23 |
| Target | host `web`, layanan SSH (sshd) |
| Total percobaan gagal | 12 kali |
| Rentang waktu | 28 Sep 2026, 08:05:37 – 08:06:22 (±45 detik) |
| User yang dicoba | `root` (8x), `admin` (2x), `test` (2x) |
| Login berhasil | Tidak ada (bagian "Cek Accepted" kosong) |

### 3.2 Timeline Kejadian

| Waktu | User | Port Sumber | PID sshd |
|---|---|---|---|
| 08:05:37 | root | 39201 | 2150 |
| 08:05:40 | root | 39201 | 2150 |
| 08:05:43 | root | 39201 | 2150 |
| 08:05:46 | admin (invalid) | 39202 | 2151 |
| 08:05:49 | admin (invalid) | 39202 | 2151 |
| 08:05:52 | test (invalid) | 39203 | 2152 |
| 08:05:55 | test (invalid) | 39203 | 2152 |
| 08:06:10 | root | 39204 | 2153 |
| 08:06:13 | root | 39204 | 2153 |
| 08:06:16 | root | 39204 | 2153 |
| 08:06:19 | root | 39204 | 2153 |
| 08:06:22 | root | 39204 | 2153 |

## 4. Analisis

1. **Pola serangan otomatis.** 12 percobaan dalam 45 detik dengan jeda ~3 detik menunjukkan tools otomatis (bukan manusia). Penyerang berganti-ganti username umum (`root`, `admin`, `test`) yang merupakan daftar kredensial default/bawaan.
2. **Satu sumber, sesi bertahap.** Kenaikan nomor port sumber (39201 → 39204) dan PID sshd yang berbeda menandakan beberapa sesi koneksi berurutan dari IP yang sama.
3. **Belum ada kompromi.** Tidak ditemukan entri "Accepted" pada log, sehingga serangan ini gagal — tidak ada akses ilegal yang berhasil masuk.

## 5. Kesimpulan

Server mengalami percobaan serangan brute force SSH dari IP 198.51.100.23 pada 28 September 2026 pukul 08:05–08:06. Serangan bersifat otomatis, menargetkan akun umum, dan **gagal** — tidak ada login ilegal yang berhasil. Tingkat urgensi: **rendah–sedang** (perlu mitigasi agar tidak berulang).

## 6. Rekomendasi

1. **Blokir IP penyerang** sementara via firewall (`iptables`/`ufw`) atau daftarkan ke fail2ban.
2. **Pasang fail2ban** agar IP dengan banyak percobaan gagal diblokir otomatis.
3. **Nonaktifkan login SSH user `root`** (`PermitRootPassword no`) dan gunakan key-based authentication.
4. **Ganti port default SSH** (22) untuk mengurangi noise dari scanner otomatis.
5. **Lanjutkan monitoring berkala** dengan `monitor.sh` dan simpan arsip log untuk investigasi lanjutan.
