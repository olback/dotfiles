#!/bin/bash

set -e

FILES=$(ls $HOME/.ssh | grep '\.pub$')

for f in $FILES; do
    echo -n "/home/$USER/.ssh/$(basename $f .pub) "
done

