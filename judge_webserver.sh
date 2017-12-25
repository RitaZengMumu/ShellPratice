#!/bin/bash
port=`netstat -lnt|grep 80|wc -l`
if [ $port -gt 0 ];then
	echo "httpd is running"
else
	echo "httpd is stop"
	/application/appache/bin/apachectl start
fi
