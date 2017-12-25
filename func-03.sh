#!/bin/bash
if [ $# -ne 1 ]
then 
	echo "error" && exit 1
fi
function check_url(){
	curl -I -s $1|head -1 && return 0 || return 1
}
check_url $1
