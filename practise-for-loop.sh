#!/bin/bash
###################################################################
#Script Name    :planet.sh
#Description    :Demostration of for loop
#Date           :26-April-2020
#Author         :Milos Stojanovic
#Contact:       :https://www.linkedin.com/in/infomilosstojanovic/
###################################################################
# Associate the name of each planet with its distance from the sun.

for planet in "Mercury 36" "Venus 67" "Earth 93"  "Mars 142" "Jupiter 483"
do
  set $planet
  echo "$1		$2,000,000 miles from the sun"
done
