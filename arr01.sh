#!/bin/bash
array=(
oldboy
zhangyue
zhangyang)
for ((i=0;i<${#array[*]};i++))
do 
	echo "This is num $i,then content is ${array[$i]}"
done
echo ------------------------
echo "array len:${#array[*]}"
