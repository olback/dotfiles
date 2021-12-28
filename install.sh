#!/bin/bash

set -e

if [ "$HOME/.dotfiles" != $PWD ]; then
    echo "Error: Must be in $HOME/.dotfiles"
    exit 1
fi

#
# Config links
#
for f in $(ls $HOME/.dotfiles/configs/config | grep -v "\.old$"); do
    P="$HOME/.config/$f"
    C="$HOME/.dotfiles/configs/config/$f"
    if [[ -e "$P" || -h "$P" ]]; then
        echo "Removing $P"
        rm -rf $P
    fi
    ln -s "$C" "$P"
    echo "Linking $P -> $C"
done

# Some apps don't like putting their configs in the right place, so we have to map the paths ourselfs... :(
# "dest source"
declare -a annoying_configs=(
    "$HOME/.tmux.conf $HOME/.dotfiles/configs/tmux.conf"
    "$HOME/.gtkrc-2.0 $HOME/.dotfiles/configs/gtkrc-2.0"
    "$HOME/.gitconfig $HOME/.dotfiles/configs/gitconfig"
)

for elem in "${annoying_configs[@]}"; do
    read -a strarr <<< "$elem"  # uses default whitespace IFS
    if [[ -e "${strarr[0]}" || -h "${strarr[0]}" ]]; then
        echo "Removing ${strarr[0]}"
        rm -rf "${strarr[0]}"
    fi
    ln -s "${strarr[1]}" "${strarr[0]}"
    echo "Linking ${strarr[0]} -> ${strarr[1]}"
done

#
# Local
#
for f in $(find local -type f); do
    P="$HOME/.$f"
    mkdir -p $(dirname "$P")
    if [[ -e "$P" || -h "$P" ]]; then
        echo "Removing $P"
        rm -rf "$P"
    fi
    echo "Linking $P -> $HOME/.dotfiles/$f"
    ln -s $HOME/.dotfiles/$f $P
done

#
# Shell
#
rm -f $HOME/.dotfiles/dotfiles

for f in $(ls shell); do
    echo "source $HOME/.dotfiles/shell/$f" >> $HOME/.dotfiles/dotfiles
done

echo "Add 'source $HOME/.dotfiles/dotfiles' to .zshrc or .bashrc"
echo "Done!"
