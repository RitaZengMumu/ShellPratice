#!/bin/bash
for n in `seq -w 31 35`
do	
	useradd oldboy$n
	pass=`echo $RANDOM|md5sum|cut -c 11-18`
	echo -e "user:oldboy$n pass:$pass" >>/tmp/user.log
  	#echo "$pass"|passwd --stdin oldboy$n
    	 echo "$pass"|passwd --stdin oldboy$n
done
