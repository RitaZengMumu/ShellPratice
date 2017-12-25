#!/bin/bash
wget -T 15 -q --spider http://127.0.0.1
if [ $? -eq 0 ];then
	echo "httpd is running"
else
	echo "httpd is stop"
	/application/appache/bin/apachectl start
fi
