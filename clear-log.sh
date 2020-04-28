#!/bin/bash
###################################################################
#Script Name    :clear-log.sh
#Description    :Deletes log in specific directory
#Date           :26-April-2020
#Author         :Milos Stojanovic
#Contact:       :https://www.linkedin.com/in/infomilosstojanovic/
###################################################################

ROOT_UID=0
NOT_ROOT=99

if [ $UID -ne $ROOT_UID ]
then
	echo "Please run this script as root!"
	exit $NOT_ROOT
fi

read -p "Please enter the absolute path to the logs: " LOCATION

if [[ $LOCATION == "/var/log" ]]
then
   	find $LOCATION -iname "*\.log\.[1-9]" | xargs rm -rf
	echo "Hello, logs in $LOCATION have been cleaned!"
else
	find $LOCATION -iname "*\.log\.*" | xargs rm -rf
	echo "Hello, logs in $LOCATION have been cleaned!"
fi
