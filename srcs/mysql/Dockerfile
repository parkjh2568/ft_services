FROM alpine:3.12



RUN apk update
RUN apk add mysql
RUN mkdir -p /run/mysqld



COPY srcs/my.cnf /etc/mysql/
COPY srcs/mysql-init /temp/
COPY srcs/start.sh /temp/


EXPOSE 3306


ENTRYPOINT ["sh", "/temp/start.sh"]
