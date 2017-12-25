#!/bin/bash
MYUSER=root
MYPASS=abc123
SOCKET=/application/mysql/tmp/mysql.sock
MYCMD="mysql -u$MYUSER -p$MYPASS -S $SOCKET"
MYDUMP="mysqldump -u$MYUSER -p$MYPASS --events  -S $SOCKET"
for database in `$MYCMD -e "show databases;"|sed '1,2d'`
do
	$MYDUMP $database|gzip >/data/backup/${database}_$(date +%F).sql.gz
done
