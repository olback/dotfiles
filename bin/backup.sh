#!/bin/bash

set -e

cd $HOME

DEST="/run/media/$USER/T7 Touch/$HOSTNAME"
echo "Destination: $DEST"

rsync -v -a --exclude ".local" --exclude ".android" --exclude "Android" --exclude ".arduino15" --exclude ".cargo-target" --exclude ".cargo" --exclude ".cache" --exclude ".matlab" --exclude "Arduino" --exclude ".npm-global" $HOME "$DEST"

