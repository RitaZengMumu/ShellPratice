#!/bin/bash
port=`nmap 127.0.0.1 -p 80|grep open |wc -l`
if [ $port -gt 0 ];then
	echo "httpd is running"
else
	echo "httpd is stop"
	/application/appache/bin/apachectl start
fi
