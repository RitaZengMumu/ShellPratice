#!/bin/bash
#Check the status of the website,if it's unvailable,then send  mobile and emali messages to management.
#it's usual used when service restart
. /etc/rc.d/init.d/functions
RETVAL=0
FAILCOUNT=0
SCRIPTS_PATH="/scripts"
MAIL_GROUP="46709914@qq.com 155138514@qq.com"
#MAIL_GROUP="18600338340 18911718229"
## web detection function
LOG_FILE="/tmp/web_check.log"

function GetUrlStatus(){
for ((i=1;i<=3;i++))
	do
	wget -T 2 --tries-1 --spider http://${1} >/dev/null 2>&1
	 [ $? -ne 0 ] && let FAILCOUNT+=1;
	done
	 if [ $FAILCOUNT -gt 1 ];then
       RETVAL=1
       NowTime=`date +"%m-%d %H:%M:%S"`
       SC="http://${HOST_NAME} service is error,${NowTime}."
       echo "send to :$MAIL_USER ,Title:$SC" >$LOG_FILE
	 for MAIL_USER in $MAIL_GROUP
       do
          mail -s "$SC" $MAIL_USER <$LOG_FILE
       done
    else
       RETVAL=0
    fi
    return $RETVAL
}

#func end
#[ ! -d "$SCRIPTS_PATH" ]&& mkdir -p $SCRIPTS_PATH
#[ ! -f "$SCRIPTS_PATH/domain.list" ]&&{
#cat >$SCRIPTS_PATH/domain.list <<EOF
#127.0.0.1
#www.baidu.com
#EOF


for  URL in `cat $SCRIPTS_PATH/domain.list`
   do
       echo -n "checking $URL: "
       GetUrlStatus $URL && action "successful" /bin/true || action "failure" /bin/false
       #Get_Url_Status $HOST_NAME
done

