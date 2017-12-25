#!/bin/bash
port=`netstat -lnt|grep 3306|wc -l`
if [ $port -eq 0 ]
	then 
	echo "mysql is stop"
	service mysqld start
else
	echo "mysql is running"

fi
