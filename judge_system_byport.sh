#!/bin/bash
port1=`netstat -lnt|grep 3306|wc -l`

port2=`ps -ef|grep mysql|grep -v grep|wc -l`

if [[ $port1 -eq 0 || $port2 -lt 2 ]]
	then 
	echo "mysql is stop"
	service mysqld start
else
	echo "mysql is running"

fi
