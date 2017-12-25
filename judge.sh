#!/bin/bash
. /etc/init.d/functions
if [ `cat a.log| wc -L` -ne 1 ]
	then
	action "a.log" /bin/false
else
	action "a.log" /bin/true


fi
