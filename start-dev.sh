#!/bin/bash
# MSKU ChatBot - Quick Start Script for Linux/Mac

echo "====================================="
echo "MSKU ChatBot - Quick Start"
echo "====================================="
echo ""

# Check if .env file exists
if [ ! -f ".env" ]; then
    echo "[INFO] .env dosyası bulunamadı, .env.example'dan kopyalanıyor..."
    cp .env.example .env
    echo "[WARNING] Lütfen .env dosyasını düzenleyin ve GROQ_API_KEY ekleyin!"
    echo ""
    read -p "Devam etmek için Enter'a basın..."
fi

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "[ERROR] Docker çalışmıyor veya yüklenmemiş!"
    echo "[INFO] Docker'ı başlatıp tekrar deneyin."
    exit 1
fi

echo "[INFO] Docker bulundu, container başlatılıyor..."
echo ""

# Start Docker Compose
docker-compose up --build
