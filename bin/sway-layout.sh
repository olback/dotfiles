#!/bin/sh

HOSTNAME=$(cat /etc/hostname)

if [ $HOSTNAME = "EDWINS-PC" ]; then
    swaymsg 'output HDMI-A-5 pos 0 200' && swaymsg 'output DP-3 pos 1680 0'
    #swaymsg 'output HDMI-A-5 pos 0 0' && swaymsg 'output DP-3 pos 1680 0'
elif [ $HOSTNAME = "T14G2" ]; then
    # TODO
    echo 'todo'
fi


