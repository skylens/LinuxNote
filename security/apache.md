# CentOS 7 下源码安装升级 `apache 2`

## 安装

### 备份！！！备份！！！备份！！！

### 下载源码包

[httpd](https://mirrors.tuna.tsinghua.edu.cn/apache/httpd/)

[apr](https://mirrors.tuna.tsinghua.edu.cn/apache/apr/)

[apr-util](https://mirrors.tuna.tsinghua.edu.cn/apache/apr/)

```bash
# curl -O -L https://github.com/apache/httpd/archive/2.4.34.tar.gz
# curl -O -L https://github.com/apache/apr/archive/1.6.4.tar.gz
# curl -O -L https://github.com/apache/apr-util/archive/1.6.1.tar.gz
# tar -xvf 2.4.34.tar.gz
# tar -xvf 1.6.4.tar.gz
# tar -xvf 1.6.1.tar.gz
```

### 添加 apr 依赖

```bash
# cp -r apr-1.6.4/ httpd-2.4.34/srclib/apr
# cp -r apr-util-1.6.1/ httpd-2.4.34/srclib/apr-util
```

### 编译安装

```bash
# ./buildconf
# ./configure --enable-ssl --enable-so --enable-http2 --with-mpm=event --with-included-apr --with-ssl=/usr/local/openssl --prefix=/usr/local/apache2
# make && make install
```

### 添加到环境变量里

```bash
# vi /etc/profile.d/httpd.sh

pathmunge /usr/local/apache2/bin

# source /etc/profile
# httpd -v
```

### 添加 systemd 启动项

```bash
# vi /etc/systemd/system/httpd.service

[Unit]
Description=The Apache HTTP Server
After=network.target

[Service]
Type=forking
ExecStart=/usr/local/apache2/bin/apachectl -k start
ExecReload=/usr/local/apache2/bin/apachectl -k graceful
ExecStop=/usr/local/apache2/bin/apachectl -k graceful-stop
PIDFile=/usr/local/apache2/logs/httpd.pid
PrivateTmp=true

[Install]
WantedBy=multi-user.target

# systemctl daemon-reload
```

### 启动服务,设置开机自启动

```bash
# systemctl start httpd
# systemctl enable httpd
```

## 配置（后续为配置，根据实际情况进行修改）

### 添加 `www` 组及 `httpd` 用户

```bash
# groupadd www
# useradd httpd -g www --no-create-home --shell /sbin/nologin
```

### 修改配置文件

```bash
# vi /usr/local/apache2/conf/httpd.conf

...

# Make sure that ServerRoot is set to the same value as --prefix during ./configure
ServerRoot /usr/local/apache2

# Set ServerName to prevent warning on Apache start
ServerName localhost

# Default port set to 80 - HTTP protocol
Listen 80

# Set user and group
User httpd
Group www

DirectoryIndex index.php index.html

...

```

后续步骤[参考](https://blacksaildivision.com/how-to-install-apache-httpd-on-centos)