#!/bin/bash
menu(){
cat <<END
=======================================
1.[install lamp]
2.[install lanp]
3.[exit]
pls input the num you want:
=====================================
END
}

menu1(){
cat <<END

*******************************************
1.[INSTALL APACHE]
2.[INSTALL MYSQL]
3.[INSTALL PHP]
4.[BACK]
******************************************
END
}
menu

read num

[ -n "`echo $num|sed 's/[0-9]//g'`" ] && {
	echo "You must input int number!"
	exit
}
[ $num -eq 1 ]&&{
	echo "starting to install lamp"
	menu1
  	read num2
[ $num2 -eq 1 ] 
       echo "starting install apache"
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
