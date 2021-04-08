#!/bin/sh

sleep 5
echo "show databases;" | mysql -hmysql -uhonlee -p1234
until [ $? == 0 ]   #에러가 안날때까지 체크한다.
do
	sleep 1
	echo "show databases;" | mysql -hmysql -uhonlee -p1234
done
sleep 1
echo "select * from wp_commentmeta;" | mysql -Dwordpress -hmysql -uhonlee -p1234
if [ $? == 1 ] ; then  #없다는 뜻 없으니 넣어준다.
	echo "run wordpress.sql"
	mysql -hmysql -Dwordpress -uhonlee -p1234 < wordpress.sql
fi