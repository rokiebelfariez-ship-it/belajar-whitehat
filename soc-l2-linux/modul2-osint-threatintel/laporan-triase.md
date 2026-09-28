# Laporan Triase — 185.220.101.5
Analis: Rokib Elfariz
Tanggal: 2026-09-27

## Ringkasan Eksekutif
IP 185.220.101.5 adalah Tor exit node yang dioperasikan organisasi
hak digital Jerman (artikel10.org). Bukan infrastruktur jahat,
namun traffic yang melaluinya tidak dapat dipercaya.

## Temuan
1. AbuseIPDB: banyak laporan penyalahgunaan (Modul 1)
2. Shodan: port 80/443 terbuka, nginx, banner "Ini adalah Node Keluar Tor",
   sertifikat self-signed, hostname berlin01.tor-exit.artikel10.org
3. VirusTotal: 11/91 vendor menandai malicious; tags: tor, self-signed,
   suspicious-udp; AS 60729, Jerman

## Penilaian
- Tingkat ancaman server: RENDAH (infrastruktur sah)
- Tingkat risiko traffic: TINGGI (anonim, riwayat penyalahgunaan)

## Rekomendasi
1. Jangan blokir permanen — akan memblokir juga traffic Tor yang sah.
2. Jika IP ini muncul di log internal: selidiki host yang berkomunikasi
   dengannya, bukan servernya.
3. Pertimbangkan kebijakan: batasi/tolak koneksi Tor di jaringan korporat
   sesuai kebijakan perusahaan.
