FROM alpine:3.12


#한국에서 속도가 빠른 mirror페이지에서 apk add 작업
sed -i "s/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g" /etc/apk/repositories
RUN apk add openssl
RUN apk add vsftpd



COPY srcs/openssl.conf /etc/ssl/private/
COPY srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY srcs/start.sh /temp/



EXPOSE 20 21 21100-21104
#CMD sh temp/start.sh
ENTRYPOINT ["sh","./temp/start.sh"]
