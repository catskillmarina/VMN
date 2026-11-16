READ all the README.md s !

Create the files

description.txt  Episode-whatever.mp3  title.txt

... in the correct subdirctory in WEBROOT/episodes/

Naming convention of the subdirectory is such:

2026-07-09-00

need the following in the directory

title.txt description.txt  something.mp3

create-upload.sh will put the files on the server.

It will create date.txt and duration.txt

See vars.php

NOTE !! Date must be in the right format:

$ date -d "October 25, 2020" '+%a, %d %b %Y %T %z'
Sun, 25 Oct 2020 00:00:00 -0400

