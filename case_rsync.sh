#!/bin/bash
. /etc/init.d/functions
case "$1" in
	start)
	rsync --daemon
	if [ $? -eq 0 ];then
		action "rsync started" /bin/true
	else
		action "rsync started" /bin/false
	fi
;;
	stop)
	pkill rsync;sleep 1

	if [ `ps -ef|grep "rsync --daemon"|grep -v grep|wc -l` -eq 0 ];then
		action "rsync stopped" /bin/true
	else
		action "rsync stopped" /bin/false
        fi
	
	
;;
	restart)
	pkill rsync
	sleep 5
	if  [ `ps -ef|grep "rsync --daemon"|grep -v grep|wc -l` -eq 0 ];then
		flag=0
	fi 
	rsync --daemon
	if [ $? -eq 0  -a $flag -eq 0 ];then
		action "rysnc restarted" /bin/true
	
 	fi
;;
*)
	echo "USAGE:$0 {start|stop|restart}"
esac
