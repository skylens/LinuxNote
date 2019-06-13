# yum - CentOS 的软件包管理工具

### 常用命令

### 搭建本地 yum 软件仓库

**以 CentOS 7 为列**

1. 下载官方完整 iso 镜像（注意：是带 Everything 的），并挂载镜像

[CentOS 7 完整版](https://mirrors.aliyun.com/centos/7.5.1804/isos/x86_64/CentOS-7-x86_64-Everything-1804.iso)

+ 通过 CD-ROM 挂载

```sh
mkdir /mnt/cdrom
mount -t iso9660 -o ro /dev/cdrom /mnt/cdrom
```

+ 以文件方式挂载

```sh
mkdir /mnt/cdrom
mount -o loop /tmp/CentOS-7-x86_64-Everything-1804.iso /mnt/cdrom
```

2. 修改 yum 仓库配置文件

```sh
mkdir /etc/yum.repo.d/bak
cp /etc/yum.repo.d/*.repo /etc/yum.repo.d/bak/
vi /etc/yum.repo.d/local.repo

[localrepo]
name=localrepo
baseurl=file:///mnt/cdrom
enable=1
gpgcheck=0
```

3. 生成软件包信息缓存

```sh
yum makecache all
```

4. 完成

### 搭建基于 http 服务的 yum 软件仓库

#### 使用 iso 镜像作为 yum 软件源

1. 下载 iso 镜像，并挂载 （步骤和本地软件仓库的第一步没有区别）

2. 安装 http 服务，并启动 http 服务 （当然也可以使用 ftp 来代替 http）

以 httpd 和 nginx 为例

+ httpd

```sh
yum install httpd -y
```

+ nginx

```sh
yum install epel-release -y
yum makecache all
yum install nginx
```

3. 开启 index 功能

+ httpd

启动 httpd 服务

```sh
systemctl start httpd
systemctl enable httpd
```

默认已经开启，使用符号连接，映射 CentOS 镜像文件的目录

```sh
ln -s /mnt/cdrom /var/www/html/centos7
```

+ nginx

添加配置文件启用 autoindex 功能

```sh
vi /etc/nginx/conf.d/autoindex.conf

server {
	listen 80;
	location / {
		autoindex on;
	}
}
```

启动 nginx 服务

```sh
systemctl start nginx
systemctl enable nginx
```

默认已经开启，使用符号连接，映射 CentOS 镜像文件的目录

```sh
ln -s /mnt/cdrom /var/www/html/centos7
```

4. 在要使用该仓库的 CentOS 7 机器上做如下 yum 配置

(172.16.80.106 是 yum 仓库的 ip)

```sh
vi /etc/yum.repo.d/selfyumrepo.repo

[allserver]
name=localrepo
baseurl=http://172.16.80.106/centos7/
enable=1
gpgcheck=0
```

### 从官方仓库同步

```sh
/usr/bin/rsync -av rsync://mirrors.ustc.edu.cn/centos/7/os/x86_64/ /data/yumrepo/centos/7/os/x86_64/
/usr/bin/rsync -av rsync://mirrors.ustc.edu.cn/centos/7/extras/x86_64/ /data/yumrepo/centos/7/extras/x86_64/
/usr/bin/rsync -av rsync://mirrors.ustc.edu.cn/centos/7/updates/x86_64/ /data/yumrepo/centos/7/updates/x86_64/
# epel源
/usr/bin/rsync -av --exclude=debug rsync://mirrors.ustc.edu.cn/epel/7/x86_64/ /data/yumrepo/epel/7/x86_64/
```

### 下载 rpm 包及依赖

```sh
yum install yum-utils
yumdownloader samba httpd --destdir ./ --resolve
yumdownloader "@Development Tools" --destdir ./ --resolve
```
