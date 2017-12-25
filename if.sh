#!/bin/bash
read -p "please input num1:" num1
read -p "please input num2:" num2

[ -n "`echo $num1$num2|sed 's/[0-9]//g'`" ]&& {
	echo "please input int number!"
		exit
}
if [ $num1 -lt $num2 ]
	then
		echo "$num1 is less than $num2"
fi

if [ $num1 -gt $num2 ]
	then 
		echo "$num1 is greater than $num2"
fi

if [ $num1 -eq $num2 ]
	then 
		echo "$num1 is equal $num2"

fi
