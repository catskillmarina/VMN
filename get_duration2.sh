#!/bin/sh

MP3=$1
DURATION=$2

if [ -f $DURATION ]; then
   cat $DURATION
else
   ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 $1 |xargs |xargs printf "%.0f" > $DURATION
   cat $DURATION
fi

