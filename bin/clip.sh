#!/bin/bash

BIGDIR="/home/melvin/mel/big"

cd $BIGDIR

xclip -o | awk '{ print ; print "---" }' > $BIGDIR/index.md

big-presentation-compose
big-presentation-offline

rm rubik-v4-latin-regular.woff2 rubik-v4-latin-regular.woff highlight.js highlight.css big.js big.css

mv index.offline.html index.html

git add .

git commit -m "Update main presentation"

git push origin master

git checkout gh-pages

git merge master

git push origin gh-pages

git checkout master
