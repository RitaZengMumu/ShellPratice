#!/bin/bash
[ ! -f /data/md5zhiwen.log  ]&& md5sum /scripts/* >/data/md5zhiwen.log

if [ ! -n "`md5sum -c /data/md5zhiwen.log|egrep -i 'FAILED|失败'`" ];then
  md5sum -c /data/md5zhiwen.log|egrep -i 'FAILED|失败' 
	exit
else
	echo OK

fi
