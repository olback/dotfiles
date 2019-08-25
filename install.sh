FILES=$(ls ~/.dotfiles | grep -v install.sh | grep -v dotfiles | grep -v LICENSE | grep -v README.md)

rm -f ~/.dotfiles/dotfiles

for f in $FILES; do
    echo "source /home/$USER/.dotfiles/$f" >> ~/.dotfiles/dotfiles
done

echo "Add 'source /home/$USER/.dotfiles/dotfiles' to .zshrc or .bashrc"
