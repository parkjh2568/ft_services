FROM alpine:3.12.0

#한국에서 속도가 빠른 mirror페이지에서 apk add 작업
sed -i "s/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g" /etc/apk/repositories
RUN apk update
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli \
	php7-zlib php7-curl php7-mbstring php7-json php7-session fcgi nginx

RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-all-languages.tar.gz
RUN tar -xvf /phpMyAdmin-4.9.5-all-languages.tar.gz
RUN rm -f /phpMyAdmin-4.9.5-all-languages.tar.gz
RUN mv /phpMyAdmin-4.9.5-all-languages /etc/phpmyadmin
RUN mkdir -p /run/nginx
RUN	mkdir /etc/phpmyadmin/tmp
RUN	chmod 777 /etc/phpmyadmin/tmp

######### php-fpm health check part #########
RUN wget -O /usr/local/bin/php-fpm-healthcheck \
			https://raw.githubusercontent.com/renatomefi/php-fpm-healthcheck/master/php-fpm-healthcheck

RUN chmod +x /usr/local/bin/php-fpm-healthcheck
RUN echo "pm.status_path = /status" >> /etc/php7/php-fpm.d/www.conf
#############################################

COPY config.inc.php /etc/phpmyadmin
COPY ./nginx.conf /etc/nginx/.

EXPOSE 5000

CMD php-fpm7 && nginx -g "daemon off;"
