#!/bin/bash

echo "🔧 Monitoring Stack Installer"
echo "============================="

step() {
  local percent=$1
  local message=$2
  local bar_width=20
  local done=$((percent * bar_width / 100))
  local remain=$((bar_width - done))
  local bar=$(printf "%${done}s" | tr ' ' '#')
  bar+=$(printf "%${remain}s" | tr ' ' '.')
  printf "[%-20s] %3d%% - %s\n" "$bar" "$percent" "$message"
}

# Step 1: Cek dependensi
step 10 "Mengecek dependensi Docker & Compose..."
if ! command -v docker &> /dev/null; then
    echo "❌ Docker belum terpasang."
    exit 1
fi
if ! command -v docker compose &> /dev/null; then
    echo "❌ docker compose belum terpasang."
    exit 1
fi
sleep 0.5

# Step 2: Cek .env
step 30 "Memeriksa file .env..."
if [ ! -f .env ]; then
    echo "⚠️  File .env tidak ditemukan! Menggunakan default port dari docker-compose.yml"
else
    echo "✅ File .env ditemukan!"
fi
sleep 0.5

# Step 3: Jalankan docker compose
step 60 "Menjalankan docker compose stack..."
docker compose up -d --build
sleep 0.5

# Step 4: Tampilkan status
step 80 "Menampilkan status container..."
docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"
sleep 0.5

# Step 5: Status
step 100 "Instalasi selesai, untuk monitoring docker log melalui GUI silahkan akses https://<IP_Address>:9000 (HTTP)"
