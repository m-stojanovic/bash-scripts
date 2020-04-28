#!/bin/bash
###################################################################
#Script Name    :archiveweblogs.sh
#Description    :Archive logs from $LOG_DIR to $BKP_DIR
#Date           :26-April-2020
#Author         :Milos Stojanovic
#Contact:       :https://www.linkedin.com/in/infomilosstojanovic/
###################################################################


PROBLEM=85

# Set this to your backup dir.
BKP_DIR=/opt/backups/weblogs

LOG_DAYS="3 2 1" # past 3 days
LOG_DIR=/var/log/httpd
LOG_FILES="access_log error_log"

# Default RedHat program locations
LS=/bin/ls
MV=/bin/mv
CUT=/bin/cut
TAR=/bin/tar

# Check is user root
if [ "$USER" != "root" ]; then
  echo "Only root can run this script!"
  exit $PROBLEM
fi

# Backup dir exists/writable?
if [ ! -x $BKP_DIR ]; then
  echo "$BKP_DIR doesn't exist or isn't writable!"
  exit $PROBLEM
fi

# Move, rename and archive the logs
for logday in $LOG_DAYS; do
  for logfile in $LOG_FILES; do
    MYFILE="$LOG_DIR/$logfile.$logday"
    if [ -w $MYFILE ]; then
      DTS=`$LS -la --time-style=+%Y%m%d $MYFILE | $CUT -d ' ' -f6`
      $MV $MYFILE $BKP_DIR/$logfile.$DTS
      $TAR $BKP_DIR/$logfile.$DTS
    else
      # Show an error if the file exits
      if [ -f $MYFILE ]; then
        echo "ERROR: $MYFILE not writable. Skipping."
      fi
    fi
  done
done

exit 0
