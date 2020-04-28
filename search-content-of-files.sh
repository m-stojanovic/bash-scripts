#!/bin/bash
###################################################################
#Script Name    :grep_content_of_files.sh
#Description    :Provide filename and string to search
#Date           :26-April-2020
#Author         :Milos Stojanovic
#Contact:       :https://www.linkedin.com/in/infomilosstojanovic/
###################################################################
# arg $1 - path to dir
# arg $2 - string to search in a files inside $1
fstrings=$2
for file in $(find $1 -type f -iname "*" | sort)
do
	strings -f $file | grep "$fstrings"
done

