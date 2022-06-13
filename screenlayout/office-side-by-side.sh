#!/bin/sh
xrandr --output eDP-1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-2 --off --output DP-2 --off --output HDMI-3 --off

OUTPUT=HDMI-1

for WORKSPACE in 1 2 3 4 5 6 7 10; do 
  i3-msg "workspace $WORKSPACE; move workspace to output $OUTPUT"
done
