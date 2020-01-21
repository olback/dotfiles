FILES=$(ls ~/.dotfiles/shell)

rm -f ~/.dotfiles/dotfiles

for f in $FILES; do
    echo "source /home/$USER/.dotfiles/shell/$f" >> ~/.dotfiles/dotfiles
done

echo "Add 'source /home/$USER/.dotfiles/dotfiles' to .zshrc or .bashrc"
