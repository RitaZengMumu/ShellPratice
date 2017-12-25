#!/bin/bash
. /etc/rc.d/init.d/functions
RETVAL=0
FAILCOUNT=0
SCRIPTS_PATH="/scripts"
MAIL_GROUP="46709914@qq.com 155138514@qq.com"
#MAIL_GROUP="155138514"
LOG_FILE="/tmp/web_check.log"
function Geturlstatus(){
for ((i=1;i<=3;i++))
        do
        wget -T 2 --tries-1 --spider http://${1} >/dev/null 2>&1
        [ $? -ne 0 ] && let FAILCOUNT+=1;

        done
        if [ $FAILCOUNT -gt 1 ];then
        RETVAL=1
        Nowtime=`date +"%m-%d %H:%M:%S"`
        SC="http://${HOST_NAME} server is error,${Nowtime}"
        echo "send to :$MAIL_USER,Title:$SC">$LOG_FILE
        for MAIL_USER in $MAIL_GROUP
                do
                        mail -s "$SC" $MAIL_USER <$LOG_FILE
                done
        else
        RETVAL=0
        fi
        return $RETVAL

}


for  URL in `cat $SCRIPTS_PATH/domain.list`
   do
       echo -n "checking $URL: "
       Geturlstatus $URL && action "successful" /bin/true || action "failure" /bin/false
       #Get_Url_Status $HOST_NAME
  done

