###################
# github.com/olback
###################

# github.com/nvbn/thefuck 
eval $(thefuck --alias fuck) # Comment out if you don't have thefuck installed.

# Web
alias www='cd /var/www && ll'
alias www-data='chown www-data:www-data /var/www/ -R'

# Some random aliases...
alias py3='python3'
alias s='sudo -i'
alias c='clear'
alias pag='ps aux | grep'
alias update='apt update && apt upgrade -y && apt autoremove -y'

# Networking
alias local_ip='ifconfig | grep "inet addr:"'
alias public_ip='printf "Your public ip: ";curl https://whois.olback.net/raw.php?myip;printf "\n"'

# Nano > VIM
alias vi='nano'
alias vim='nano'

# Update ~/.bash_aliases to the newest version.
alias uba='wget https://raw.githubusercontent.com/olback/bash_aliases/master/install && bash install && rm install'
