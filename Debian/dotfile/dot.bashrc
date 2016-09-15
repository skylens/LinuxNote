# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files for examples

[ -f /etc/bash.bashrc ] && source /etc/bash.bashrc
[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/bin/bashmarks.sh ] && . ~/bin/bashmarks.sh
[ -f ~/bin/bash_completion_tmux.sh ] && . ~/bin/bash_completion_tmux.sh


if [ "$PS1" ]; then
    #彩色的命令提示符
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
  else
    #默认的命令提示符
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
export PS1

eval "$(lesspipe)"

if [ -f ~/.lscolors ]; then
	eval "$(dircolors ~/.lscolors)"
else
	eval "$(dircolors)"
fi

export HISTIGNORE="&:[ ]*:exit"
export HISTFILESIZE=2000
export HISTSIZE=2000
export BROWSER='google-chrome'
export EDITOR='vim'
export ALTERNATE_EDITOR=""
export LESSCHARSET=utf-8
#export IGNOREEOF=2
tabs -4 &>/dev/null

# Use colors for less, man, etc.
[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP
