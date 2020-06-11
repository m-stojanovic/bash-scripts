#!/bin/bash
###################################################################
#Script Name    :partuid.sh
#Description    :Edit disk partition content
#Date           :26-April-2020
#Author         :Milos Stojanovic
#Contact:       :https://www.linkedin.com/in/infomilosstojanovic/
###################################################################

file1=$1 # assign value from $1 parameter to file1
file2=$2

exec 3<$file1 # assign a file1 to file descriptor 3
exec 4<$file2

while IFS= read -r word1 <&3 && IFS= read -r word2 <&4; # link variable 'word1' with file descriptor 3
do
  echo "Line from first file: $word1"
  echo "Line from second file: $word2"
  sed -i "s/"$word1"/disk\/by-partuuid\/$word2/g" *
done

#need specify 2 text files
#first file need to have names of partitions
#second file need to have names of partuid
#first file content you get with:
# ls -all /dev/disk/by-partuuid | cut -d' ' -f12 | awk -F'/' '{print $3}' > partitions.txt
#second file content you get with: 
# ls -all /dev/disk/by-partuuid | cut -d' ' -f10 > partuid.txt
