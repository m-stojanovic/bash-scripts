#!/bin/bash
###################################################################
#Script Name    :ftp.sh
#Description    :FTP to a server X and put file in directory Y
#Date           :26-April-2020
#Author         :Milos Stojanovic
#Contact:       :https://www.linkedin.com/in/infomilosstojanovic/
###################################################################
E_BADARGS=85

if [ -z "$1" ]
then
  echo "Usage: `basename $0` filename"
  exit $E_BADARGS
fi

Username=root           
password=$PWD/password.txt
# File containing password.

Filename=`basename $1`  # Strips pathname out of file name.

Server="XXX"
Directory="YYY"         # Change above to actual server name & directory.

ftp -n $Server << END
user $Username $password
cd $Directory
put $Filename
bye
END
# -n option to "ftp" disables auto-logon.
exit 0
