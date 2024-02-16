#!/usr/bin/env bash

DISPLAY=":0"
HOME=/home/berin
XAUTHORITY=$HOME/.Xauthority

export DISPLAY XAUTHORITY HOME
xset r rate 220 30
setxkbmap -option 'caps:ctrl_modifier'
# notify-send "This notification is being shown!"
