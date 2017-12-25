#!/bin/bash

[ -z $1 ] &&{ 
	echo "please input number1"	
		exit
}

 [ -z $2 ] &&{   
          echo "please input number2"     
                   exit
   }







[ -n "`echo $1$2|sed 's/[0-9]//g'`" ]&& {
	echo "please input int number!"
		exit
}
if [ $1 -lt $2 ]
	then
		echo "$1 is less than $2"
fi

if [ $1 -gt $2 ]
	then 
		echo "$1 is greater than $2"
fi

if [ $1 -eq $2 ]
	then 
		echo "$1 is equal $2"

fi
