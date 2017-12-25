#!/bin/bash
. /etc/rc.d/init.d/functions
port=`ps -ef |grep httpd|grep -v grep|wc -l` 
start(){
if [ $port -gt 1 ] && [ `netstat -lnp|grep 80|grep http|wc -l` -eq 1 ]
	then
	action "Httpd has already started"  /bin/true
else
	/application/appache2.4.25/bin/apachectl start
	sleep 10
	if [ `ps -ef |grep httpd|grep -v grep|wc -l` -gt 1 ]&& [ `netstat -lnp|grep 80|grep http|wc -l` -eq 1 ]
		then
	action "Httpd started successful" /bin/true
		else
	action "oops,it seems there is a problem when start httpd,pls check it" /bin/false
	fi
fi
}

stop(){
if [ $port -eq 0 ] 
	then 
	action "Httpd has already stopped" /bin/true
else
	/application/appache2.4.25/bin/apachectl stop
	sleep 10
   if [ `ps -ef |grep httpd|grep -v grep|wc -l` -eq 0 ]&& [ `netstat -lnt|grep 80|grep http|wc -l` -eq 0 ]
	then
	action "Httpd stopped successful"  /bin/true
   else
	action "oops,it seems there is a problem when stop httpd service" /bin/true
  fi	
fi
}

restart(){
	if [ `ps -ef |grep httpd|grep -v grep|wc -l` -eq 0 ] 
		then
			start
		else
		stop
		start
	
	fi
}

case $1 in
start)
	start
;;
stop)
	stop
;;
restart)
	restart
;;
*)
echo $"USAGE:$0 {start|stop|restart}"
exit
;;
esac
