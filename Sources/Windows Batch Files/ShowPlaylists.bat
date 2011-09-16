:: Copyright (C) 2001 by Vincent Falco from One Guy Group, Inc.,
:: All Rights Reserved Worldwide.
::
:: This file is provided under MIT License:
:: http://www.opensource.org/licenses/mit-license.php
::
::------------------------------------------------------------------------------
::
:: This simple script merely displays all of the playlists in all
:: subdirectories, as a diagnostic tool.
::

@ECHO OFF
ECHO Displaying all playlists:
ECHO.
DIR /a-d /s /b *.m3u 2>NUL
ECHO.
PAUSE
