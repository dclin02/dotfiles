#!/bin/bash
xrandr --setprovideroutputsource modesetting NVIDIA-0
# xrandr --auto
xrandr --output eDP-1-1 --mode 1920x1080 --rate 144
sleep 1
xrandr --output DP-0 --primary --mode 1920x1080 --rate 144 --right-of eDP-1-1
sleep 1
xrandr --output HDMI-0 --mode 1360x768 --rate 60 --right-of DP-0
