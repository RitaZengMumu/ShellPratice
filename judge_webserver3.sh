#!/bin/bash
httpcode=`curl -o /dev/null -s -w "%{http_code}" http://127.0.0.1`
if [ $httpcode -eq 200 ];then
	echo "httpd is running"
else
	echo "httpd is stop"
	/application/appache/bin/apachectl start
fi
