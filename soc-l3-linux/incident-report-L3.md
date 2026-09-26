# INCIDENT RESPONSE REPORT - LEVEL 3 (Otak)
Analis: Rokib Elfariz
Tanggal: 30 September 2026
Lab: Termux Android - SOC L3 Linux

## Ringkasan Insiden
SSH Brute Force dari IP 185.220.101.5 (Tor Exit Node) berhasil lolos setelah di-block di L2 karena adanya persistence.

## 1. Diamond Model Lengkap
- Adversary: 185.220.101.5 - Tor, kemungkinan automated bot
- Capability: T1110 Brute Force + T1136 Create Account
- Infrastructure: SSH Port 22, Protocol TCP
- Victim: User root, Host belajar-whitehat-lab

## 2. MITRE ATT&CK Timeline
- 13:10 - T1078 Valid Accounts (Recon)
- 13:15 - T1110 Brute Force (20x Failed)
- 13:22 - T1136 Create Account (Buat user backdoor `admin2`)
- 13:25 - T1053 Scheduled Task (Pasang cron)

## 3. Analisis Root Cause L3
L2 hanya block IP, tapi tidak cek persistence. Musuh sudah buat user baru sebelum IP diblock.

Bukti di HP:
