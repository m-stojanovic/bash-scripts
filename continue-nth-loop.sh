#!/bin/bash
###################################################################
#Script Name    :continue-Nth-loop.sh
#Description    :Testing continue command
#Date           :26-April-2020
#Author         :Milos Stojanovic
#Contact:       :https://www.linkedin.com/in/infomilosstojanovic/
###################################################################
# The "continue N" command, continuing at the Nth level loop.

for outer in I II III IV V
do
	echo "Group $outer: " # outer loop
	for inner in 1 2 3 4 5 6 7 8 9 10 # inner loop
	do
		if [[ $inner -eq 7 && $outer = "III" ]] 
		then
			continue 2 # continue at loop on 2nd level ( outer loop )
		fi
	echo "$inner "
	done
done
echo


