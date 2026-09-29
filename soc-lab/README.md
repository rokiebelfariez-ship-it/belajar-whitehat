# SOC Lab — Analisis Brute Force SSH

Lab hands-on: mendeteksi, memprofilkan, dan memblokir serangan brute force SSH
dari file log, hanya dengan perintah terminal.

**Tanggal:** 29 September 2026
**Analis:** Rokib Elfariz

## Hasil

- 20 upaya login SSH gagal terdeteksi (2 file log)
- 5 IP penyerang diidentifikasi dan masuk blocklist
- 3 taktik serangan diprofilkan: agresif, sweep, driller
- 0 kebobolan — semua serangan gagal

## Isi folder

| File | Keterangan |
|---|---|
| `incident-report.md` | Laporan insiden lengkap |
| `blocklist.txt` | Daftar IP penyerang yang diblokir |
| `cheatsheet.md` | Perintah terminal yang dipakai |
| `certificate.png` | Sertifikat penyelesaian lab |

## Cara pakai blocklist

```bash
while read ip; do
  [[ $ip == \#* ]] && continue
  sudo iptables -A INPUT -s "$ip" -j DROP
done < blocklist.txt
```
