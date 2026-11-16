#!/bin/bash

#SSHUSER=root@cirrus3.e271.net
#DESTDIR=/home/e271/public_html/test-podcast/
SSHUSER=root@stratus4.e271.net
DESTDIR=/home/vermontmovementnews/WEBROOT/

echo "creating duration.txt in directories"
./get_duration3.sh

echo "creating RSS"
php create-rss.php > WEBROOT/feed/podcast/index.html

echo "Moving feed files into place"
cp WEBROOT/feed/podcast/index.html WEBROOT/feed/podcast/index.rss
cp WEBROOT/feed/podcast/index.html WEBROOT/feed/podcast/index.txt
cp WEBROOT/feed/podcast/index.html WEBROOT/feed/index.rss
cp WEBROOT/feed/podcast/index.html WEBROOT/feed/index.txt
cp WEBROOT/feed/podcast/index.html WEBROOT/feed/index.html

echo "Creating web page"
php create-index.php > WEBROOT/index.html

echo "backing up ugly script"
tree . > directory-structure.txt
tar --exclude='./foo.tgz' --exclude='./WEBROOT' --exclude='./OLD-JUNK' -cvzf WEBROOT/code.tgz .

echo -n "Upload this to the server y/n ? : "
read doit

if [[ "$doit" == "y" ]]
then
    rsync -avz -e "ssh" WEBROOT/ $SSHUSER:${DESTDIR}
else
    echo "Upload Cancelled !"
fi
