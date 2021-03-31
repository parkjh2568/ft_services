#!/bin/bash

mkdir -p /ftps/honlee
adduser --home=/ftps/honlee -D honlee

echo "honlee:1234" | chpasswd
echo "honlee" >> etc/vsftpd/userlist
touch /var/log/vsftpd.log
mkdir -p /etc/ssl/private
mkdir -p /etc/ssl/certs
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/CN=localhost" -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt

vsftpd /etc/vsftpd/vsftpd.conf