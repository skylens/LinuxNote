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

### 设置初始化密码及修改密码

+ 方法一：(初始密码为空)

```sh
mysql
```

```sql
UPDATE mysql.user SET PASSWORD=PASSWORD('dbpassword') WHERE USER='root';
FLUSH PRIVILEGES;
exit;
```

+ 方法二：(初始密码为空) --不生效--

```sh
mysql
```

```sql
SET PASSWORD FOR 'root'@'%' = PASSWORD('dbpassword');
```

+ 方法三

```sh
mysql
```

```sql
use mysql;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'dbpassword' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY 'dbpassword' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```

### 删除空用户

```sql
DELETE FROM mysql.user WHERE user='';
```
