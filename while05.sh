#!/bin/bash
while read -p "please input your name:" name
	do
	if [ -n "$name" ];then
	echo -e "$name $RANDOM"
	fi
	done
