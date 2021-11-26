#!/bin/bash

AVAILABLE_TMUX_SESSION=$(tmux list-sessions | grep -v attached | cut -c -1 | head -1)

#echo "Old session: $AVAILABLE_TMUX_SESSION"

if [[ $AVAILABLE_TMUX_SESSION == "" ]]; then
    tmux
else
    tmux attach -t $AVAILABLE_TMUX_SESSION
fi

