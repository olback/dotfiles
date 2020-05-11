#!/bin/bash

ps aux | grep alacritty | grep -v grep

if [[ $? == 0 ]]; then

    tmux new-window -c $1
    xdotool search --class Alacritty windowactivate

else

    /usr/bin/alacritty --working-directory $1

fi
