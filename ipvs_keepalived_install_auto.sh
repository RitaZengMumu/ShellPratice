#!/bin/bash

Tools_dir="/data"
echo "Apply to Centos 6.4----------------------------->"
if [ ! -d ${Tools_dir} ]
then
mkdir -p ${Tools_dir}
fi 

cd ${Tools_dir}

if [ ! -f ipvsadm-1.26.tar.gz ];then

wget http://www.linuxvirtualserver.org/software/kernel-2.6/ipvsadm-1.26.tar.gz

fi

if  [ ! -f keepalived-1.2.7.tar.gz ];then

wget  http://www.keepalived.org/software/keepalived-1.2.7.tar.gz

fi

modproble ip_vs

strTmp=$(lsmod|grep ip_vs)
echo "mod -------------->${strTmp}"

if [ -z "${strTmp}" ];then
	echo "load module" && exit 1
fi

sysVersionTmp=$(uname -r)
flag1=$(echo ${sysVersionTmp}|grep xen|wc -l)
verName="$(uname -r)-x86_64"

if [ ${flag1} -ge 1 ];then
	verName="$(echo ${sysVersionTmp}|sed 's/xen//g')-xen-x86_64"
else
	echo OK

fi

[ ! -f /usr/src/linux ]&& \
ln -s /usr/src/kenels/${verName} /usr/src/linux

echo "#install ipvadm tools ----------------->"
cd ${Tools_dir}
tar zxvf ipvsadm-1.26.tar.gz
cd ipvsadm-1.26

make && make install

[ $? -ne 0 ]&& echo "ERROR,Ipavsadm installing" && exit 1

/sbin/ipvsadm
cd ../

echo "#install keepalived tools--------------------->"

cd ${Tools_dir}
tar zvxf keepalived-1.2.7.tar.gz

cd keeplived-1.2.7

./configure
make && make install
