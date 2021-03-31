FROM alpine:3.12.0

RUN apk --update --no-cache add openssl vsftpd --no-cache

COPY ftps_setup.sh /
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN chmod +x /ftps_setup.sh

EXPOSE 21

ENTRYPOINT ["sh","/ftps_setup.sh"]