#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h\W]\$ '

#PS1='\u@\h\$ '

#PS1='\e[92m\u\e[39m@\e[33m\h\e[0m\e[39m:\W\$ '

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

git_branch() {
  if [ "$(parse_git_branch)" != "" ]; then
    if [ "$(parse_git_branch)" == "(master)" ]; then
      echo -e " \e[1;38;5;196m$(parse_git_branch)"
    else
      echo -e " \e[1;33m$(parse_git_branch)"
    fi
  fi
}

PS1='\e[1;92m\u\e[39m@\e[33m\h\e[0m\e[39m:\W$(git_branch)\e[0m\e[39m\$ '

if [ "$USER" == "root" ]
then
  PS1='\e[1;31m\u\e[0m\e[1;39m@\e[33m\h\e[0m\e[39m:\W\$ '
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
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'
alias pubip='curl https://whois.olback.net/raw.php?myip; echo'
alias LS='sl'
alias gitgnome='~/.gitgnome/gitgnome $(realpath .)'
