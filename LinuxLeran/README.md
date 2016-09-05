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
