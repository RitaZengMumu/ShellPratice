#!/bin/bash
#chkconfig: 2345 21 81
. /etc/init.d/functions
start(){
	if [ `ps -ef|grep "rsync --daemon"|grep -v grep|wc -l` -ge 1 ];then
	echo "rsync is running"
	exit
	fi
	rsync --daemon
	if [ $? -eq 0 ];then
		action "rsync started" /bin/true
	else
		action "rsync started" /bin/false
	fi
}

stop(){
	if [ `ps -ef|grep "rsync --daemon"|grep -v grep|wc -l` -eq 0 ];then
	echo "rsync is stopped"
	exit
	fi
	pkill rsync;sleep 1

	if [ `ps -ef|grep "rsync --daemon"|grep -v grep|wc -l` -eq 0 ];then
		action "rsync stopped" /bin/true
	else
		action "rsync stopped" /bin/false
        fi
	
}
restart(){
	if [ `ps -ef|grep "rsync --daemon"|grep -v grep|wc -l` -eq 0 ];then
		start
	else
		stop
		start
	fi
	
}
case "$1" in
	start)
	start
	RETVAL=$?
;;
	stop)
	stop
	RETVAL=$?
;;	
	restart)
	
	restart
	RETVAL=$?
;;
*)
	echo "USAGE:$0 {start|stop|restart}"
esac
exit $RETVAL
