# SOC L3 - LEMBAR STRATEGI OTAK
## CASE: SSH Brute Force

### 1. DIAMOND MODEL
- Adversary: 185.220.101.5
- Capability: T1110 Brute Force
- Infrastructure: Port 22 SSH
- Victim: root

### 2. MITRE ATT&CK
- T1110, T1053 Cron, T1136 Create Account

### 3. SOAR
IF >5 Failed THEN Block + Cek User Baru

### 4. ROOT CAUSE
Password lemah + root login on
