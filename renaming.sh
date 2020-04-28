#!/bin/bash
###################################################################
#Script Name    :continue-Nth-loop.sh
#Description    :Rename a file, compatible with unrename.sh
#Date           :26-April-2020
#Author         :Milos Stojanovic
#Contact:       :https://www.linkedin.com/in/infomilosstojanovic/
###################################################################
#!/bin/bash
FILES=$(ls)
DATE=$(date +%F)

for FILE in $FILES 
do
	echo "renaming ${FILE} to ${FILE}-${DATE}"
	mv $FILE $FILE-$DATE
done

