#!/bin/bash
for file in `seq 10`
do 
	[ ! -d /scripts/oldboy ]&& mkdir -p /scripts/oldboy 
	touch /scripts/oldboy/oldboy-$file
done
