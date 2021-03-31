#!/bin/sh

# ssl configuration
mkdir -p /etc/nginx/ssl
openssl req -new -x509 -nodes -newkey rsa:4096 -keyout localhost-nginx.key -out localhost-nginx.crt -days 365 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/CN=localhost"
mv localhost-nginx.key /etc/nginx/ssl
mv localhost-nginx.crt /etc/nginx/ssl

mkdir -p /run/nginx
echo "<h1>THIS IS FT_SERVICES NGINX INDEX.HTML BY HONLEE</h1>" >> /var/www/index.html

#nginx 를 foreground 에서 실행하기 위함.
#이렇게 실행하지 않으면 background 에서 실행하게 되고, 그럼 컨테이너가 종료된다
/usr/sbin/nginx -g "daemon off;"