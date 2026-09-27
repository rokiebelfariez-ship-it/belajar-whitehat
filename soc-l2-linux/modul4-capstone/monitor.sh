#!/bin/bash
cd "$(dirname "$0")"
echo "=== Ranking IP ==="
grep "Failed" server.log | grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | sort | uniq -c | sort -rn
TOP_IP=$(grep "Failed" server.log | grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | sort | uniq -c | sort -rn | head -1 | awk '{print $2}')
echo "=== IP teratas: $TOP_IP ==="
echo "=== Timeline ==="
grep "$TOP_IP" server.log
echo "=== Cek Accepted ==="
grep "$TOP_IP" server.log | grep "Accepted"
