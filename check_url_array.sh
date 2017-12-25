#!/bin/bash
. /etc/init.d/functions

url_list=(
http://www.baidu.com
http://127.0.0.1
http://www.tianya.cn)

function wait(){
echo -e 'please wait 3 seconds befor you exec the process'\n
for ((i=0;i<=3;i++))
do 
	echo -n "." ;sleep 1
done
}

function check_url(){
wait 
echo 'checking url...'
for ((i=0;i<${#url_list[*]};i++)) 
do
	judge=($( curl -I -s --connect-timeout 2 ${url_list[$i]}|head -1))
	if [ "${judge[1]}"=='200' -a "${judge[2]}"=='OK' ];then
		action "${url_list[$i]} is successfull" /bin/true
		else
		action "${url_list[$i]}	is failure" /bin/false
	fi
done
}
check_url
