# Cheat Sheet — Analisis Log Serangan SSH

```bash
# Hitung total upaya login gagal
grep -c Failed ~/soc-lab/auth.log

# Lihat detail tiap upaya gagal
grep Failed ~/soc-lab/auth.log

# Hitung serangan dari satu IP
grep -c 91.200.12.55 ~/soc-lab/auth.log

# Cek apakah ada login yang BERHASIL (kunci: bedakan dari Failed)
grep Accepted ~/soc-lab/auth.log

# Tambah IP ke blocklist
echo 185.220.101.4 >> ~/soc-lab/blocklist.txt

# Blokir IP secara permanen (server Linux asli)
sudo iptables -A INPUT -s 185.220.101.4 -j DROP

# Lihat aturan iptables yang aktif
sudo iptables -L -n
```
