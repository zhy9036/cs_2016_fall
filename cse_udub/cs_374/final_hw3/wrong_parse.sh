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
fi


TEMP=$(mktemp /tmp/out.XXXXXX)

echo $(grep 'http:' "$1" | sed 's/.*http/http/g; s/http%.*//g;s/">.*//g;
	s/.*babelfish.*//g; s/.*electoral.*//g;s/.*100best.*//g;s/" "/\n/g') >$TEMP

tr ' ' '\n' <$TEMP 1>$2 
rm $TEMP
#URL_REGEX='(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'
#URL_NEW='^(http|https|ftp)\:\/\/[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(:[a-zA-Z0-9]*)?\/?([a-zA-Z0-9\-\._\?\,\\/\\\+&amp;%\$#\=~])*[^\.\,\)\(\s]$'
#URL='((http|ftp|https):\/\/)(([a-zA-Z0-9\._-]+\.[a-zA-Z]{2,6})|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,4})*(\/[a-zA-Z0-9\&%_\.\/-~-]*)?$'
