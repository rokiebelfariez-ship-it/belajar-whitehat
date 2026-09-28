# Lab 1: Jejak Digital di Shodan
Target: 185.220.101.5
Tanggal: 2026-09-27

## Temuan Shodan
- Hostname: berlin01.tor-exit.artikel10.org
- Domain: artikel10.org | Negara: Jerman
- Tag: tor, self-signed
- Port 80/TCP: HTTP, nginx — banner "Ini adalah Node Keluar Tor"
- Port 443/TCP: HTTPS, nginx — halaman default "Selamat datang di nginx!"
- SSL: self-signed (CN=default, RSA 2048-bit, berlaku 2022-2032)
- Vulnerabilities: tidak ada CVE yang ditandai

## Analisis
- IP ini adalah Tor exit node yang dioperasikan organisasi hak digital Jerman (artikel10.org).
- Reputasi buruk di AbuseIPDB (Modul 1) berasal dari traffic anonim pengguna Tor yang keluar lewat node ini, bukan dari operatornya.
- Operator transparan: banner port 80 secara eksplisit menyatakan ini node keluar Tor.
- Kesimpulan analis: konteks mengubah penilaian — IP bereputasi buruk belum tentu milik pelaku kejahatan.
