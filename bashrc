#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h\W]\$ '

#PS1='\u@\h\$ '

PS1='\e[92m\u\e[39m@\e[33m\h\e[0m\e[39m:\W\$ '

if [ "$USER" == "root" ]
then
  PS1='\e[1m\e[31m\u\e[0m\e[39m@\e[33m\h\e[0m\e[39m:\W\$ '
fi

# >>> BEGIN ADDED BY CNCHI INSTALLER
BROWSER=/usr/bin/chromium
EDITOR=/usr/bin/nano
# <<< END ADDED BY CNCHI INSTALLER
eval $(thefuck --alias)

alias pag='ps aux | grep'
alias c='clear'
alias s='sudo -i'
alias service='systemctl'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias pubip='curl https://whois.olback.net/raw.php?myip; echo'
alias LS='sl'
alias gitgnome='~/.gitgnome/gitgnome $(realpath .)'
