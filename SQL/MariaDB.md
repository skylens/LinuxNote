# MariaDB 

### CentOS 6 安装

阿里云源 [https://mirrors.aliyun.com/mariadb/yum/](https://mirrors.aliyun.com/mariadb/yum/)

```sh
vim /etc/yum.repos.d/MariaDB.repo

# MariaDB 10.3 CentOS repository list - created 2018-10-4 UTC
# http://downloads.mariadb.org/mariadb/repositories/
[mariadb]
name = MariaDB
baseurl=https://mirrors.aliyun.com/mariadb/yum/10.3/centos6-amd64/
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1

yum makecache
yum install -y  MariaDB-server MariaDB-client
```

### 启动服务

```sh
service mysql start
service mysql status
```

### 登陆修改密码，首次登陆密码为空

```sh
mysql -uroot -p

> use mysql;
> update user set password=password("root")where user='root';
> flush privileges;
> exit;
```
