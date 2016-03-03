@echo off

REM Include config file
call %~dp0\config\config.bat
set inputfile=%1

REM Display menu options
echo Max Width Optionse
echo 1:1920
echo 2:1280
echo 3:720
echo 4:640
echo 5:320
echo Enter Max Width eg 2
set /P inputmaxwidth= Enter Max Width :
IF /I "%inputmaxwidth%" EQU "1" set maxwidth=1920
IF /I "%inputmaxwidth%" EQU "2" set maxwidth=1280
IF /I "%inputmaxwidth%" EQU "3" set maxwidth=720
IF /I "%inputmaxwidth%" EQU "4" set maxwidth=640
IF /I "%inputmaxwidth%" EQU "5" set maxwidth=320

echo Max width set to:%maxwidth%
echo Ready to encode: %inputfile%
pause

REM Encode Video
%ffmpegdir%ffmpeg -i %inputfile% -codec:v libx264 -preset medium -vf scale=%maxwidth%:-1 -threads 0 -metadata comment="Encoded With ARSE https://github.com/meatpaste/ARSE" -codec:a copy "%outputdir%%~n1".%maxwidth%x.mp4
echo Encoded file has been saved in %outputdir%
pause

