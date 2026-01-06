# MSKÜ ChatBot - Backend API

LLM Tabanlı Üniversite Bilgi Asistanı - Backend servisi

## 🚀 Hızlı Başlangıç

### Gereksinimler

- Python 3.10+
- pip
- (Opsiyonel) Docker & Docker Compose

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

## 🐳 Docker ile Çalıştırma

```bash
# Docker image oluştur ve çalıştır
docker-compose up --build

# Arka planda çalıştır
docker-compose up -d

# Logları görüntüle
docker-compose logs -f

# Durdur
docker-compose down
```

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
