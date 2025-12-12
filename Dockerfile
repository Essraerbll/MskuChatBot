# Basit bir web sunucusu
FROM nginx:alpine

# Kendi özel sayfamızı oluşturalım
RUN echo '<h1>MSKU ChatBot has just been born. We expect it 2 grow.</h1>' > /usr/share/nginx/html/index.html