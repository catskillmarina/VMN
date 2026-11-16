#!/bin/sh

DIRS=`ls -d WEBROOT/episodes/*`

for DIR in $DIRS
do
    MP3=`ls $DIR/*.mp3`
    DURATION=$DIR/duration.txt
    if [ -f $DURATION ]; then
        echo > /dev/null
    else
        ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 $MP3 |xargs |xargs printf "%.0f" > $DURATION
    fi
done



