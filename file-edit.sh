#!/bin/bash
###################################################################
#Script Name    :file-edit.sh
#Description    :
#Date           :26-April-2020
#Author         :Milos Stojanovic
#Contact:       :https://www.linkedin.com/in/infomilosstojanovic/
###################################################################

lineno=2            # Append from line 2 
BAD_ARGS=85	    # Error code

string0="###################################################################"
string2="#Description    :"
string3="#Date           :`date +%d-%B-%Y`"
string4="#Author         :Milos Stojanovic"
string5="#Contact:       :https://www.linkedin.com/in/infomilosstojanovic/"
string6="###################################################################"
# Can be any other strings

if [ ! -f $1 ]; then
	echo "Please specify at least 1 filename as an argument!"
	exit $BAD_ARGS
fi

until [ -z  "$1" ]
do 
	string1="#Script Name    :$1"
	file=$1;
 	sed -i ""$lineno"i $string0\n$string1\n$string2\n$string3\n$string4\n$string5\n$string6" $file
 	echo "File "\'$file\'" altered at line number: $lineno"
	shift 1
done

exit 0
