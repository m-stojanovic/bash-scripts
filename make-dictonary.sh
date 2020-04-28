#!/bin/bash
###################################################################
#Script Name    :makedict.sh
#Description    :List all words from a file on new line 
#Date           :26-April-2020
#Author         :Milos Stojanovic
#Contact:       :https://www.linkedin.com/in/infomilosstojanovic/
###################################################################
BADARGS=85

if [ ! -r "$1" ]                    
then                                
  echo "This file does not have 'READ' permission!"
  exit $BADARGS
fi

cat $* |                            #  Dump specified files to stdout.
        tr A-Z a-z |                #  Convert to lowercase.
        tr ' ' '\n' |               #  New: change spaces to newlines.
	tr -c '\na-z' '\n' |            #  Get rid of everything
                                    #  non-alphanumeric characters
        		                    #  and  change them to newlines so later can be deleted
        sort |                      #  sort it from a-z
        uniq |                      #  Remove duplicates.
        grep -v '^#' |              #  Delete lines starting with #.
        grep -v '^$'                #  Delete blank lines

exit $?
