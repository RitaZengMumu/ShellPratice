#!/bin/sh
mysql -uroot -pabc123 -S  /application/mysql/tmp/mysql.sock -e "show databases;"> /dev/null 2>&1

if [ $? -eq 0 ]
	then 
		echo "mysql is running"

else
	service mysqld start
fi

