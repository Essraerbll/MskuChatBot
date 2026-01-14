# MSKÜ ChatBot - Backend API

LLM Tabanlı Üniversite Bilgi Asistanı - Backend servisi

## � İçindekiler
- [Hızlı Başlangıç](#-hızlı-başlangıç)
- [Docker ile Çalıştırma](#-docker-ile-çalıştırma-geliştirme-ortamı)
- [Python ile Çalıştırma](#python-ile-manual-kurulum)
- [API Endpoints](#-api-endpoints)

## �🚀 Hızlı Başlangıç

### ⚡ En Hızlı Yol (Docker ile)

**Windows:**
```bash
# 1. .env dosyasını oluştur ve GROQ_API_KEY ekle
copy .env.example .env

# 2. Kolay başlatma scripti ile çalıştır
start-dev.bat
```

**Linux/Mac:**
```bash
# 1. .env dosyasını oluştur ve GROQ_API_KEY ekle
cp .env.example .env

# 2. Scripti çalıştırılabilir yap ve başlat
chmod +x start-dev.sh
./start-dev.sh
```

### Gereksinimler

- Python 3.10+
- pip
- (Opsiyonel) Docker & Docker Compose v2.0+

**Not:** Docker Desktop kullanıyorsanız Docker Compose otomatik olarak dahildir.

---

## 🔧 Python ile Manual Kurulum

Eğer Docker kullanmak istemiyorsanız:

### Kurulum

1. **Depoyu klonlayın**
```bash
git clone <repository-url>
cd MskuChatBot
```

2. **Virtual environment oluşturun**
```bash
python -m venv venv
venv\Scripts\activate  # Windows
# source venv/bin/activate  # Linux/Mac
```

3. **Dependencies yükleyin**
```bash
pip install -r requirements.txt
```

4. **Environment değişkenlerini ayarlayın**
```bash
copy .env.example .env
```

`.env` dosyasını düzenleyin ve gerekli API key'leri ekleyin:
```env
GROQ_API_KEY=your_groq_api_key_here
```

Groq API key almak için: https://console.groq.com/

5. **Uygulamayı çalıştırın**
```bash
uvicorn app.main:app --reload
```

veya

```bash
python -m app.main
```

6. **API dokümantasyonunu görüntüleyin**

Tarayıcınızda açın: http://localhost:8000/api/v1/docs

## 🐳 Docker ile Çalıştırma (Geliştirme Ortamı)

### İlk Kurulum

```bash
# .env dosyasını oluştur ve GROQ_API_KEY ekle
copy .env.example .env  # Windows
# cp .env.example .env  # Linux/Mac

# Docker container'ı oluştur ve başlat
docker-compose up --build
```

### Günlük Kullanım

```bash
# Container'ı başlat (arka planda)
docker-compose up -d

# Logları görüntüle
docker-compose logs -f app

# Container'ı durdur
docker-compose down

# Container'ı yeniden başlat
docker-compose restart app

# Container içine gir (debug için)
docker-compose exec app bash
```

### Önemli Notlar

- Kod değişiklikleri otomatik olarak algılanır (hot reload)
- `app/`, `app/data/` ve `logs/` dizinleri volume olarak bağlıdır
- API'ye erişim: http://localhost:8000

### Production Ortamı için Docker

Production ortamında çalıştırmak için:

```bash
# Production container'ı başlat
docker-compose -f docker-compose.prod.yml up -d --build

# Logları görüntüle
docker-compose -f docker-compose.prod.yml logs -f

# Durdur
docker-compose -f docker-compose.prod.yml down
```

**Production ve Development Farkları:**
- Production: Hot reload yok, optimize edilmiş image
- Production: Restart policy aktif (otomatik yeniden başlatma)
- Development: Kod değişiklikleri anında yansır

## 📡 API Endpoints

### Health Check
```
GET /api/v1/health
```

### Chat
```
POST /api/v1/chat/ask
```

**Request Body:**
```json
{
  "question": "MSKÜ hangi yılda kuruldu?",
  "conversation_id": "optional-uuid",
  "include_sources": true,
  "max_tokens": 500
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "answer": "MSKÜ 2007 yılında kurulmuştur.",
    "conversation_id": "uuid",
    "sources": [...],
    "confidence_score": 0.95,
    "processing_time_ms": 1234
  },
  "timestamp": "2026-01-06T14:57:00Z"
}
```

### API Dokümantasyonu

- **Swagger UI:** http://localhost:8000/api/v1/docs
- **ReDoc:** http://localhost:8000/api/v1/redoc

## 🏗️ Proje Yapısı

```
MskuChatBot/
├── app/
│   ├── api/              # API endpoints
│   ├── core/             # Core configuration
│   ├── services/         # Business logic
│   ├── utils/            # Utility functions
│   └── data/             # Data storage
├── tests/                # Tests
├── scripts/              # Utility scripts
├── requirements.txt      # Python dependencies
├── Dockerfile           # Docker configuration
└── docker-compose.yml   # Docker Compose config
```

## 🧪 Testing

```bash
# Unit testler
pytest tests/unit/

# Integration testler
pytest tests/integration/

# Tüm testler
pytest

# Coverage raporu
pytest --cov=app tests/
```

## 🔧 Development

### Code Style

```bash
# Format code
black app/

# Lint
flake8 app/

# Type checking
mypy app/
```

## 📚 Teknoloji Stack

- **Framework:** FastAPI 0.109+
- **LLM:** Groq Cloud API (Llama 3.1 70B)
- **Embeddings:** sentence-transformers
- **Vector DB:** ChromaDB
- **RAG Framework:** LangChain

## 👥 Ekip

- **Backend:** Esra ERBİL & Umut ŞEN
- **Frontend:** Hasan Görkem TOK
- **Dokümantasyon:** Efe Talha BAŞARAN

## 📝 License

Bu proje MSKÜ öğrencileri tarafından akademik amaçlı geliştirilmiştir.

## 🤝 Contributing

1. Feature branch oluştur (`git checkout -b feature/amazing-feature`)
2. Değişiklikleri commit et (`git commit -m 'feat: Add amazing feature'`)
3. Branch'i push et (`git push origin feature/amazing-feature`)
4. Pull Request aç

## 📞 İletişim

Sorularınız için proje ekibiyle iletişime geçebilirsiniz.
