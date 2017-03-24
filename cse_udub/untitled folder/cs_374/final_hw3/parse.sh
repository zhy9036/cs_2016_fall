#!/bin/bash
#Yang Zhang
#CSE 374 HW3
#Problem 2 parse 
#Fri Jan 24 15:22:21 PST 2014

if [ $# -lt 2 ]
	then 
	echo "Error: less than two arguments" >&2
	exit 1
fi 
if [[ ! -e "$1" ]]; then
	echo "Error: $1 doesn't exist" >&2
	exit 1
fi


TEMP=$(mktemp /tmp/out.XXXXXX)
echo $(grep 'http:' "$1" | sed 's/.*\(http:.*\)\".*/\1/;s/.*babelfish.*//g; s/.*electoral.*//g;s/.*100best.*//g;s/" "/\n/g') >$TEMP
cat $TEMP > "$2"
tr ' ' '\n' <$TEMP 1>$2 #covert white space into new line
rm $TEMP

