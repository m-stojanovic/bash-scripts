#!/bin/bash
###################################################################
#Script Name    :purge_docker.sh
#Description    :Removes docker from the system fully
#Date           :26-April-2020
#Author         :Milos Stojanovic
#Contact:       :https://www.linkedin.com/in/infomilosstojanovic/
###################################################################
dpkg -l | grep docker; echo; apt-get purge -y docker-engine docker docker.io docker-ce docker-ce-cli; apt-get purge docker-compose; echo; dpkg -l | grep docker; echo;  apt-get autoremove -y purge docker-engine docker docker.io docker-ce docker-ce-cli; rm -rf /var/lib/docker*; rm -rf /var/run/docker*; rm -rf /var/cache/apt-archives/docker*; groupdel docker; echo; echo; find / -iname "docker"; 

