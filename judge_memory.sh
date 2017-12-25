#!/bin/bash
cur_free=`free -m|awk '/buffers\// {print $NF}'`
chars="current memory is $cur_free"
if [ $cur_free -lt 1500 ]
	then
	echo $chars|mail -s "$chars" 46709914@qq.com
fi
