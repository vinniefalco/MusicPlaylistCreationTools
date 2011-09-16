#!/bin/bash
#
# Copyright (C) 2011 by Vincent Falco from One Guy Group, Inc.,
# All Rights Reserved Worldwide.
# 
# This file is provided under MIT License
# http://www.opensource.org/licenses/mit-license.php
#
# -----------------------------------------------------------------------------
#
# Recursive bash shell script which produces playlists based on
# a directory hierarchy.

if [ "$1" == "-o" ]
then
  find . -name "*.mp3" -print
  find . -name "*.wav" -print
  find . -name "*.aiff" -print

elif [ $# == 2 ] # playlist file name friendly prefixed
then
  cd "$1"
  f=$(basename "$1") # friendly name
  n="$2 $f.m3u"       # playlist file name
  "$0" -o >> "$n"
  if [ -s "$n" ]
  then
     echo "Created $n"
  fi
  find . -type d -maxdepth 1 -mindepth 1 -exec "$0" "{}" "$2 $f" ";"

elif [ $# == 1 ] # no friendly prefix
then
  cd "$1"
  f=$(basename "$1") # friendly name
  n="$f.m3u"       # playlist file name
  "$0" -o >> "$n"
  if [ -s "$n" ]
  then
     echo "Created $n"
  fi
  find . -type d -maxdepth 1 -mindepth 1 -exec "$0" "{}" "$f" ";"

else
  cd ../../..
  
  echo "Removing existing playlists:"
  find . -type f -name "*.m3u" -print -delete
  echo

  echo "Creating automatic playlists:"
  find . -name \*.app -prune -o -type d -maxdepth 1 -mindepth 1 -exec "$0" "{}" ";"
  echo
  echo "Finished!"

fi

