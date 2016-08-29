# **CentOS 下lamp安装配置**

## **Apache服务器安装与配置**
**1. yum 安装 Apache**

```
 # yum -y install httpd
```

**2. 启动Apache并且设置开机启动**

```
# systemctl start httpd.service
# systemctl enable httpd.service
```

**3. 查看状态验证(出现下面两行,'enabled'表示httpd服务已设为开机启动,'active(running)'则表示httpd服务正在运行中)**

```
# systemctl status httpd.service

● httpd.service - The Apache HTTP Server
   Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; vendor preset: disabled)
   Active: active (running) since 一 2016-08-29 23:59:26 CST; 17s ago
     Docs: man:httpd(8)
           man:apachectl(8)
 Main PID: 10450 (httpd)
   Status: "Total requests: 0; Current requests/sec: 0; Current traffic:   0 B/sec"
   CGroup: /system.slice/httpd.service
           ├─10450 /usr/sbin/httpd -DFOREGROUND
           ├─10451 /usr/sbin/httpd -DFOREGROUND
           ├─10452 /usr/sbin/httpd -DFOREGROUND
           ├─10453 /usr/sbin/httpd -DFOREGROUND
           ├─10454 /usr/sbin/httpd -DFOREGROUND
           └─10455 /usr/sbin/httpd -DFOREGROUND

8月 29 23:59:26 localhost.localdomain systemd[1]: Sta...
8月 29 23:59:26 localhost.localdomain httpd[10450]: A...
8月 29 23:59:26 localhost.localdomain systemd[1]: Sta...
Hint: Some lines were ellipsized, use -l to show in full.

```

测试配置文件语法有没有问题
```
# apachectl configtest
```

重启apache服务
```
systemctl restart httpd
```

## **PHP安装与配置**

**1. 安装PHP**

```
yum install -y php
```
**2. 测试Apache能不能正常调用PHP**

```
# vim /var/www/html/index.php
<?php phpinfo(); ?>
```

## **MariaDB 安装与配置**

**1. MariaDB 安装**

```
yum install -y mariadb-libs mariadb-embedded mariadb mariadb-embedded-devel mariadb-devel mariadb-test mariadb-server
```

**2. 配置MariaDB**

a. 设置**```root```**密码('123456'就是我设置的密码)

```
# mysqladmin -u root -p password 123456
```

b. 登录MariaDB验证(在'Enter password:'后面输入刚刚设置的密码'123456')

```
# mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 8
Server version: 5.5.50-MariaDB MariaDB Server

Copyright (c) 2000, 2016, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]>
```

## **MySQL 安装与配置**
(由于从RHEL 7开始Red Hat公司推荐使用MariaDB替换MySQL,因此默认情况下,并没有提供MySQL的安装包,因此需要进行前两步操作)
**1. 安装 mysql**

```
# wget http://repo.mysql.com//mysql57-community-release-el7-8.noarch.rpm
# yum localinstall mysql-community-release-el7-8.noarch.rpm
# yum repolist enabled | grep mysql
# yum -y install mysql mysql-server
```

## 配置 mysql
1 第一次使用 mysql ,不用输密码,直接回车

```
 $ mysql -u root -p
 Enter password:
 Welcome to the MySQL monitor.  Commands end with ; or \g.
 Your MySQL connection id is 5
 Server version: 5.1.73 Source distribution

 Copyright (c) 2000, 2013, Oracle and/or its affiliates. All rights reserved.

 Oracle is a registered trademark of Oracle Corporation and/or its
 affiliates. Other names may be trademarks of their respective
 owners.

 Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

 mysql>
 ```

 2 更新 mysql 数据库中的 root 的

 ```
  mysql> use mysql;
 ```

3 更新 user 表中的 root 的 password ,更新为 123456

```
 mysql> UPDATE user SET password=PASSWORD('123456') WHERE user='root';
```

4 刷新

```
 mysql> flush privileges;
```

5 退出

```
 mysql> exit;
```
