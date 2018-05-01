#!/bin/bash

BIGDIR="/home/melvin/mel/big"

cd $BIGDIR

xclip -o | awk '{ print ; print "---" }' > $BIGDIR/index.md

big-presentation-compose
