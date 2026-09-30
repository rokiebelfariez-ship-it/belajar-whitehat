# belajar-whitehat - Rokib Elfariz

> 🇬🇧 **English summary:** This repository documents my WhiteHat & SOC Analyst learning journey: ethical reconnaissance, log analysis, and threat detection. Recon exercises were performed against a lab simulation environment (`target-lab.local`), never against real company infrastructure — see [Legal & Ethics](#legal--etika). Tools: Termux (Android-only setup).

Repositori dokumentasi pembelajaran WhiteHat & SOC Analyst — fokus ke reconnaissance yang etis, analisis log, dan threat detection.

> 👤 **Tentang saya:** Pensiunan yang jadi kaum rebahan, sekarang siap menekuni dunia cyber security.

---

## 🎯 Tujuan Pembelajaran

- Memahami **7-phase WhiteHat Recon** secara terstruktur
- Menganalisis log & simulasi serangan (SOC Level 1)
- Deteksi WAF dan pemetaan environment secara aman
- Dokumentasi temuan dengan prinsip **responsible disclosure**

---

## 🏆 Pencapaian

### Tahap 7 (L7) — 24 September 2026 — 7-Phase WhiteHat Recon (Lab Simulation)

*Latihan recon penuh terhadap environment lab simulasi (`target-lab.local`) — mensimulasikan infrastruktur e-commerce skala besar.*

| Metrik | Hasil |
|---|---|
| Target | `target-lab.local` — lab simulasi (bukan infrastruktur perusahaan asli) |
| Subdomain ditemukan | 8.696 |
| Host live | 87 |
| Environment terpetakan | 353 PROD & 98 STAGE |
| WAF | Imperva terdeteksi |
| Analisis tambahan | Prod vs Stage + egsSessionId |
| Perangkat | Termux (Android) |
| Role | SOC Analyst — Reconnaissance & Threat Detection |

**Tools yang dipakai:** `subfinder`, `nuclei`, `curl` — semua berjalan di Termux (Android).
**Teknik:** enumerasi subdomain pasif + aktif, probing HTTP, fingerprinting WAF, klasifikasi environment berdasarkan response.

### Tahap 1 (L1) — 25 September 2025 — Fundamental SOC & Log Analysis

- Analisis log & simulasi serangan
- Deteksi intrusi dasar
- File sertifikat asli tersedia di folder `sertifikat/`

> Urutan belajar: L7 (24 Sep) → L1/Ijazah (25 Sep).

---

## 🧭 Metodologi: 7-Phase WhiteHat Recon

1. **Scope definition** — pastikan target & batasan resmi tertulis
2. **Passive recon** — OSINT tanpa menyentuh target (crt.sh, archive, dll)
3. **Subdomain enumeration** — wordlist + bruteforce di Termux
4. **Live host probing** — cek host aktif & fingerprinting service
5. **Environment classification** — bedakan PROD vs STAGE dari pola response
6. **WAF & protection detection** — identifikasi layer pertahanan
7. **Reporting** — dokumentasi temuan di `laporan/` + responsible disclosure

---

## 📁 Struktur Folder
