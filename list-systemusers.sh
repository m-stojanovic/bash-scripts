#!/bin/bash
###################################################################
#Script Name    :list_systemusers.sh
#Description    :Display all system users
#Date           :26-April-2020
#Author         :Milos Stojanovic
#Contact:       :https://www.linkedin.com/in/infomilosstojanovic/
###################################################################

PASSWD_FILE=/etc/passwd
n=1

for name in $(awk -F':' '{print $1}' ${PASSWD_FILE})
do
	echo "${n}: ${name}"
	((n=n+1))
done

