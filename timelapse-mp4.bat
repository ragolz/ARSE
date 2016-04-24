@echo off

REM Include config file
call config\config.bat
echo "FFMpeg Dir: "%ffmpegdir%
echo "Output Dir: "%outputdir%
echo "percent1: "%1
echo "dpn1: "%~dpn1
echo "Name: "%~n1
set inputfile=%1
echo "Input File: "%inputfile%
echo Starting
pause
set /P maxwidth= Width : 
set /P imagename= name before numbering : 
set /P imageextension= image extension : 
REM ffmpeg -i %inputfile% -codec:v libx264 -preset medium -vf scale=1920:-1 -threads 0 -metadata comment="Encoded With ARSE https://github.com/meatpaste/ARSE" -codec:a copy "%~dpn1".1920x.mp4
REM ffmpeg -i %inputfile% -codec:v libx264 -preset medium -vf scale=1920:-1 -threads 0 -metadata comment="Encoded With ARSE https://github.com/meatpaste/ARSE" -codec:a copy "%outputdir%\%~n1".1920x.mp4
REM WORKING!! %ffmpegdir%ffmpeg -i %inputfile% -codec:v libx264 -preset medium -vf scale=1920:-1 -threads 0 -metadata comment="Encoded With ARSE https://github.com/meatpaste/ARSE" -codec:a copy "%outputdir%\%~n1".1920x.mp4
REM %ffmpegdir%ffmpeg -i %inputfile% -codec:v libx264 -preset medium -vf scale=%maxwidth%:-1 -threads 0 -metadata comment="Encoded With ARSE https://github.com/meatpaste/ARSE" -codec:a copy "%outputdir%%~n1".%maxwidth%x.mp4
%ffmpegdir%ffmpeg -pattern_type glob -f image2 -r 30 -i %inputfile%\%imagename%*.%imageextension% -vcodec libx264 -preset medium -crf 22 -threads 0 -vf scale=1920:-1 -r 15 -metadata comment="Encoded With ARSE https://github.com/meatpaste/ARSE" "%outputdir%%~n1".%maxwidth%x.mp4

pause
REM ffmpeg -f image2 -i %*.JPG video.mp4
REM ffmpeg -i output.mp4 -codec:v libx264 -preset slow -vf scale=-1:480 -threads 0 -codec:a copy test.html5.mp4
REM ffmpeg -i input_file.avi -codec:v libx264 -profile: high -preset slow -b:v 500k -maxrate 500k -bufsize 1000k -vf scale=-1:480 -threads 0 -codec:a libfdk_aac -b:a 128k output_file.mp4

REM Input 90FPS
REM ffmpeg -start_number 1620 -r 90 -i IMG_%04d.JPG -vcodec libx264 -preset medium -crf 22 -threads 0 -vf scale=1920:-1 -r 15 -metadata title="Katie's Party 2016-01-23 Imagzilla.co.uk" Party_2016-01-23.mp4

REM Input 10FPS
REM ffmpeg -start_number 1620 -r 10 -i IMG_%04d.JPG -vcodec libx264 -preset medium -crf 22 -threads 0 -vf scale=1920:-1 -r 15 -metadata title="Katie's Party 2016-01-23 Imagzilla.co.uk" Party_2016-01-23_10fps.mp4

REM Input 30FPS
REM ffmpeg -start_number 1620 -r 30 -i IMG_%04d.JPG -vcodec libx264 -preset medium -crf 22 -threads 0 -vf scale=1920:-1 -r 15 -metadata title="Katie's Party 2016-01-23 Imagzilla.co.uk" Party_2016-01-23_30fps.mp4
REM %ffmpegdir%ffmpeg -i %inputfile% -ab 320k -map_metadata 0 -id3v2_version 3 "%outputdir%%~n1".mp3