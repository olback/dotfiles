#!/bin/bash

if [[ $1 == "up" ]]; then
    brightnessctl set +5%
elif [[ $1 == "down" ]]; then
    brightnessctl set 5%-
fi

brightnessctl -m | cut -d ',' -f4 - | cut -d '%' -f1 - > $SWAYSOCK.brightness.wob

