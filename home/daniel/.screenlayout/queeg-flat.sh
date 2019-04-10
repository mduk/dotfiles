#!/bin/sh
xrandr \
  --output VGA-1 --off \
  --output LVDS-1 --mode 1280x720 --pos 0x2160 --rotate normal \
  --output HDMI-3 --off \
  --output HDMI-2 --off \
  --output HDMI-1 --off \
  --output DP-3 --off \
  --output DP-2 --off \
  --output DP-1 --mode 3840x2160 --pos 0x0 --rotate normal
