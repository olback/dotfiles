#!/bin/bash

WALLPAPER_TYPE="fill"
WALLPAPER_IGNORE="\.disabled$"
WALLPAPERS_PATH=~/.dotfiles/wallpapers

WALLPAPER_NAME=$(ls $WALLPAPERS_PATH | grep -v $WALLPAPER_IGNORE | sort -R | head -1)
WALLPAPER_PATH="$WALLPAPERS_PATH/$WALLPAPER_NAME"

echo "Setting wallpaper to $WALLPAPER_PATH"

swaymsg 'output "*" background "'$WALLPAPER_PATH'" '$WALLPAPER_TYPE''

