#!/bin/bash

# TODO: Implement menu somewhere
# Either a wofi menu or in a sway mode.
# echo -n "Selection\nActive Window\nAll monitors" | wofi --dmenu -p "Screenshot mode" -w 1 -L 3 

#set -e

FILENAME="$(date +"%Y%m%d_%H%M%S").png"
FILEPATH="$HOME/Pictures/Screenshots/$FILENAME"
#AREA=$(slurp)

#if [[ $? != 0 ]]; then
#    notify-send -i error "Invalid selection"
#    exit 1
#fi

#echo $FILENAME
#echo $FILEPATH
#echo $AREA

#GRIM_MSG=$(grim -t png -g "$AREA" "$FILEPATH")

gnome-screenshot -f $FILEPATH -p -a

if [[ -f $FILEPATH ]]; then

    if [[ $1 == "tempfiles.ninja" ]]; then
        RESPONSE=$(curl \
            -X POST \
            --data-binary @$FILEPATH \
            -H "Content-Type: image/png" \
            https://tempfiles.ninja/api/upload\?filename\=$FILENAME)
        if [[ $? == 0 ]]; then
            # echo $RESPONSE
            if [[ $(echo $RESPONSE | jq -r '.status') == 201 ]]; then
                echo $RESPONSE | jq -r '.download_url' | ~/.local/bin/wl-copy
                notify-send -i $FILEPATH "Screenshot uploaded" "$FILENAME"
            else
                notify-send -i error "Upload failed" "$(echo $RESPONSE | jq -r '.message')"
            fi
        else
            notify-send -i error "Upload failed" "Failed with status $?"
        fi
    else
        notify-send -i $FILEPATH "Screenshot saved" "$FILENAME"
    fi

else

    notify-send -i error "Screenshot failed" "$GRIM_MSG"

fi

