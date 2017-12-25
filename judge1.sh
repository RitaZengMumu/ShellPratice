#!/bin/bash
. /etc/init.d/functions
for f in `ls *`
do

if [ `cat $f| wc -L` -ne `grep $f c.txt|awk '{print $1}'` ]
	then
	action "$f" /bin/false
else
	action "$f" /bin/true


fi
done
