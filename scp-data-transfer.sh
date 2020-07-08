#!/bin/bash
###################################################################
#Script Name    :scp-data-transfer.sh
#Description    :Transfer data from remote host to your local machine
#Date           :08-July-2020
#Author         :Milos Stojanovic
#Contact:       :https://www.linkedin.com/in/infomilosstojanovic/
###################################################################
for server in `cat hosts.txt` # file with hostnames of remote servers
do
	remhost=`ssh $server hostname`
	echo "Doing data transfer from $server, please wait..." 
	scp $server:~/$remhost.tar ~/; # file that we transfer is named $HOSTNAME.tar 
done
