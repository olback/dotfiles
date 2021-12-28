# Based on https://gist.github.com/dogrocker/1efb8fd9427779c827058f873b94df95

# Auto suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git $1/plugins/zsh-autosuggestions

# Syntax highlightning
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $1/plugins/zsh-syntax-highlighting

echo "Don't forget to append zsh-autosuggestions & zsh-syntax-highlighting to plugins() in $HOME/.zshrc like this:"
echo "plugins=(git zsh-autosuggestions zsh-syntax-highlighting)"
