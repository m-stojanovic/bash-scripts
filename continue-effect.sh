#!/bin/bash
###################################################################
#Script Name    :continue-effect.sh
#Description    :Testing 'continue' command
#Date           :26-April-2020
#Author         :Milos Stojanovic
#Contact:       :https://www.linkedin.com/in/infomilosstojanovic/
###################################################################
# Print numbers through 1 to 20, but not from 3 to 11 
MAX=20
MIN=0

while [ ${MIN} -le ${MAX} ]
do
	((MIN=MIN+1))
	if [ ${MIN} -ge 3 ] && [ ${MIN} -le 11 ]
	then
		continue
	fi
	echo ${MIN}
done



