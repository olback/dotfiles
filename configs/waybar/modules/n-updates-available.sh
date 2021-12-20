#!/bin/sh

N_UPDATES=$(pacman -Qu | wc -l)

#echo -n "$N_UPDATES\nPacman: $N_UPDATES available\n"
echo -n '{"alt": "'$N_UPDATES'", "tooltip": "Pacman: '$N_UPDATES' updates available"}'

