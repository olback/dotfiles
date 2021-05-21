#!/bin/bash

set -e

FILES=$(ls ~/.ssh | grep '\.pub$')

for f in $FILES; do
    echo -n "/home/$USER/.ssh/$(basename $f .pub) "
done

