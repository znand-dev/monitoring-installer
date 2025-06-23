#!/bin/bash

echo "🧨 Monitoring Stack Uninstaller"
echo "==============================="

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

# Step 1: Validasi docker-compose
step 10 "Mengecek dependensi Docker..."
if ! command -v docker &> /dev/null; then
    echo "❌ Docker belum terpasang."
    exit 1
fi
if ! command -v docker compose &> /dev/null && ! command -v docker-compose &> /dev/null; then
    echo "❌ docker-compose tidak ditemukan."
    exit 1
fi

# Step 2: Stop & remove container
step 30 "Menghentikan dan menghapus container..."
if command -v docker compose &> /dev/null; then
    docker compose down --volumes --remove-orphans
else
    docker-compose down --volumes --remove-orphans
fi

# Step 3: Optional - delete anonymous volumes
step 60 "Membersihkan volume yang tidak dipakai..."
docker volume prune -f

# Step 4: Selesai
step 100 "Uninstall selesai. Stack monitoring berhasil dihapus."
