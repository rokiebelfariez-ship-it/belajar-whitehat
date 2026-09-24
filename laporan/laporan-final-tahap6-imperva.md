# Tahap 6: WAF Fingerprinting - Imperva Detected

## Target
bavstage.target.com

## Header Evidence (Pasif - curl -I)
- x-cdn: Imperva
- set-cookie: visid_incap_2742517=... HttpOnly
- set-cookie: incap_ses_1755_2742517=...
- pragma: no-cache, expires: 0

## Analisa Whitehat
1. WAF Vendor: Imperva Incapsula (x-cdn & visid_incap signature)
2. Teknologi ini memblokir Server header (good) tapi mengekspos versi via cookie name pattern 2742517 (site ID).
3. Flag cookie WAF: HttpOnly OK, tapi Secure dan SameSite MISSING -> potensi cookie leakage jika ada http fallback.

## Rekomendasi Defensif (Halal)
- Aktifkan Secure flag pada semua cookie Imperva di dashboard Imperva -> Security -> Cookies.
- Aktifkan SameSite=Lax untuk cegah CSRF.
- Pastikan bavstage.target.com tidak bypass Imperva langsung ke origin.

## Skor
PROD: 353 domain - Hardening Lengkap
STAGE: 98 domain - Ditemukan Imperva WAF, perlu hardening cookie tambahan.

Status: Tahap 6 SELESAI - Siap push ke PWA
