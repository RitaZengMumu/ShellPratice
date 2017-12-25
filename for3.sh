#!/bin/bash
for n in `seq -w 11 15`
do
	useradd oldboy$n && echo "oldboy$n"|passwd --stdin oldboy$n
done
