#!/bin/bash
###################################################################
#Script Name    :log_commands_to_file.sh
#Description    :Pass commands to a new log file
#Date           :26-April-2020
#Author         :Milos Stojanovic
#Contact:       :https://www.linkedin.com/in/infomilosstojanovic/
###################################################################

DEFAULT_LOGFILE=logfile.txt
#       Can be a complex chain of commands,
OPERATION=
# 	if not set, default to DEFAULT_LOGFILE
LOGFILE=
if [ -z "$LOGFILE" ]
then    
  LOGFILE="$DEFAULT_LOGFILE"
fi

# Log it
echo "`date` + `whoami` + $OPERATION "$@"" >> $LOGFILE
# Now, execute it
exec $OPERATION "$@"
