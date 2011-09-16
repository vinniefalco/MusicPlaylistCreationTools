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
# Simple script to display all the playlists

cd ../../..

echo "Displaying playlists:"
find . -type f -name "*.m3u" -print
echo
echo "Finished!"
