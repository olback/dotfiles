#!/bin/sh

HOSTNAME=$(cat /etc/hostname)

if [ $HOSTNAME = "EDWINS-PC" ]; then
    swaymsg 'output HDMI-A-5 pos 0 200'
    swaymsg 'output DP-3 pos 1680 0'
    swaymsg 'output DP-3 mode 2560x1440@119.998Hz'
    #swaymsg 'output HDMI-A-5 pos 0 0' && swaymsg 'output DP-3 pos 1680 0'
elif [ $HOSTNAME = "T14G2" ]; then
    swaymsg 'output DP-5 pos 0 130'
    # swaymsg 'output DP-7 pos 1920 0 res 2560x1440@165.080Hz'
    swaymsg 'output DP-7 pos 1920 0 res 2560x1440@119.998Hz'
    swaymsg 'output eDP-1 pos 4480 180'
fi

