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

## ```last``` 查看所有的系统登录记录

```
$ last

tux      pts/0        192.168.2.1      Tue Sep 13 22:28   still logged in   
reboot   system boot  3.10.0-327.28.3. Tue Sep 13 22:28 - 22:57  (00:29)    
tux      pts/0        192.168.2.1      Fri Sep  9 04:42 - 05:20  (00:37)    
tux      pts/0        192.168.2.1      Fri Sep  9 04:33 - 04:39  (00:05)    
root     tty1                          Fri Sep  9 04:33 - 05:20  (00:47)    
reboot   system boot  3.10.0-327.28.3. Fri Sep  9 04:33 - 05:20  (00:47)    
root     pts/0        192.168.2.1      Mon Aug 29 23:59 - crash (10+04:33)  
reboot   system boot  3.10.0-327.28.3. Mon Aug 29 23:57 - 05:20 (10+05:23)  
root     tty1                          Mon Aug 29 16:04 - 16:04  (00:00)    
root     pts/0        192.168.2.1      Mon Aug 29 23:16 - 16:03  (-7:-12)   
root     pts/0        192.168.2.1      Mon Aug 29 22:57 - 23:16  (00:19)    
reboot   system boot  3.10.0-327.el7.x Mon Aug 29 22:56 - 16:04  (-6:-52)   
root     tty1                          Mon Aug 29 20:59 - 20:59  (00:00)    
root     pts/0        192.168.2.1      Mon Aug 29 20:01 - 20:11  (00:09)    
reboot   system boot  3.10.0-327.el7.x Mon Aug 29 20:00 - 16:04  (-3:-56)   
root     pts/0        192.168.2.1      Mon Aug 29 19:53 - crash  (00:07)    
reboot   system boot  3.10.0-327.el7.x Mon Aug 29 19:53 - 16:04  (-3:-49)   
root     pts/0        192.168.2.1      Mon Aug 29 19:33 - down   (00:19)    
root     tty1                          Mon Aug 29 19:31 - 19:53  (00:21)    
reboot   system boot  3.10.0-327.el7.x Mon Aug 29 19:31 - 19:53  (00:21)    

wtmp begins Mon Aug 29 19:31:12 2016
```


## 查看纯文本的命令

``` cat 、 more 、 less 、 head 、 tail ```

```
$ cat -n file.txt #适用于短文本
$ more file.txt #适用于长文本
$ less file.txt #适用于长文本 ，less 比 more 更好用
$ head -n 10 file.txt #查看前 10 行文本
$ tail -n 10 file.txt #查看后 10 行文本
```

## wc 统计文本的行数 、字数 、 字节数

```
$ wc -l file.txt #显示行数
$ wc -W file.txt #显示单词数/字数
$ wc -c #显示字节数
```

运用：查看用户数

```
$ wc -l /etc/passwd
```

## 通过命令查找对应属于的软件包

```
$ dpkg -S `which ifconfig`
net-tools: /sbin/ifconfig
```

## Tab 自动补全

```
$ sudo apt-get install bash
$ vim .bashrc  //追加

if [ "$PS1" ]; then
  if [ -r /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

```
