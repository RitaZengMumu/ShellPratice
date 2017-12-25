#!/bin/bash
array=(`ls /scripts`)
for ((i=0;i<${#array[*]};i++))
	do
	echo ${array[$i]}
	done
