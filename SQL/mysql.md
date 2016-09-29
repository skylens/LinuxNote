# MySQl 学习笔记

+ 开启远程访问的权限

```
$ sudo vim /etc/mysql/my.cnf  # 注释 bind-address          = 127.0.0.1 这行
...
bind-address          = 127.0.0.1
...


$ mysql -uroot -p       #本地登录mysql

//赋予任何主机访问数据的权限
mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'WITH GRANT OPTION;
//允许用户test从ip为192.168.1.6的主机连接到mysql服务器，并使用123456作为密码
mysql> GRANT ALL PRIVILEGES ON *.* TO 'test'@'192.168.1.6'IDENTIFIED BY '123456' WITH GRANT OPTION;
//修改生效
mysql> FLUSH PRIVILEGES;
//退出mysql
mysql> exit;
```
