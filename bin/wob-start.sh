#!/bin/bash

kill -9 $(pidof wob)

rm $SWAYSOCK.audio.wob
mkfifo $SWAYSOCK.audio.wob
tail -f $SWAYSOCK.audio.wob | wob $(~/.dotfiles/bin/wob-config.sh ~/.dotfiles/configs/wob/config) &

rm $SWAYSOCK.brightness.wob
mkfifo $SWAYSOCK.brightness.wob
tail -f $SWAYSOCK.brightness.wob | wob $(~/.dotfiles/bin/wob-config.sh ~/.dotfiles/configs/wob/config) --bar-color=#ff8800ff &

