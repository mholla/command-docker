#!/usr/bin/env bash

set -e

echo -n "Enabling indirect GLX rendering on XQuartz... "
defaults write org.macosforge.xquartz.X11 enable_iglx -bool true
echo "done"

echo "Allowing X server connections from current IP address: "
xhost +$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
pkill -i xquartz
echo "... done"

echo "Forwarding X Window System connections to display: "
echo $DISPLAY
echo "Listening on port 6000..."
socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"

