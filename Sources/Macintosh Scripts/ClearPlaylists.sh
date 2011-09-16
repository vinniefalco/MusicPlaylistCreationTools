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
# Simple script to remove all the playlists

cd ../../..

echo "Removing existing playlists:"
find . -type f -name "*.m3u" -print -delete
echo
echo "Finished!"

