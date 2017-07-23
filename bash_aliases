# Created by github.com/olback


# github.com/nvbn/thefuck 
eval $(thefuck --alias fuck) # Comment out if you don't have thefuck installed. You really shoud have 'thefuck' installed.

# Web
alias www='cd /var/www && ll'
alias www-data='chown www-data:www-data /var/www/ -R'
alias makeweb='curl -sSL https://raw.githubusercontent.com/olback/bash_aliases/master/makeweb.sh | sh'

# Some random aliases...
alias py3='python3'
alias s='sudo -i'
alias c='clear'
alias pag='ps aux | grep'
alias update='apt update && apt upgrade -y && apt autoremove -y'
alias ins='sudo apt install -y'
alias llg='ll | grep'
alias kys='kill -9'
alias phps='php -S localhost:5000'

# Networking
alias local_ip='ifconfig | grep inet | head -1'
alias public_ip='printf "Your public ip: ";curl https://whois.olback.net/raw.php?myip;printf "\n"'

# Nano > VIM
alias vi='nano'
alias vim='nano'

# Update ~/.bash_aliases to the newest version.
alias uba='curl -sSL https://raw.githubusercontent.com/olback/bash_aliases/master/install | sh'
