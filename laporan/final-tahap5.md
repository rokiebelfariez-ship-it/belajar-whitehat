# Laporan Final Tahap 5: WAF Zero Trust Hardening

**Peneliti:** Rokib Elfariz | **Tanggal:** 23 Sep 2026
**Scope:** target.com - Passive Recon

### 1. Ringkasan
Analisis 87 live host dari 10k subdomain. Fokus hardening cookie egsSessionId & JWT dari laporan/tech.txt

### 2. Temuan
- Cookie egsSessionId & JWT tanpa flag lengkap
- Risiko: XSS (tanpa HttpOnly), MITM (tanpa Secure), CSRF (tanpa SameSite)

### 3. Rekomendasi WAF Zero Trust
Set-Cookie: egsSessionId=xxx; Path=/; HttpOnly; Secure; SameSite=Strict
Set-Cookie: JWT=xxx; HttpOnly; Secure; SameSite=Strict; Max-Age=900

- Aktifkan WAF rule block document.cookie exfil
- Rate limit /login & /api/auth
- Pisahkan prod.txt vs stage.txt (beda secret, stage IP allowlist)

### 4. Kesimpulan
87 pintu hidup ter-map. No exploit. Rekomendasi utama hardening cookie flag + WAF Zero Trust.

Disclaimer: Edukasi ethical hacking only.
