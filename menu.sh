#!/bin/bash
menu(){
cat <<END
1.[install lamp]
2.[install lanp]
3.[exit]
pls input the num you want:
END
}

menu

read num

[ -n "`echo $num|sed 's/[0-9]//g'`" ] && {
	echo "You must input int number!"
	exit
}
[ $num -eq 1 ]&&{
        echo "starting install lamp"
	exit
}

[ $num -eq 2 ]&&{
        echo "starting install lanp"
	exit
}


[ $num -eq 3 ]&&{
        echo "logout"
	exit
}

[ ! $num -eq 1 -o ! $num -eq 2 -o ! $num -eq 3 ]&&{
echo "bye"
exit 1
}
