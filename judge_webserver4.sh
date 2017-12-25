#!/bin/bash
. /etc/init.d/functions
if [ "$1" == "start" ]
	then
		action "apache starting" /bin/true
elif [ "$1"=="stop" ]
	then
		action  "httpd is stoppend" /bin/true
else
	action "httpd start" /bin/false
#	/application/appache/bin/apachectl start
fi
