#!/bin/sh
xrandr --output DP-3 --off --output DP-1 --off --output eDP-1 --primary --mode 2560x1440 --pos 0x0 --rotate normal --output DP-2 --off
sleep 1
i3-polybar
map-touchscreen
