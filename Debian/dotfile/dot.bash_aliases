# list directory
alias l='ls -a'
alias ll='ls -alFh'
alias ls='/bin/ls --color=auto -F'
# delete
alias rm='/bin/rm -i'
# copy
alias cp='/bin/cp -i'
# move
alias mv='/bin/mv -i'
# download
alias wget='wget -c --no-check-certificate'
# record screen (800x600 , screen.mp4)
alias screencapture='ffmpeg -video_size 800x600 -framerate 25 -f x11grab -i :0.0+0,0 screen.mp4'
# search data line-by-line
alias grep='grep --color=auto'
# show date
alias Date='date +%Y-%m-%d-%H-%M'
