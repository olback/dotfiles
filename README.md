# dotfiles

### Install oh-my-zsh:
```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Install powerlevel10k:
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
Set `ZSH_THEME` to `"powerlevel10k/powerlevel10k"`

### Install dotfiles:
```bash
git clone git@github.com/olback/dotfiles $HOME/.dotfiles
.dotfiles/install.sh
```

### Install ZSH plugins:
```bash
.dotfiles/install_zsh_plugins.sh $ZSH_CUSTOM
```


### TODO

* [x] install oh-my-zsh
* [x] install powerlevel10k
* [x] link configs
* [ ] link etc
* [x] link local
* [ ] link udev
* [x] gitconfig
* [ ] Install script should automatically configure oh-my-zsh and p10k
