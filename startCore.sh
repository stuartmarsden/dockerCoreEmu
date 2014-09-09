#!/bin/bash
Xvfb :1 -extension GLX -screen 0 1900x1050x24& 
/etc/init.d/core-daemon start
sleep 2
DISPLAY=:1 openbox&
DISPLAY=:1 /usr/bin/core-gui&
x11vnc -usepw -forever -display :1
 
exit 0