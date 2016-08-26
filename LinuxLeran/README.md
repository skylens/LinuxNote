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
