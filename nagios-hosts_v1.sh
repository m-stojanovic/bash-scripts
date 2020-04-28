###################################################################
#Script Name    :nagios-hosts_v1.sh
#Description    :Put the hostnames from file, and create Nagios template
#Date           :26-April-2020
#Author         :Milos Stojanovic
#Contact:       :https://www.linkedin.com/in/infomilosstojanovic/
###################################################################
content=$1
[ ! -f "$content" ] && { echo "$0 - File $content not found."; exit 1; } 

while IFS= read -r file
do
	address=${file#*3}
	echo "\"%{hiera('nagios::config::dirs::conf_d_hosts_ecmdas_emc')}/$file.cfg\":
    	template: define
    	defines:
      	- host:
          use: generic-host
          hostgroups: ecmdas-emc-hdp,ecmdas-emc-hardware
          host_name: $file
          alias: $file.muc.domeus.com
          address: 172.17.8.$address"
	echo
	echo
done < $content
