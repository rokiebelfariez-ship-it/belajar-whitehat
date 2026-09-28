# Laporan Analisis Log — Capstone Modul 4

**Analis:** Rokib Elfariz
**Tanggal:** 2026-09-28
**Alat:** `monitor.sh` (script analisis log SSH)
**File log:** `server.log`, `monitor.log`

## 1. Ringkasan Eksekutif

Ditemukan aktivitas **brute force SSH** terhadap server. Satu IP eksternal melakukan
2172 percobaan login gagal dalam rentang satu jam (28 Sep, 08:00). Belum ditemukan
login berhasil dari IP penyerang pada log yang dianalisis, namun verifikasi lanjutan
tetap diperlukan.

## 2. Metodologi

Script `monitor.sh` melakukan:
1. Hitung total baris log, total `Failed password`, dan total `Accepted`.
2. Ranking IP berdasarkan jumlah login gagal (`grep` + `sort | uniq -c`).
3. Flag IP dengan >= 5x kegagalan sebagai indikasi brute force.
4. Timeline serangan per jam untuk melihat pola waktu.
5. Cek `Accepted` (login berhasil) dan korelasinya dengan IP yang gagal berulang
   — pola "gagal banyak lalu berhasil" = indikasi akun bobol.

## 3. Temuan

| Indikator | Hasil |
|---|---|
| IP teratas (gagal login) | `198.51.100.23` |
| Jumlah `Failed password` | 2172 |
| Waktu serangan | 2026-09-28 08:00 (1 jam) |
| Ambang brute force (>=5x) | Terlampaui jauh (2172 >> 5) |
| Login `Accepted` dari IP penyerang | Tidak ditemukan di log ini |

### Analisis
- Volume 2172 percobaan/jam dari satu IP = **bukan kesalahan user**, ini serangan
  otomatis (tool seperti Hydra/Medusa).
- Serangan terpusat dalam 1 jam → pola *burst*, khas brute force yang berharap
  menebak password lemah dengan cepat.

## 4. Tingkat Keparahan

**TINGGI** — brute force SSH aktif terhadap layanan yang terekspos. Meski belum ada
indikasi kompromi di log ini, satu password lemah saja cukup untuk membobol server.

## 5. Rekomendasi

1. **Blokir IP `198.51.100.23`** segera (firewall / fail2ban).
2. Aktifkan **fail2ban** atau rate-limiting pada SSH.
3. Nonaktifkan login password → pakai **SSH key**; nonaktifkan user `root`/`guest`.
4. Ganti port SSH default (22) dan batasi akses SSH ke IP yang dikenal.
5. Audit semua akun: pastikan tidak ada login `Accepted` mencurigakan di log lain
   (`/var/log/auth.log`, `secure`).
6. Terapkan monitoring berkelanjutan — jalankan `monitor.sh` terjadwal via cron.

## 6. Lampiran

- `monitor.sh` — script analisis (dapat dijalankan: `bash monitor.sh [file_log]`)
- `server.log`, `monitor.log` — log yang dianalisis
