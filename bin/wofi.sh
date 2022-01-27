#!/bin/bash

#set -e

# Only allow once instance of wifi
pidof wofi
if [ $? == 0 ]; then
    exit 1
fi

WOFI_WIDTH=1100
WOFI_HEIGHT_FRAC=3
WOFI_HEIGHT_ERROR=220

SCREEN_WIDTH=$(swaymsg -r -t get_outputs | jq '.[] | select(.focused == true) | .rect.width')
SCREEN_HEIGHT=$(swaymsg -r -t get_outputs | jq '.[] | select(.focused == true) | .rect.height')
WOFI_HEIGHT=$(expr $SCREEN_HEIGHT / $WOFI_HEIGHT_FRAC)
WOFI_X=$(expr $(expr $SCREEN_WIDTH / 2) - $(expr $WOFI_WIDTH / 2))
WOFI_Y=$(expr $(expr $SCREEN_HEIGHT / 2) - $(expr $(expr $WOFI_HEIGHT + $WOFI_HEIGHT_ERROR) / 2))

echo "Screen: $SCREEN_WIDTH x $SCREEN_HEIGHT"
echo "Wofi: $WOFI_WIDTH x $WOFI_HEIGHT"
echo "Pos: $WOFI_X, $WOFI_Y"

wofi -x$WOFI_X -y$(expr $WOFI_Y) -H$WOFI_HEIGHT -W$WOFI_WIDTH --show drun

