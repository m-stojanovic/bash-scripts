#!/bin/bash
###################################################################
#Script Name    :puppetagent-setup.sh
#Description    :Configure puppet agent on a server
#Date           :26-April-2020
#Author         :Milos Stojanovic
#Contact:       :https://www.linkedin.com/in/infomilosstojanovic/
###################################################################
fsck="/etc/apt/sources.list.d/fsck.list"
jessie="/etc/apt/sources.list.d/debian_jessie_puppetlabs.list"
conf="/etc/puppetlabs/puppet/puppet.conf"

for server in `cat hosts.txt` # file with hostnames of remote servers
do
	log="/tmp/$server.log"
	echo "Installing puppetagent on $server, please wait..." 
	ssh root@$server "apt-get purge -y puppet facter hiera; 
		echo "deb http://image-priv.muc.domeus.com/apt/apt.puppetlabs.com jessie puppet6" >> $jessie; 
		if [ -f $fsck ]; then sed -i '1s/^/#/' $fsck; else echo; fi
		apt update;
		apt install -y puppet-agent=6.12.0-1jessie;
		echo "export PATH=\$PATH:/opt/puppetlabs/bin" >> ~/.bash_profile;
		echo -e "[main]\nenvironment = bigdatastg\n\n[agent]\nserver = dspuppet01.muc.domeus.com" >> $conf;" >> $log
done
echo "Check logs at /tmp."
