#!/bin/sh

for ff in `ls -d WEBROOT/episodes/* | sort -r`
do 
    php create-a-new-rss-listing.php ${ff}/
done
