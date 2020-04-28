#!/bin/bash
###################################################################
#Script Name    :nested-loop.sh
#Description    :Usage of dialog command in script
#Date           :26-April-2020
#Author         :Milos Stojanovic
#Contact:       :https://www.linkedin.com/in/infomilosstojanovic/
###################################################################
#!/bin/bash

temp1=$(mktemp -t dialog1.XXXXXX)
temp2=$(mktemp -t dialog2.XXXXXX)

function diskspace {
	df -k > $temp1
	dialog --textbox $temp1 20 50
}

function whoseon {
	uptime | awk '{print $2,$3}' > $temp1
	who | awk '{print $1, $2, $3, $4}' >> $temp1
	date >> $temp1
	dialog --textbox $temp1 20 50
}

function memusage {
	cat /proc/meminfo > $temp1
	dialog --textbox $temp1 20 50
}

while [ 1 ]
do
	dialog --menu "Sys Admin Menu" 30 40 5 1 "Display disk space" 2 "Display users" 3 "Display memory usage" 0 "Exit program" 2> $temp2
	if [ $? -eq 1 ]
	then
		break
	fi

	selection=$(cat $temp2)

	case $selection in
		1) 
			diskspace ;;
		2)
			whoseon ;;
		3)
			memusage ;;
		0)
			break ;;
		*)
			dialog --msgbox "Sorry, invalid selection" 20 30
	esac
done
rm -f $temp1 2> /dev/null
rm -f $temp2 2> /dev/null
