:: Copyright (C) 2001 by Vincent Falco from One Guy Group, Inc.,
:: All Rights Reserved Worldwide.
::
:: This file is provided under MIT License:
:: http://www.opensource.org/licenses/mit-license.php
::
::------------------------------------------------------------------------------
::
:: Simple script to delete all the playlists.
::

@ECHO OFF
ECHO Removing existing playlists:
DEL /S *.m3u 2>NUL
ECHO.
PAUSE


