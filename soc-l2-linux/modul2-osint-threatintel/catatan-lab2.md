# Lab 2: Reputasi di VirusTotal
Target: 185.220.101.5
Tanggal: 2026-09-27

## Temuan VirusTotal
- Detection ratio: 11/91 vendor menandai sebagai malicious
- Community Score: 19
- Tags: tor, self-signed, suspicious-udp
- ASN: AS 60729 | Negara: Jerman (DE) — konsisten dengan Shodan

## Analisis
- Rasio 11/91 (~12%) tergolong rendah; server malware sungguhan biasanya 40+/91.
- Penandaan berasal dari statusnya sebagai Tor exit node: traffic jahat pengguna Tor pernah keluar lewat IP ini.
- Tags VirusTotal (tor, self-signed) mengonfirmasi temuan Shodan di Lab 1.
- Kesimpulan triase: bukan ancaman langsung, melainkan infrastruktur anonim yang sah.
  Jika IP ini muncul di log internal, yang diselidiki adalah koneksinya ke Tor, bukan servernya.
