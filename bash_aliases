# ToDo:
# Add command for downloading the newest version from github.

# github.com/olback

eval $(thefuck --alias fuck) # Comment out if you don't have thefuck installed.

alias update='apt update && apt upgrade -y && apt autoremove -y'
alias c='clear'
alias pag='ps aux | grep'
alias agi='apt update && apt-get install-y'
alias s='sudo -i'
alias www='cd /var/www && ll'
alias www-data='chown www-data:www-data /var/www/ -R'
alias local_ip='ifconfig | grep "inet addr:"'
alias public_ip='printf "Your public ip: ";curl https://whois.olback.net/raw.php?myip;printf "\n"'
alias py3='python3'
alias vi='nano'
alias vim='nano'
