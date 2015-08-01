#!/bin/sh
export DISPLAY=localhost:1.0
rm -rf ~/.vnc/*.log /tmp/plugtmp* > /dev/null 2>&1
killall iceweasel 
nohup iceweasel > /dev/null 2>&1 &