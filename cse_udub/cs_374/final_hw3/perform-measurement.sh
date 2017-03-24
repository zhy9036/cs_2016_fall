#!/bin/bash
#Yang Zhang
#CSE 374 HW3
#Problem 1 perform-measurement
#Fri Jan 24 15:22:21 PST 2014

if [ $# -lt 1 ]
    then
    echo "Error: no input URL" >&2
    exit 1
fi
TEMP=$(mktemp /tmp/temporary-file.XXXXXX)
wget "$1" -q -t 1 -T 5 -O $TEMP #wget "$1" -q # -q option --> go quite which hide wgetLog
if [ $? -ne 0 ]
    then
    echo "0"
    rm -f $TEMP
    exit 1
fi
echo $(wc -c < $TEMP) && rm -f $TEMP


