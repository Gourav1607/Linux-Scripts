#!/bin/bash

echo " Getting Root Permission ..."
echo " Ranking Mirrors : "

sudo reflector --verbose -l 50 -p http --sort rate --save /etc/pacman.d/mirrorlist
