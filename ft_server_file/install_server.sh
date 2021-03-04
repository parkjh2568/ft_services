#!/bin/bash

service mysql start

#ssl

openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Jun/CN=locaglhost" -keyout localhost.dev.key -out localhost.dev.crt
mv localhost.dev.crt etc/ssl/certs
mv localhost.dev.key etc/ssl/private
chmod 600 etc/ssl/certs/localhost.dev.crt etc/ssl/private/localhost.dev.key

#nginx

mv ./tmp/nginx_data /etc/nginx/sites-available/default
rm -rf /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

#php

mv ./tmp/phpinfo.php /var/www/html/

#wget

wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz
tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz
mv phpMyAdmin-5.0.2-all-languages phpmyadmin
mv phpmyadmin /var/www/html/
mv ./tmp/config.inc.php var/www/html/phpmyadmin/

#mysql
mysql < var/www/html/phpmyadmin/sql/create_tables.sql -u root --skip-password
echo "set password"

mysqladmin -u root -p password

echo "CREATE DATABASE IF NOT EXISTS wordpress;" | mysql
echo "FLUSH PRIVILEGES;" | mysql

# wordpress

wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
mv wordpress/ var/www/html/
chown -R www-data:www-data /var/www/html/wordpress
mv ./tmp/wp-config.php var/www/html/wordpress/

rm var/www/html/index.nginx-debian.html

service php7.3-fpm start
service nginx start

service nginx restart

bash
