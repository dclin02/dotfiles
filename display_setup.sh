#!/bin/bash
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
# xrandr --output eDP-1-1 --mode 1920x1080 --rate 144
sleep 1
# xrandr --output DP-0 --primary --mode 1920x1080 --rate 144 --left-of eDP-1-1
# xrandr --output DP-0 --primary --mode 1920x1080 --rate 144 --left-of eDP-1-1
# sleep 1
# xrandr --output HDMI-0 --mode 1920x1080 --rate 60 --same-as DP-0
# sleep 1
# feh --bg-scale /usr/share/backgrounds/i3_default_background.jpg
# xrandr --output DP-0 --mode 1920x1080 --rate 144 --primary --pos 0x420 --output HDMI-0 --mode 1920x1080 --rotate left --pos 1920x0 --output eDP-1-1 --mode 1920x1080 --same-as DP-0

# current
xrandr --output DP-0 --mode 1920x1080 --rate 144 --primary --pos 1080x420 --output HDMI-0 --mode 1920x1080 --rotate left --pos 0x0 --output eDP-1-1 --mode 1920x1080 --pos 3000x420

# xrandr --output DP-0 --mode 1920x1080 --rate 144 --primary --output HDMI-0 --mode 1920x1080 --right-of DP-0 --ouput eDP-1-1 --off

# Salto temp
# xrandr --output HDMI-0 --rate 74.97 --primary --mode 1920x1080 --output eDP-1-1 --mode 1920x1080 --rate 144 --left-of HDMI-0

sleep 1
feh --bg-scale /usr/share/backgrounds/i3_default_background.jpg
