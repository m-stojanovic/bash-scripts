#!/bin/bash
###################################################################
#Script Name    :file_exists.sh
#Description    :Check does the file exist
#Date           :26-April-2020
#Author         :Milos Stojanovic
#Contact:       :https://www.linkedin.com/in/infomilosstojanovic/
###################################################################
FILE_LIST="$@" # catch all parameters

for file in ${FILE_LIST}; do
	if [ -e $file ]
	then
		echo "${file} is ok!"
	else
		echo "${file} does not exist!"
	fi
done

