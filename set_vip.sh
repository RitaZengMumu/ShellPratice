#!/bin/bash
VIP=(
192.168.1.110
192.168.1.111)

RIP=(
192.168.2.5
192.168.2.10)

start(){
for (( i=0;i<${#VIP[*]};i++))
do
	ifconfig eth0:$i ${VIP[$i]}/24 up
	route add -host ${VIP[$i]} dev eth0
done
ipvsadm -C
ipvsadm --set 30 5 60
ipvsadm -A -t ${VIP[i]}:80 -s wrr

for ((i=0;i<${#RIP[*]};i++))
do
ipsadm  -a -t ${VIP[$i]}:80 -r ${RIP[$i]}:80 -g -w 1

done
}


stop(){
ifconfig eth0:29 ${VIP}/24 down
route del -host ${VIP[$i]} dev eth0 
}
