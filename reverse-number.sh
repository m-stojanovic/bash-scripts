#!/bin/bash
###################################################################
#Script Name    :reverse-number.sh
#Description    :Print number in reverse order
#Date           :26-April-2020
#Author         :Milos Stojanovic
#Contact:       :https://www.linkedin.com/in/infomilosstojanovic/
###################################################################
BAD_ARGS=85

if [ -z $1 ]
then
	echo "No argument given!"
	exit $BAD_ARGS
fi

n=$1
new=0
cs=0

while [ $n -gt 0 ]
do
	cs=`expr $n % 10`
	new=`expr $new \* 10 + $cs`
	n=`expr $n / 10`
done
echo "Reverse order of $1 number is $new"
		
