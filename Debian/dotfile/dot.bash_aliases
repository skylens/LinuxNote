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
#录屏（分辨率为800x600，名称为screen.mp4 的视频）
alias screencapture='ffmpeg -video_size 800x600 -framerate 25 -f x11grab -i :0.0+0,0 screen.mp4'
#查找命令
alias grep='grep --color=auto'
#显示日期时间
alias Date='date +%Y-%m-%d-%H-%M'
