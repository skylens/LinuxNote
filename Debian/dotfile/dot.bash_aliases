#查看目录
alias l='ls -a'
alias ll='ls -alFh'
alias ls='/bin/ls --color=auto -F'
#删除文件和目录
alias rm='/bin/rm -i'
#复制文件和目录
alias cp='/bin/cp -i'
#移动文件和目录
alias mv='/bin/mv -i'
#下载命令
alias wget='wget -c --no-check-certificate'
#录屏（分辨率为800x600）
alias screencapture='ffmpeg -video_size 800x600 -framerate 25 -f x11grab -i :0.0+0,0 screen.mp4'
