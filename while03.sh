#!/bin/bash
while true
do
	curl -I -s http://127.0.01/|head -1
	sleep 2
done
