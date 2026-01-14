@echo off
REM MSKU ChatBot - Quick Start Script for Windows

echo =====================================
echo MSKU ChatBot - Quick Start
echo =====================================
echo.

REM Check if .env file exists
if not exist ".env" (
    echo [INFO] .env dosyasi bulunamadi, .env.example'dan kopyalaniyor...
    copy .env.example .env
    echo [WARNING] Lutfen .env dosyasini duzenleyin ve GROQ_API_KEY ekleyin!
    echo.
    pause
)

REM Check if Docker is running
docker info >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Docker calismiyorsa veya yuklenmemis!
    echo [INFO] Docker Desktop'u baslatip tekrar deneyin.
    pause
    exit /b 1
)

echo [INFO] Docker bulundu, container baslatiliyor...
echo.

REM Start Docker Compose
docker-compose up --build

pause
