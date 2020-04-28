#!/bin/bash
###################################################################
#Script Name    :random_numbers.sh
#Description    :Demostration of generating random numbers in range
#Date           :26-April-2020
#Author         :Milos Stojanovic
#Contact:       :https://www.linkedin.com/in/infomilosstojanovic/
###################################################################
function random_num_range_1(){
	local MAX=10
	local i=1
	local RANGE=33

while [ ${i} -lt ${MAX} ]
do
        NUMBER=$RANDOM
        let "NUMBER %= $RANGE"
        echo $NUMBER
        ((i=i+1))
done
}

function random_num_range_2(){
	local MIN=3000
	local NUMBER=100
	local BOTTOM=30000
	local TOP=40000

while [ ${NUMBER} -le ${BOTTOM} ] && [ ${NUMBER} -le ${TOP} ]
do
        NUMBER=$RANDOM
done
echo "$NUMBER"
#Output:
#+ NUMBER=624
#+ '[' 624 -le 30000 ']'
#+ NUMBER=9881
#+ '[' 9881 -le 30000 ']'
#+ NUMBER=25625
#+ '[' 25625 -le 30000 ']'
#+ NUMBER=32621
#+ '[' 32621 -le 30000 ']'
#+ echo 32621
#32621
}

random_num_range_1
echo
random_num_range_2
echo
