#!/bin/bash
###################################################################
#Script Name    :install_docker.sh
#Description    :Install Docker and all components
#Date           :26-April-2020
#Author         :Milos Stojanovic
#Contact:       :https://www.linkedin.com/in/infomilosstojanovic/
###################################################################

if [ `whoami` != root ]
then
	echo "Please run this script as root!"
	exit 0
else
	read -p "Do you want to set docker-repository and install docker [Y/N]? " answer_1
	case $answer_1 in
		Y | y) apt-get update; apt-get install apt-transport-https ca-certificates curl software-properties-common; curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -; echo; echo -n "Verify that you now have the key with the fingerprint ending with 0EBFCD88: "; echo; apt-key fingerprint 0EBFCD88; sleep 2; echo; add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"; apt-get update; apt-get install docker-ce docker-ce-cli containerd.io docker-compose; echo; echo -n "You have finished installing docker and docker-compose along with docker repository."; echo; echo;
		;;
		N | n)  read -p "Do you want to install only docker? [Y/N] " answer_2
		       	case $answer_2 in
				Y | y) apt-get update; apt-get install docker-ce docker-ce-cli containerd.io docker-compose; echo; echo -n "You have finished installing docker and docker-compose"; echo; echo;
				;;
				N | n) 	echo "Aborting installation.."
					exit 0
				;;
			esac
		;;
esac	
fi
