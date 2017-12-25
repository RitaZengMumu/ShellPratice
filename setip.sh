#!/bin/bash
#config the tempory ip adress for server,the ip is from 10.0.2.1 to 10.0.2.16,and the
#10.0.2.15 is unavailable.and make sure we can cancel the config at any time.
RE=0
case "$1" in
up)

for ((i=0;i<=16for ((i=0;i<=16;i++))
        do
        if [ $i -eq 10 ]
                continue
        fi
        ifconfig eth0:$i 10.0.2.$i netmask 255.255.240.0 up
        done
;;
down)

for ((i=0;i<=16for ((i=0;i<=16;i++))
        do
        if [ $i -eq 10 ]
                continue
        fi
        ifconfig eth0:$i 10.0.2.$i netmask 255.255.240.0 down
        done
;;
*)
	echo "USAGE:$0 {up|down}"
	exit
esac
exit $RE
