# ~/.bash_profile: executed by bash(1) for login shells.
# see /usr/share/doc/bash/examples/startup-files for examples

umask 022

[ -f ~/.bashrc ] && source ~/.bashrc

[ -d ~/bin ] && PATH="~/bin:${PATH}"

export PATH="${PATH}:/usr/local/sbin:/usr/sbin:/sbin"

[[ -z $DISPLAY && $XDG_VTNR -eq 8 ]] && exec startx -- vt8
# [[ $(fgconsole 2>/dev/null) == 8 ]] && exec startx -- vt8

if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi
