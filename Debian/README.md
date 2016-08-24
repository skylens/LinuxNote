# Debian Install

```$ su -```

```# ifconfig -a```

```# dhclient eth0```

```# ping -c 3 www.163.com```

```# nano /etc/apt/sources.list```
> debian 8.5 软件源

```
deb http://mirrors.163.com/debian/ jessie main non-free contrib  
deb-src http://mirrors.163.com/debian/ jessie main non-free contrib
```
```
# apt-get update
# apt-get install openssh-server
```
**用另外一台电脑```ssh```连笔记本(因为这样配置起来更方便,可以直接复制粘贴配置命令,以免出错)**

> debian 8.5 testing 源

```
deb http://mirrors.163.com/debian/ testing main contrib non-free  
deb-src http://mirrors.163.com/debian/ testing main contrib non-free
deb http://mirrors.163.com/debian/ testing-updates main contrib non-free  
deb-src http://mirrors.163.com/debian/ testing-updates main contrib non-free
deb http://mirrors.ustc.edu.cn/debian/ stretch main contrib non-free
deb-src http://mirrors.ustc.edu.cn/debian/ stretch main contrib non-free
deb http://mirrors.ustc.edu.cn/debian/ stretch-updates main contrib non-free
deb-src http://mirrors.ustc.edu.cn/debian/ stretch-updates main contrib non-free
deb http://mirrors.ustc.edu.cn/debian-security/ stretch/updates main contrib non-free
deb-src http://mirrors.ustc.edu.cn/debian-security/ stretch/updates main contrib non-free
```

```
# apt-get update
# apt-get install openssh-server
```

**开始安装软件**

* 安装常用软件(当然也可以只安装基本的软件,以后用到什么软件再装什么软件)

```
# apt-get install aptitude
# wget http://cs3.swfu.edu.cn/~20141156018/apt-mark-showmanual.wx672laptop
# aptitude -R install `cat apt-mark-showmanual.wx672laptop`
```

* 基本软件

```
# apt-get install modemmanager acpi acpi-support acpid acpitool alsa-utils anacron apt apt-file bash bash-completion build-essential curl dash dkms fcitx fcitx-module-cloudpinyin fcitx-googlepinyin flip fonts-arphic-ukai fonts-arphic-uming fonts-wqy-microhei fonts-wqy-zenhei gdebi git git-core grun i3 ifupdown ifupdown-extra imagemagick info iw  less libnss3-tools localepurge lsof nmap ntfs-3g ntpdate pulseaudio pavucontrol pv qiv sawfish ssh sudo systemd tcpdump time tmux ttyrec unbound usbutils wpasupplicant x11-apps xfonts-terminus xfonts-wqy xinit xterm xorg
```


bash vim tmux Xorg emacs...
