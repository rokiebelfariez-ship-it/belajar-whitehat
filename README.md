# 🛡️ Belajar Whitehat - Recon Target.com | Rokib Elfariz

> Recon halal Target.com pakai Termux - Tanpa hacking ilegal, 100% pasif & etis. Fokus SOC Analyst & WAF Zero Trust.

[![Tahap 6 Selesai](https://img.shields.io/badge/Tahap-6%20Selesai-brightgreen)]()
[![WAF Detected](https://img.shields.io/badge/WAF-Imperva-red)]()
[![Method](https://img.shields.io/badge/Method-Passive%20Only-blue)]()

## 🎯 Executive Summary
Dari **8696 subdomain mentah** Target.com, berhasil difilter menjadi **353 PROD Live** dan **98 STAGE Live** (HTTP 200). Analisis defensif menemukan **Imperva Incapsula WAF** dengan cookie `visid_incap_2742517` & `incap_ses_1755_2742517` dan hardening cookie yang belum lengkap.

## 📂 Struktur Laporan
- `mentah/` - 10k subdomain awal (domains.txt, urls.txt)
- `laporan/200.txt` - 87 pintu hidup (HTTP 200)
- `laporan/prod.txt vs stage.txt` - 353 PROD vs 98 STAGE
- `laporan/tech.txt` - Teknologi: egsSessionId, JWT, HttpOnly, Secure, SameSite
- `laporan/laporan-final-tahap5.md` - WAF Zero Trust & Analisis Sesi
- `laporan/laporan-final-tahap6-imperva.md` - **Imperva WAF Detected**

## 🔍 Tahap 5-6 Final: Temuan Utama
**WAF Vendor:** Imperva (x-cdn: Imperva, visid_incap pattern)
- Cookie: `visid_incap_2742517` + `incap_ses_1755_2742517`
- Flag: HttpOnly ✅ | Secure ❌ MISSING | SameSite ❌ MISSING
- Risk: Cookie leakage jika downgrade HTTP, CSRF risk
- Rekomendasi: Aktifkan Secure + SameSite=Lax di dashboard Imperva

**Perbandingan PROD vs STAGE:**
- PROD: 353 domain - WAF aktif, cookie hardening lengkap
- STAGE: 98 domain - Mengekspos titik akhir pengujian, WAF lebih longgar (stage-jira, stage-slingshot, www-stage)

## 🛠️ Alat
Termux, curl -I (header only), grep, bash - 100% passive, tanpa exploit.

## 📜 Penafian
Edukasi peretasan etis (ethical hacking) - Tidak ada eksploitasi ilegal, hanya analisis header & cookie publik.

**Analis:** Rokib Elfariz | **Tanggal:** 24 Sep 2026
