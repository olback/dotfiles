#!/bin/bash

if [[ $1 == "up" ]]; then
    pamixer -ui 2
    pamixer --get-volume 2>&1 > $SWAYSOCK.audio.wob
elif [[ $1 == "down" ]]; then
    pamixer -ud 2
    pamixer --get-volume 2>&1 > $SWAYSOCK.audio.wob
elif [[ $1 == "toggle-mute" ]]; then
    pamixer --toggle-mute
    if [[ $(pamixer --get-mute) == false ]]; then
        pamixer --get-volume 2>&1 > $SWAYSOCK.audio.wob
        notify-send "Sound unmuted" -u low -i audio-volume-high-symbolic
    else
        echo 0 > $SWAYSOCK.audio.wob
        notify-send "Sound muted" -u low -i audio-volume-muted-symbolic
    fi
elif [[ $1 == "toggle-mute-source" ]]; then
    pactl set-source-mute @DEFAULT_SOURCE@ toggle
    CURRENT_SOURCE=$(pactl info | grep "Default Source" | cut -f3 -d " ")
    MUTED=$(pactl list sources | grep -A 10 $CURRENT_SOURCE | grep -i "mute" | awk '{print $2}')
    if [[ $MUTED == "yes" ]]; then
        notify-send "Microphone muted" -u low -i microphone-sensitivity-muted-symbolic
    else
        notify-send "Microphone unmuted" -u low -i microphone-sensitivity-high-symbolic
    fi
fi

