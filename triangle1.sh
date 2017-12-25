#!/bin/bash
export LANG="zh_CN.GB18030"
#judge input
if (test -z $1);then
read -p "Input Max Int Lines:" MAX
else
	MAX=$1
fi

#judge int
[ -n "`echo $MAX|sed 's/[0-9]//g'`" ]&& \
echo "Oldboy say,the num you input must be int,thank you,bye!"&& exit 1

#require<10
 [ ! $MAX -lt 10 ]&& \
echo "The num you input must be int(1-9),thank you ,bye" && exit 1

#start
a[0]=1
for((i=0;i<=MAX;i++))
do
	for((j=$i;j>0;j--))
	do
		((a[$j]+=a[$j-1])) 

	done
		for((j=0;j<=$[MAX-$i];j++))
		do
		if [ $MAX -le 6 ]
		then
			echo -en "\t"
		else
			echo -n "  "
		fi
		done
	for((j=0;j<=$i;j++))
	do
		if [ $MAX -le 6 ]
			then
			echo -en "\t\t"${a[$j]}
			else
				echo -n ${a[$j]}"  "
			fi  
	done
echo
done
