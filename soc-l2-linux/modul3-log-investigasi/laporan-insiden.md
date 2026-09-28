# Laporan Insiden — Brute Force SSH
Analis: Rokib Elfariz
Tanggal: 2026-09-27

## Ringkasan
IP 203.0.113.45 melakukan brute force SSH terhadap server.
Serangan GAGAL — tidak ada login berhasil dari IP tersebut.

## Timeline
- 08:15:33 — serangan dimulai, target user root
- 08:15:33-08:16:01 — gelombang 1: 7x percobaan (root + admin)
- 08:30:19-08:30:31 — gelombang 2: 5x percobaan (root)
- Total: 11x Failed password, 0x Accepted

## Indikator (IoC)
- IP penyerang: 203.0.113.45
- Username ditarget: root, admin
- Pola: percobaan beruntun tiap ~3 detik (otomatis, bukan manusia)

## Penilaian
- Tingkat keparahan: RENDAH (gagal, tidak ada akses didapat)
- Server TIDAK terkompromi

## Rekomendasi
1. Blokir IP 203.0.113.45 di firewall
2. Nonaktifkan login SSH langsung sebagai root (PermitRootLogin no)
3. Pertimbangkan fail2ban untuk blokir otomatis brute force
