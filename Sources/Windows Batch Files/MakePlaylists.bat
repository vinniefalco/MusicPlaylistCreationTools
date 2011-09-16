:: Copyright (C) 2001 by Vincent Falco from One Guy Group, Inc.,
:: All Rights Reserved Worldwide.
::
:: This file is provided under MIT License:
:: http://www.opensource.org/licenses/mit-license.php
::
::------------------------------------------------------------------------------
::
:: Recursive batch file (.BAT) script which produces playlists based on
:: a directory hierarchy.
::
:: The script is invoked without parameters and calls itself recursively
:: to produce the playlists in each directory.
::
:: There are three invocations:
::
:: {script}
::
::   Parameterless invocation calls itself for each directory in the location
::   as the script. This is what the user runs.
::
:: {script} {friendly prefix} {file prefix}
::
::   Level one recursive call to produce a single .m3u file containing
::   all music files in the current directory and subdirectories.
::   {friendly prefix} and {file prefix} are used to construct the playlist
::   file name, and the relative file paths in the playlist file.
::
:: {script} /O {file prefix}
::
::   Level two recursive call. The /O option means "output". In this
::   form of invocation, the script simply echoes relative filenames
::   of all music files in the current directory and subdirectories,
::   prepending the names with {file prefix}

@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION ENABLEEXTENSIONS
IF "%~1" == "/O" (
  FOR %%F in (*.mp3 *.wav *.aiff) DO (
    SET PQ="%~2%%~F"
    SET P=!PQ:~1,-1!
    ECHO !P!
  )
  FOR /D %%D in (*) DO (
    CD "%%~D"
    CALL "%~f0" "/O" "%~2%%~nD/"
    CD ..
  )
) ELSE ( IF NOT "%~1" == "" (
  SET N="%~1%.m3u"
  CALL "%~F0" "/O" "%~2" > !N!
  FOR %%Z IN (!N!) DO IF %%~zZ==0 (
    DEL /F /Q "%%~Z"
  ) ELSE (
    ECHO Created: !N!
  )
  FOR /D %%D in (*) DO (
    CD "%%~D"
    CALL "%~f0" "%~1 %%~nD" ""
    CD ..
  )
) ELSE (
  ECHO Removing existing playlists:
  DEL /S /Q *.m3u 2>NUL
  ECHO.
  ECHO Creating automatic playlists:
  FOR /D %%D in (*) DO (
    CD "%%~D"
    CALL "%~f0" "%%~nD" ""
    CD ..
  )
  ECHO.
  ECHO Playlist creation is complete.
  ECHO.
  PAUSE
) )
ENDLOCAL
