# Basit bir web sunucusu
FROM nginx:alpine

# Kendi özel sayfamızı oluşturalım
RUN echo '<h1>MSKU ChatBot has just been born. We expect it to grow.</h1>' > /usr/share/nginx/html/index.html