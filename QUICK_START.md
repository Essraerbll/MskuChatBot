# 🚀 MSKÜ ChatBot - Hızlı Başlangıç Kılavuzu

Bu kılavuz projenizi 5 dakikada çalıştırmanıza yardımcı olacak.

## 📦 Önkoşullar

- **Docker Desktop** yüklü ve çalışır durumda olmalı
  - Windows: [Docker Desktop for Windows](https://docs.docker.com/desktop/install/windows-install/)
  - Mac: [Docker Desktop for Mac](https://docs.docker.com/desktop/install/mac-install/)
  - Linux: [Docker Engine](https://docs.docker.com/engine/install/)

- **Groq API Key** (Ücretsiz)
  - [https://console.groq.com/](https://console.groq.com/) adresinden kayıt olun
  - API Keys bölümünden yeni bir key oluşturun

## 🎯 3 Adımda Başlatma

### Adım 1: Projeyi İndirin
```bash
git clone <repository-url>
cd MskuChatBot
```

### Adım 2: API Key'i Yapılandırın

**Windows:**
```bash
copy .env.example .env
notepad .env
```

**Linux/Mac:**
```bash
cp .env.example .env
nano .env
```

`.env` dosyasında şu satırı bulun ve kendi API key'inizi yazın:
```env
GROQ_API_KEY=your_groq_api_key_here
```

### Adım 3: Başlatın!

**Windows (Kolay Yol):**
```bash
start-dev.bat
```

**Linux/Mac (Kolay Yol):**
```bash
chmod +x start-dev.sh
./start-dev.sh
```

**Veya Manuel:**
```bash
docker-compose up --build
```

## ✅ Test Edin

Tarayıcınızda açın: **http://localhost:8000/api/v1/docs**

API documentation sayfası görünüyorsa başarılı! 🎉

## 🧪 İlk Chat Testi

1. Swagger UI'da `/api/v1/chat/ask` endpoint'ini bulun
2. "Try it out" butonuna tıklayın
3. Şu örneği deneyin:

```json
{
  "question": "Merhaba, nasılsın?",
  "include_sources": false,
  "max_tokens": 200
}
```

4. "Execute" butonuna tıklayın

## 📁 Dosya Yapısı

```
MskuChatBot/
├── app/                    # Uygulama kodları
│   ├── main.py            # Ana FastAPI uygulaması
│   ├── api/               # API endpoints
│   ├── services/          # LLM servisleri
│   └── data/              # Dokümanlar ve veritabanı
├── docker-compose.yml     # Development ortamı
├── docker-compose.prod.yml # Production ortamı
├── start-dev.bat          # Windows başlatma scripti
├── start-dev.sh           # Linux/Mac başlatma scripti
└── .env                   # Ortam değişkenleri (kendiniz oluşturacaksınız)
```

## 🛠️ Sık Kullanılan Komutlar

```bash
# Container'ı başlat (arka planda)
docker-compose up -d

# Logları görüntüle
docker-compose logs -f app

# Container'ı durdur
docker-compose down

# Container'ı yeniden başlat
docker-compose restart app

# Container içine gir (debugging için)
docker-compose exec app bash
```

## 🔧 Sorun Giderme

### Docker çalışmıyor
```bash
# Docker durumunu kontrol edin
docker info
```
Hata alıyorsanız Docker Desktop'u başlatın.

### Port 8000 kullanımda
```bash
# Windows'ta port'u kim kullanıyor bul
netstat -ano | findstr :8000

# Linux/Mac'te
lsof -i :8000
```

Docker Compose'da port'u değiştirin:
```yaml
ports:
  - "8080:8000"  # 8080'den erişin
```

### API Key çalışmıyor
- `.env` dosyasında `GROQ_API_KEY` doğru mu?
- Key'de boşluk veya fazladan karakter var mı?
- Container'ı yeniden başlatın: `docker-compose restart app`

### Kod değişiklikleri yansımıyor
- Volume mount'lar doğru mu kontrol edin
- Hot reload aktif mi: `docker-compose logs app | findstr reload`
- Container'ı yeniden başlatın

## 🎓 Sonraki Adımlar

1. **Doküman Ekleyin:** `app/data/documents/pdf/` klasörüne PDF dosyaları ekleyin
2. **API'yi Test Edin:** Postman veya cURL ile endpoint'leri deneyin
3. **Kodu İnceleyin:** `app/` klasöründeki kodları keşfedin
4. **Frontend Bağlayın:** React/Vue.js uygulamanızı bağlayın

## 📚 Daha Fazla Bilgi

- Detaylı dokümantasyon: [README.md](README.md)
- API Endpoints: http://localhost:8000/api/v1/docs
- Groq Dokümantasyon: https://console.groq.com/docs

## 💡 İpuçları

- Development ortamında kod değişiklikleri otomatik yansır (hot reload)
- Loglar `logs/` klasöründe saklanır
- Vector database `app/data/chroma_db/` içinde tutulur
- `.env` dosyasını **asla** git'e commit etmeyin

## 🆘 Yardım

Sorun mu yaşıyorsunuz? 
1. [GitHub Issues](https://github.com/your-repo/issues) sayfasına bakın
2. Yeni bir issue açın
3. Proje ekibine ulaşın

---

**Başarılar! 🚀**
