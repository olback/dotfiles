#!/bin/bash

sleep 2

kill -9 $(pidof wob)

rm $SWAYSOCK.audio.wob
mkfifo $SWAYSOCK.audio.wob
tail -f $SWAYSOCK.audio.wob | wob $($HOME/.dotfiles/bin/wob-config.sh $HOME/.config/wob/config) &

rm $SWAYSOCK.brightness.wob
mkfifo $SWAYSOCK.brightness.wob
tail -f $SWAYSOCK.brightness.wob | wob $($HOME/.dotfiles/bin/wob-config.sh $HOME/.config/wob/config) --bar-color=#ff8800ff &

