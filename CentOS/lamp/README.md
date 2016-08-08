# CentOS 下Apache服务器安装与配置


## 安装 chkconfig ,设置开机自启动的工具

```
 $ yum -y install chkconfig 
```

## yum 安装 Apache 

```
 $ yum -y install httpd
```
## 

# CentOS 下 MySQL 安装与配置

## 安装 mysql

```
 $ yum -y install mysql mysql-server
```

## 配置 mysql
### 第一次使用 mysql ,不用输密码,直接回车

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
 
 ### 更新 mysql 数据库中的 root 的 
 ```
  mysql>use mysql;
 ```
