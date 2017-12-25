#!/bin/bash
if [ -e /data/tmp/md5.log ]
	then
	 md5sum -c /data/tmp/md5.log >/data/tmp/result.log  2>/dev/null
	egrep -i 'FAILED|失败' /data/tmp/result.log >/data/tmp/err.log

	if [ ! -s /data/tmp/err.log ];then
	
    	mail -s "`uname -n` $(date +%F) weberr" 46709914@qq.com </data/tmp/err.log


	fi
fi
