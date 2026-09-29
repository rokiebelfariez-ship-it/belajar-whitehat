# Laporan Insiden: Serangan Brute Force SSH

**Tanggal:** 29 September 2026
**Analis:** Rokib Elfariz
**Sumber log:** `auth-sample.log`, `auth.log` (`~/soc-lab/`)

## Ringkasan Eksekutif

Dua kampanye serangan brute force SSH terdeteksi dari analisis log.
Total **20 upaya login gagal** dari **5 IP penyerang**. Tidak ada login
mencurigakan yang berhasil — **0 kebobolan**.

## Kampanye 1 — `auth-sample.log`

- **9** upaya login gagal dari **2** IP penyerang.
- Salah satu penyerang sangat agresif (mayoritas upaya berasal darinya).

## Kampanye 2 — `auth.log`

- **11** upaya login gagal dari **3** IP penyerang baru:
    - `103.147.8.22`
    - `45.112.90.7` — pola *sweep*: berganti-ganti username tiap upaya
    - `91.200.12.55` — pola *driller*: mengunci target `root` berulang kali
- Ditemukan 1 baris `Accepted` milik user `roky` dari IP internal —
  **terverifikasi sebagai login sah** (bukan indikator kebobolan).

## Profil Taktik Penyerang

| Taktik | Ciri | Contoh IP |
|---|---|---|
| Agresif | Volume tinggi dalam waktu singkat | 185.220.101.4 |
| Sweep | Rotasi username, hindari pola | 45.112.90.7 |
| Driller | Kunci satu username (root) berulang | 91.200.12.55 |

## Tindakan

1. Kelima IP penyerang dimasukkan ke `blocklist.txt`.
2. Konsep pemblokiran permanen: `iptables -A INPUT -s <IP> -j DROP`.
3. Pencegahan lanjutan (sesi laptop): install fail2ban untuk blokir otomatis,
   nonaktifkan login root via SSH, pakai SSH key.

## Pelajaran

- `grep -c Failed <file>` menghitung serangan dalam 1 detik.
- Selalu bedakan `Failed` vs `Accepted` sebelum panik.
- Login `Accepted` dari IP internal milik sendiri = aktivitas sah.
