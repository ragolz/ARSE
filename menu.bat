@echo off

REM Include config file
call config\config.bat

echo Enter Max Width eg 1920,1280,720
set /P maxwidth= Enter Max Width : 
%ffmpegdir%ffmpeg -i %inputfile% -codec:v libx264 -preset medium -vf scale=%maxwidth%:-1 -threads 0 -metadata comment="Encoded With ARSE https://github.com/meatpaste/ARSE" -codec:a copy "%outputdir%%~n1".%maxwidth%x.mp4
pause