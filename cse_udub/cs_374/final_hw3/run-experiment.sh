#!/bin/bash
#Yang Zhang
#CSE 374 HW3
#Problem 3 run-experiment
#Fri Jan 24 15:22:21 PST 2014

rank=0
while read url  
do
	rank=$(($rank+1))
	echo "Performing measurement on $url"
	temp=$(./perform-measurement.sh "$url" -1) #redirect the standout to varible 
	if [[ $temp -ne 0 ]]; then
		echo "...success"
		echo $rank" "$url" "$temp >>"$2"
	else
		echo "...failed"
	fi

done <"$1"
