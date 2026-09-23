# Belajar Whitehat - Recon Target.com

Recon halal (fingerprinting) target.com pakai Termux - Tanpa hacking ilegal.

## Struktur
- mentah/ = 10k subdomain awal (domains.txt, urls.txt)
- laporan/200.txt = 87 pintu hidup (HTTP 200)
- laporan/prod.txt vs stage.txt = bedah prod vs stage
- laporan/tech.txt = egsSessionId, JWT, HttpOnly, Secure, SameSite
- laporan-final-tahap3/4/5.md = 3 laporan SOC

## Temuan Tahap 5
PROD (www.target.com): Hardening BAGUS - Secure+HttpOnly+SameSite+JWT
STAGE (tap.stage.apiplatform.target.com): Hardening SANGAT BAGUS - WAF Zero Trust, no respon HEAD/GET anonim (Target Corp)

## Tools
curl, grep, subfinder mindset, Termux

## Etika
Hanya baca header & status, tidak exploit, tidak brute force.
