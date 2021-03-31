FROM alpine:3.12



RUN apk add openssl
RUN apk add vsftpd



COPY srcs/openssl.conf /etc/ssl/private/
COPY srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY srcs/start.sh /temp/



EXPOSE 20 21 21100-21104
#CMD sh temp/start.sh
ENTRYPOINT ["sh","./temp/start.sh"]
