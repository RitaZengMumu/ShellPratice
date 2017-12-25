#!/bin/bash
cd /scripts/abc/
for f in `ls oldboy*`
do
#mv /scripts/abc/$f /scripts/abc/`echo $f|sed 's#oldboy#linux#g'`
mv $f `echo $f|sed 's#oldboy#linux#g'`
done
