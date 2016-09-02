# Debian Install for Loaptop

__**# 表示以```root```身份登录系统进行操作**__

__**$ 表示以普通用户身份登录系统进行操作**__

1. **网络配置、源配置、安装ssh**

```$ su -```

```# ifconfig -a```

```# dhclient eth0```

```# ping -c 3 www.163.com```

设置开机自动获取IP，打开```/etc/network/interfaces```

```# nano /etc/network/interfaces```

向```/etc/network/interfaces```添加

```
auto eth0
iface eth0 inet dhcp
```

```# nano /etc/apt/sources.list```
> debian 8.5 软件源

```
deb http://mirrors.163.com/debian/ jessie main non-free contrib  
deb-src http://mirrors.163.com/debian/ jessie main non-free contrib

deb http://mirrors.163.com/debian/ jessie-updates main non-free contrib
deb http://mirrors.163.com/debian/ jessie-backports main non-free contrib
deb-src http://mirrors.163.com/debian/ jessie-updates main non-free contrib
deb-src http://mirrors.163.com/debian/ jessie-backports main non-free contrib
deb http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib
deb-src http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib

deb http://mirrors.ustc.edu.cn/debian/ jessie main contrib non-free
deb-src http://mirrors.ustc.edu.cn/debian/ jessie main contrib non-free
deb http://mirrors.ustc.edu.cn/debian/ jessie-updates main contrib non-free
deb-src http://mirrors.ustc.edu.cn/debian/ jessie-updates main contrib non-free
deb http://mirrors.ustc.edu.cn/debian/ jessie-backports main contrib non-free
deb-src http://mirrors.ustc.edu.cn/debian/ jessie-backports main contrib non-free
deb http://mirrors.ustc.edu.cn/debian-security/ jessie/updates main contrib non-free
deb-src http://mirrors.ustc.edu.cn/debian-security/ jessie/updates main contrib non-free
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

2. **安装软件**

* 安装常用软件(当然也可以只安装基本的软件,以后用到什么软件再装什么软件)

```
# apt-get install aptitude
# wget http://cs3.swfu.edu.cn/~20141156018/apt-mark-showmanual.wx672laptop
# aptitude -R install `cat apt-mark-showmanual.wx672laptop`
```

* 基本软件

```
# apt-get install modemmanager acpi acpi-support acpid acpitool alsa-utils anacron apt apt-file bash bash-completion build-essential curl dash dkms fcitx fcitx-module-cloudpinyin fcitx-googlepinyin flip fonts-arphic-ukai fonts-arphic-uming fonts-wqy-microhei fonts-wqy-zenhei gdebi git git-core grun i3 ifupdown ifupdown-extra imagemagick info iw  less libnss3-tools localepurge lsof nmap ntfs-3g ntpdate pulseaudio pavucontrol pv qiv sawfish ssh sudo systemd tcpdump time tmux ttyrec unbound usbutils wpasupplicant x11-apps xfonts-terminus xfonts-wqy xinit xterm xorg tar zip unzip vim emacs-goodies-el emacs24 esound tpp
```
* 还是用```root```登陆(```tux```就是普通用户的用户名)

```
# nano /etc/sudoers.d/tux
```
* 添加下面两行
```
User_Alias      NORMAL = tux
NORMAL  ALL = NOPASSWD: ALL
```
* 更改文件的权限
```
# chmod 0440 /etc/sudoers.d/tux
```

* 切换回普通用户,以普通用户身份完成以下操作


```
$ cd
$ for f in dotfile/dot.*; do ln -sf $f; done
$ ln -sf dotfile/help/dot.* .
$ rm -f .bash*
$ rename 's/dot//' dot.*
$ wget -O .keys.png http://cs2.swfu.edu.cn/~wx672/tex-fun/keys/keys.png
```
```
$ sudo cp ~/dotfile/etc/systemd/system/autologin@.service /etc/systemd/system/
$ sudo ln -s /etc/systemd/system/autologin@.service /etc/systemd/system/getty.target.wants/getty@tty8.service
$ sudo nano /etc/systemd/system/getty.target.wants/getty@tty8.service
```
* 找到这行```ExecStart=-/sbin/agetty -a wx672 --noclear %I $TERM```,把wx672改为tux(也就是你的普通用户名)

```$ sudo nano /etc/systemd/logind.conf```
* 把```#NAutoVTs=6```改为```NAutoVTs=8```

```$ sudo dpkg-reconfigure locales```
  +   en_US.UTF-8 UTF-8
  +   zh_CN.GB18030 GB18030
  +   zh_CN.UTF-8 UTF-8
  +  默认语言环境选 None
```
$ sudo cp ~/dotfile/etc/default/locale /etc/default
$ sudo cp ~/dotfile/etc/default/keyboard /etc/default
```
* 字体
```
$ sudo cp dotfile/fonts/* /usr/share/fonts/truetype/
```

```sudo reboot```


## 声音设置

```
$ alsactl init
$ alsamixer
```
## 时间设置

```
$sudo tzselect //更改时区

```

linux 单系统跳过这步
对于双系统```Windows+linux```时间标准由操作系统设定,Windows 默认使用 ```LOCAL```,linux 默认使用 ```UTC```,linux也支持```LOCAL```,在linux 下```sudo cat /etc/adjtime```查看时间标准设定,把linux的时间设定改为```LOCAL```,这样Windows的时间就没有问题了

```
root@debian:~# cat /etc/adjtime
0.000000 1472436284 0.000000
1472436284
UTC
```

```$ sudo hwclock -w --localtime```

```
root@debian:~# cat /etc/adjtime
0.000000 1472793798 0.000000
1472793798
LOCAL
````

用 ntp 同步时间

```
$sudo apt-get install ntpdate
$sudo ntpdate 202.108.6.95
```

# Debian Install for server

1. **网络配置、源配置、安装ssh**

配置和laptop没太大区别
1. 网络地址设置为静态地址

打开```/etc/network/interfaces```

```# nano /etc/network/interfaces```

向```/etc/network/interfaces```添加

```
auto eth0
iface eth0 inet static
address 192.168.2.5
netmask 255.255.255.0
gateway 192.168.2.2
```
2. 源用稳定源

2. **安装软件**

```apt-get install vim nano sudo tmux ntpdate ```

3. **设置[ntp](http://www.ntp.org.cn/)时间同步**

```ntpdate 202.108.6.95```

** 4. 其他 **

bash vim tmux Xorg emacs...
