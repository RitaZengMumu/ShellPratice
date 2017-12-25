#!/bin/bash

RETVAL=0
FAILCOUNT=0
SCRIPTS_PATH="/server/scripts"
MAIL_GROUP="46709914@qq.com 155138514@qq.com"
#MAIL_GROUP="18600338340 18911718229"
## web detection function
LOG_FILE="/tmp/web_check.log"
function GetUrlStatus(){
    for ((i=1;i<=3;i++))
	 do
	let FAILCOUNT
	wget -T 2 --tries=1 --spider http://www.baidu.com >/dev/null 2>&1
        [ $? -ne 0 ] && let FAILCOUNT+=1;
		echo $FAILCOUNT
    done
    if [ $FAILCOUNT -gt 1 ];then
       RETVAL=1
       NowTime=`date +"%m-%d %H:%M:%S"`
       SC="http://${HOST_NAME} service is error,${NowTime}."
       echo "send to :$MAIL_USER ,Title:$SUBJECT_CONTENT" >$LOG_FILE
       for MAIL_USER in $MAIL_GROUP
       do
          mail -s "$SC" $MAIL_USER <$LOG_FILE
       done
    else
       RETVAL=0
    fi
    return $RETVAL
}

GetUrlStatus
