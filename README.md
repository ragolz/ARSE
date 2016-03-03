ARSE
====

A Really Simple Encoder
Get FFMPEG windows builds from here: http://ffmpeg.zeranoe.com/builds/

Roadmap
=======

1. create a set of .bat files for drag/drop encoding
2. create a simple windows front end for (1)
3. queueing multiple jobs

Bitrates
========

Information taken from Google's Youtube documentation
label / resolution / video bitrate / audio bitrate
360p / 640x360 / 1000kbps / 128kbps
480p / 854x480 / 2500kbps / 128kbps
720p / 1280x720 / 5000kbps / 384kbps
1080p / 1920x1080 / 8000kbps / 384kbps

2016-03-03 Update
=========
New script added with the following features mp4-video.bat
1. added support for selecting max video width
2. added config file for setting options
3. added config file for setting location of FFMPEG
4. added config file and options for setting output directory, all encoded files are saved in the same place, currently required, needs more work to add support for using original fille location when not set.
