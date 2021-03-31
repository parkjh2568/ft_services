# lastest 버젼으로 하면 당겨올때 문제가 생김.
FROM alpine:3.12.0

# install required packages
# apk --update --no-cache -> 알파인 리눅스를 가벼운 상태로 유지할수 있다
RUN apk --update --no-cache add mysql mysql-client

# 빈 폴더를 그냥 만들어주는 것인데 이게 없으면 에러남 ㅋㅋ 이유는 모름
RUN	mkdir -p /run/mysqld

COPY ./my.cnf /etc/.
COPY ./mysql_init.sql /mysql_init.sql 
COPY ./mysql_setup.sh /mysql_setup.sh

RUN chmod +x /mysql_setup.sh

EXPOSE 3306

ENTRYPOINT ["sh","/mysql_setup.sh"]
