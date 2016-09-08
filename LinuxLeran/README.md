## 如何实现 **host-a** ssh免密码登录 **host-b**

> 在**host-a**中生成公钥/私钥对
```
$ ssh-keygen -t rsa -P ''
$ cd .ssh/
$ ls -alh
```
> 将**host-a**中的```id_rsa.pub```上传到**host-b**中
```
$ scp .ssh/id_rsa.pub host-b@192.168.2.4:/home/test/id_rsa.pub
```
> 把**host-b**中的```id_rsa.pub```追加到```.ssh/authorized_keys```中,并且更改```.ssh/authorized_keys```的权限

```
$ ssh host-b@192.168.2.4
$ cat id_rsa.pub >> .ssh/authorized_keys
$ chmod 600 .ssh/authorized_keys
$ exit
```

## debian下的vpn设置

## 拷贝进度条

> **```cp```**拷贝没有进度条

> **```rsync```**本地拷贝有进度显示

```
rsync -vh --progress test.mp4 test/
#-v, --verbose 详细模式输出
#-h 人性化
#--progress 在传输时现实传输过程
```

## ```netstat``` 显示网络连接、路由表和网络接口信息

> ```netstat -ntlp``` 查看当前所有tcp端口

```
# netstat -ntlp
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp        0      0 127.0.0.1:25            0.0.0.0:*               LISTEN      1248/exim4      
tcp        0      0 127.0.0.1:3306          0.0.0.0:*               LISTEN      849/mysqld      
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      381/sshd        
tcp6       0      0 ::1:25                  :::*                    LISTEN      1248/exim4      
tcp6       0      0 127.0.0.1:8005          :::*                    LISTEN      447/java        
tcp6       0      0 :::8080                 :::*                    LISTEN      447/java        
tcp6       0      0 :::80                   :::*                    LISTEN      488/apache2     
tcp6       0      0 :::22                   :::*                    LISTEN      381/sshd

```

## ```du``` 查看文件和目录磁盘使用的空间

> -c 除了显示个别目录或文件的大小外,同时也显示所有目录或文件的总和

> -m 以 MB 为单位

> -k 以 KB 为单位

> -h 以 K,M,G 为单位,提高信息的可读性

> -s 仅显示总计,只列出最后加总的值

```
$ du test.log     #查看文件test.log的容量
$ du test/ #查看目录test/的容量
```

## ```bash color``` 彩色输出


[```bashcolor```](http://misc.flogisoft.com/bash/tip_colors_and_formatting)

[```bashcolor```](http://www.commandlinefu.com/commands/view/5879/show-numerical-values-for-each-of-the-256-colors-in-bash)

[```fish-shell```](https://github.com/fish-shell/fish-shell/)


## linux下下载github上的源码

例

下载 ```https://github.com/skylens/LinuxNote/blob/master/Shell/system_monitor.sh```

直接 ```wget https://github.com/skylens/LinuxNote/blob/master/Shell/system_monitor.sh``` 则会下载 github 上源码所在的网页

需要更改为 ```wget http://raw.githubusercontent.com/skylens/LinuxNote/master/Shell/system_monitor.sh```

即 ```https ==> http```  ```github.com ==> raw.githubusercontent.com``` 
