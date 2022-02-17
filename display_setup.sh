#!/bin/bash
xrandr --setprovideroutputsource modesetting NVIDIA-0
# xrandr --auto
xrandr --output eDP-1-1 --mode 1920x1080 --rate 144
# sleep 1
# xrandr --output DP-0 --primary --mode 1920x1080 --rate 144 --left-of eDP-1-1
xrandr --output DP-0 --primary --mode 1920x1080 --rate 144 --left-of eDP-1-1
# sleep 1
xrandr --output HDMI-0 --mode 1920x1080 --rate 60 --same-as DP-0
# sleep 1
# feh --bg-scale /usr/share/backgrounds/i3_default_background.jpg
