# It's i3WM

怎样在 Debian 下安装 i3WM 桌面

### 下载安装镜像

选择`netinst`版，这个版本比较小，只有基本系统，可自由定制

### 制作U盘启动盘

如果你是windows系统可以选择软碟通这款软件，当然你要可以选择开源的Rufus，
它也是一款U盘启动软件，它们具体的用法可以通过搜索引擎来搜索。

### 安装 Debian 

记住提前断开网络，联网安装的坏处是安装速度非常慢，同时也有可能网络出错导致安装失败;
安装时语言环境选择英语(但你想使用中文，你可以在后面的设置中选择添加中文支持，这样你
的系统就能显示中文了)，分区时，新建一个boot分区，一个swap分区，其余分区分给/，当然
你也可以把剩余的分区分一部分给/home，总之你可以怎么喜欢怎么来，只要保证有boot、
swap、/就行了

### 配置篇

安装完系统之后，第一件就是插上网线，使用root用户登录，启动网络连接

```bash
# dhclicent eth0
# ping 114.114.114.114
```

修改源(为了速度选择国内的源)，删除`/etc/apt/sources.list`中的所有内容，添加新内容

```bash
# nano /etc/apt/sources.list
deb http://mirrors.ustc.edu.cn/debian sid main contrib non-free
deb http://mirrors.163.com/debian/ sid main contrib non-free
# apt-get update && apt-get upgrade
```

安装软件

```bash
# apt-get install xserver-xorg xinit xterm 	
```
