#!/bin/bash
MYUSER=root
MYPASS=abc123
SOCKET=/application/mysql/tmp/mysql.sock
MYCMD="mysql -u$MYUSER -p$MYPASS -S $SOCKET"
MYDUMP="mysqldump -u$MYUSER -p$MYPASS --events  -S $SOCKET"
for database in `$MYCMD -e "show databases;"|sed '1,2d'|grep -v mysql`
do
	for table in `$MYCMD -e "show tables from $database;"|sed '1d'`
		do	
	[ ! -d /data/backup/${database} ] && mkdir /data/backup/${database} -p
	$MYDUMP $database $table|gzip >/data/backup/${database}/${database}_${table}_$(date +%F).sql.gz
		done
done
