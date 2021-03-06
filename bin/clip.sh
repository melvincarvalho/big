#!/bin/bash

BIGDIR="/home/melvin/mel/big"

cd $BIGDIR

xclip -o | awk ' /^    [^ ]/ { print "---" } ;  /^        [^ ]/ { printf "-" } ; { print } ' > $BIGDIR/index.md

big-presentation-compose
big-presentation-offline

rm rubik-v4-latin-regular.woff2 rubik-v4-latin-regular.woff highlight.js highlight.css big.js big.css

mv index.offline.html index.html

cat index.md


if [[ "$1" == "nocommit" ]]
then
  echo "no commit"
  exit
fi


git add .

git commit -m "Update main presentation"

git push origin master

git checkout gh-pages

git merge master --no-edit

git push origin gh-pages

git checkout master
