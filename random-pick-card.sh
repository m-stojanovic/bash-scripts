#!/bin/bash
###################################################################
#Script Name    :random_pick_card.sh
#Description    :Random type and random card number
#Date           :26-April-2020
#Author         :Milos Stojanovic
#Contact:       :https://www.linkedin.com/in/infomilosstojanovic/
###################################################################
TYPES="Karo Pik Herc Tref"
CARDS="2 3 4 5 6 7 8 9 10 Zandar Dama Kralj Kec"

TYPE=($TYPES) # read into array variable
CARD=($CARDS)

num_types=${#TYPE[*]} # count how many elements each array has
num_cards=${#CARD[*]}

echo -n "${CARD[$((RANDOM%num_cards))]} " # syntax $((RANDOM%smth))
echo ${TYPE[$((RANDOM%num_types))]}

