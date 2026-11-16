#!/bin/sh

if ! test -f $1
then 
    date '+%a, %d %b %Y %T %z' |tr -d '\n' > $1
fi
cat $1 | tr -d '\n'
