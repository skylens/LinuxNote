# CentOS 6 下安装配置 MySQL

## 安装

### 安装依赖

```bash
# yum install -y libaio numactl
```

### 下载二进制包

```bash
# curl -O -L https://cdn.mysql.com//Downloads/MySQL-5.7/mysql-5.7.23-linux-glibc2.12-x86_64.tar.gz
# tar -xvf mysql-5.7.23-linux-glibc2.12-x86_64.tar.gz -C /usr/local/mysql
```

### 新建用户组及用户

```bash
# groupadd mysql
# useradd -r -g mysql -s /bin/false mysql
```

### 创建数据库数据存储目录

```bash
# mkdir /usr/local/mysql/data
```

### 赋予目录用户组即用户权限

```bash
# chown -R mysql:mysql /usr/local/mysql/
```

### 初始化数据库，注意记录末尾生成的密码

```bash
# cd /usr/local/mysql
# bin/mysqld --user=mysql --basedir=/usr/local/mysql --datadir=/usr/local/mysql/data --initialize
```

### 编辑配置文件

```bash
# vi /etc/my.cnf

[mysqld]
port=3306
datadir=/usr/local/mysql/data
socket=/tmp/mysql.sock
user=mysql
# Disabling symbolic-links is recommended to prevent assorted security risks
symbolic-links=0

[mysqld_safe]
log-error=/var/log/mysqld.log
pid-file=/var/run/mysqld/mysqld.pid

```

### 复制 init 启动文件到相应的目录，并启动服务

```bash
# cd /usr/loca/mysql/
# cp support-files/mysql.server /etc/init.d/mysqld
# service mysqld start
```

### 设置环境变量，添加 MySQL 可执行文件路径

```bash
# vi /etc/profile

export PATH=$PATH:/usr/local/mysql/bin/
```

### 使用之前记录的密码登陆 MySQL ，修改密码

```bash
# mysql -uroot -p
mysql> set password for 'root'@'localhost'=password('123456');
mysql> flush privileges;
```