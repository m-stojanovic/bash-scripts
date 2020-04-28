#!/bin/bash
FILES=$(ls)
DATE=$(date +%F)
NAME=$(basename $0)
for FILE in $FILES
do
	NEW_FILE=${FILE::-11} #oduzmi 11 charactera kolika je duzina komande pod varijablom $DATE
	echo "This is file name $FILE, we need remove the date $DATE"
	if [ $FILE != $NAME ]; #ako trenutni fajl kojem menjamo ime nije ime skripte onda uradi cmd mv
	then
		mv $FILE $NEW_FILE
	fi
done

