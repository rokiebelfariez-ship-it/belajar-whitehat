#!/bin/bash
# monitor.sh — L2 Modul4 Capstone: analisis log SSH (deteksi brute force)
# Pakai: bash monitor.sh [file_log] (default: server.log)

LOG="${1:-server.log}"

if [[! -f "$LOG" ]]; then
  echo "ERROR: file '$LOG' tidak ditemukan di folder ini."
  echo "Jalankan: bash monitor.sh /path/ke/log atau cd ke folder yang benar."
  exit 1
fi

echo "=========================================="
echo " MONITOR SSH — $(basename "$LOG")"
echo "=========================================="
echo "Total baris log : $(wc -l < "$LOG")"
echo "Failed password : $(grep -c "Failed password" "$LOG")"
echo "Accepted : $(grep -c "Accepted" "$LOG")"
echo
echo "=== Ranking IP (Failed password) ==="
grep "Failed password" "$LOG" | grep -oE 'from [0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | awk '{print $2}' | sort | uniq -c | sort -nr
echo
echo "=== IP teratas (>= 5x gagal) = indikasi brute force ==="
grep "Failed password" "$LOG" | grep -oE 'from [0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | awk '{print $2}' | sort | uniq -c | sort -nr | awk '$1 >= 5'
echo
echo "=== Timeline serangan per jam ==="
grep "Failed password" "$LOG" | awk '{split($3, t, ":"); print $1" "$2" "t[1]":00"}' | sort | uniq -c
echo
echo "=== Cek Accepted (login BERHASIL — verifikasi!) ==="
grep "Accepted" "$LOG"
echo
echo "=== IP gagal BANYAK lalu BERHASIL (indikasi bobol!) ==="
for ip in $(grep "Failed password" "$LOG" | grep -oE 'from [0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | awk '{print $2}' | sort -u); do
  if grep -q "Accepted.*from $ip " "$LOG"; then
    echo "WASPADA: $ip gagal berkali-kali lalu BERHASIL login"
  fi
done
echo "=== Selesai ==="
