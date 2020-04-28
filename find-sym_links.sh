#!/bin/bash
###################################################################
#Script Name    :find_sym_links.sh
#Description    :Find all symlinks in current directory
#Date           :26-April-2020
#Author         :Milos Stojanovic
#Contact:       :https://www.linkedin.com/in/infomilosstojanovic/
###################################################################
# specify a directory path as argument $1
directory=`pwd`
OUTPUTFILE=symlinks-list.txt

for file in $(find $1 -type l)
do
	echo "symbolic links in directory \"$directory\": ${file}"
done | sort >> $OUTPUTFILE
