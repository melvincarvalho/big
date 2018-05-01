#!/bin/bash

BIGDIR="/home/melvin/mel/big"

cd $BIGDIR

xclip -o | awk '{ print ; print "---" }' > $BIGDIR/index.md

big-presentation-compose

git add .

git commit -m "Update main presentation"

git push origin master

git checkout gh-pages

git merge master

git push origin gh-pages

git checkout master
