#alpine:latest 로 할 경우 클러스터맥에서는 에러가 난다.
FROM alpine:3.12.0

# install required packages
# apk --update --no-cache -> 알파인 리눅스를 가벼운 상태로 유지할수 있다
# nginx -> nginx 설치
# openssl -> openssl 설치
RUN apk update \
	&& apk --update --no-cache add \
	nginx \
	openssl

COPY ./nginx_setup.sh /nginx_setup.sh
COPY ./nginx.conf /etc/nginx/.

RUN chmod +x /nginx_setup.sh

EXPOSE 80 443

CMD			./nginx_setup.sh