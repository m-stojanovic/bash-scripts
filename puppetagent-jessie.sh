#!/bin/bash
###################################################################
#Script Name    :pa.sh
#Description    :Setup of puppet-agent jessie
#Date           :26-April-2020
#Author         :Milos Stojanovic
#Contact:       :https://www.linkedin.com/in/infomilosstojanovic/
###################################################################

if [ `whoami` != root ]
then
	echo "Please run this script as root!"
	exit 0
else
	read -p "Do you want to full setup puppet-agent [Y/N]? " answer_1
	case $answer_1 in
		Y | y) apt-get purge -y puppet && apt-get purge -y facter && apt-get purge -y hiera; lsb_release -a; puppet --version; facter --version; echo; echo; echo "deb http://image-priv.muc.domeus.com/apt/apt.puppetlabs.com jessie puppet6" >> /etc/apt/sources.list.d/debian_jessie_puppetlabs.list; rm /etc/apt/sources.list.d/fsck.list; echo; echo; apt-get update; apt-get install puppet-agent=6.12.0-1jessie; echo "export PATH=\$PATH:/opt/puppetlabs/bin" >> ~/.bash_profile; env | grep PATH; lsb_release -a; puppet --version; facter --version; echo -e "[main]\nenvironment = bigdatastg\n\n[agent]\nserver = dspuppet01.muc.domeus.com" >> /etc/puppetlabs/puppet/puppet.conf;
		;;
		N | n)  echo "Aborting installation.."
				exit 0
		;;
esac	
fi
