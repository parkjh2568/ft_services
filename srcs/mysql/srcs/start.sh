#!/bin/sh

# apk add mysql을 하면 mysql이 설치는 되지만 "mysql server"에 관련된 초기 세팅은 전혀 되어있지 않은 상태다. 따라서 서버에 관한 초기세팅을 해줘야하는데 mysql_install_db가 이 세팅을 도와준다. 그리고 --user=root로 하는 이유는 alpine 컨테이너에 우리가 다른 사용자를 만들지 않았기 때문. 그리고 만약 다른 사용자를 추가해서 그 유저로 하면 비밀번호를 추가로 입력해야 하는 불편함이 있다. 따라서 그냥 root로 편하게 하자.
mysql_install_db --user=root
mysqld --user=root --bootstrap < /temp/mysql-init
mysqld --user=root 
