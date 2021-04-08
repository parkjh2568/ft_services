FROM alpine:3.12


#한국에서 속도가 빠른 mirror페이지에서 apk add 작업
sed -i "s/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g" /etc/apk/repositories
RUN apk update
RUN apk add mysql mysql-client
RUN mkdir -p /run/mysqld



COPY srcs/my.cnf /etc/.
COPY srcs/mysql-init.sql /temp/
COPY srcs/start.sh /temp/


EXPOSE 3306


ENTRYPOINT ["sh", "/temp/start.sh"]
