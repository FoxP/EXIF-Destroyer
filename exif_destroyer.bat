REM		Name :
REM					EXIF Destroyer
REM		Author :
REM					▄▄▄▄▄▄▄  ▄ ▄▄ ▄▄▄▄▄▄▄
REM					█ ▄▄▄ █ ██ ▀▄ █ ▄▄▄ █
REM					█ ███ █ ▄▀ ▀▄ █ ███ █
REM					█▄▄▄▄▄█ █ ▄▀█ █▄▄▄▄▄█
REM					▄▄ ▄  ▄▄▀██▀▀ ▄▄▄ ▄▄
REM					 ▀█▄█▄▄▄█▀▀ ▄▄▀█ █▄▀█
REM					 █ █▀▄▄▄▀██▀▄ █▄▄█ ▀█
REM					▄▄▄▄▄▄▄ █▄█▀ ▄ ██ ▄█
REM					█ ▄▄▄ █  █▀█▀ ▄▀▀  ▄▀
REM					█ ███ █ ▀▄  ▄▀▀▄▄▀█▀█
REM					█▄▄▄▄▄█ ███▀▄▀ ▀██ ▄
@ECHO off
REM Console title
TITLE EXIF Destroyer
REM Script folder path
SET directoryPath=%~dp0
REM Console height / width
MODE 65,30 | ECHO off
ECHO.
ECHO   -------------------------------------------------------------
ECHO                          EXIF Destroyer :
ECHO   -------------------------------------------------------------
ECHO.
REM First command line argument
SET argPath=%1
REM If first argument is a directory
IF EXIST %argPath%\* (
	REM ECHO Directory : %argPath%
	REM Iterate through JPG files in directory
	FOR %%f IN (%argPath%\*.jpg %argPath%\*.jpeg) DO (
		REM Print file name (with extension)
		ECHO - %%~nf%%~xf
		REM Remove EXIF metadata
		"%directoryPath%ExifTool\exiftool.exe" -all= -q -charset filename=Latin -tagsfromfile @ -Orientation "%%f" -o "%%~df%%~pf%%~nf_noexif.jpg"
	)
REM If first argument is a file
) ELSE (
	REM ECHO File : %argPath%
	FOR %%f IN (%argPath%) DO (
		REM Print file name (with extension)
		ECHO - %%~nf%%~xf
		REM Remove EXIF metadata
		"%directoryPath%ExifTool\exiftool.exe" -all= -q -charset filename=Latin -tagsfromfile @ -Orientation %argPath% -o "%%~df%%~pf%%~nf_noexif.jpg"
	)
)
REM Wait 10 seconds, then exit script
TIMEOUT 10