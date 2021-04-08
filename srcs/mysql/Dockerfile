FROM alpine:3.12



RUN apk update
RUN apk add mysql mysql-client
RUN mkdir -p /run/mysqld



COPY srcs/my.cnf /etc/.
COPY srcs/mysql-init.sql /temp/
COPY srcs/start.sh /temp/


EXPOSE 3306


ENTRYPOINT ["sh", "/temp/start.sh"]
