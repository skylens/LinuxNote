# MySQl 学习笔记

 **[Itf mysql资料](http://cs.swfu.edu.cn/itf/?p=103)**

+ 开启远程访问的权限

```
$ sudo vim /etc/mysql/my.cnf  # 注释 bind-address          = 127.0.0.1 这行
或者
$ sudo vim mysql/mysql.conf.d/mysqld.cnf  # 注释 bind-address          = 127.0.0.1 这行
...
#  bind-address          = 127.0.0.1
...

$ sudo /etc/init.d/mysql restart  //修改了配置文件, 重启服务

$ mysql -uroot -p       #本地登录mysql

//允许用户 root 从任何主机连接到 mysql 服务器
mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'IDENTIFIED BY 'password' WITH GRANT OPTION;
//允许用户 root 从任意主机连接到 mysql 服务器，并使用 '123456' 作为密码
mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'IDENTIFIED BY '123456' WITH GRANT OPTION;
//允许用户 test 从ip为 192.168.1.6 的主机连接到 mysql 服务器，并使用 '123456' 作为密码
mysql> GRANT ALL PRIVILEGES ON *.* TO 'test'@'192.168.1.6'IDENTIFIED BY '123456' WITH GRANT OPTION;
//允许用户 test 从任意主机连接到 mysql 服务器，对testDB有所以权限，并使用 '123456' 作为密码
mysql> GRANT ALL PRIVILEGES ON testDB.* TO 'test'@'%'IDENTIFIED BY '123456' WITH GRANT OPTION;
//修改生效
mysql> FLUSH PRIVILEGES;
//退出mysql
mysql> exit;
```
+ 远程登录 mysql 

```
$ mysql -h 127.0.0.3 -u root -p
```

+ 添加用户并授权

```
$ mysql -uroot -p
// 添加名为 'test' 密码为 '123456' 的账户, 并授予查询, 插入, 更新 数据的权限
$ mysql> INSERT INTO user (host, user, password,select_priv, insert_priv, update_priv) VALUES ('%', 'test',PASSWORD('123456'), 'Y', 'Y', 'Y');
```

+ Navicat Preminum 使用

  * 导出为sql文件
    
    打开数据库 ==> 转储 SQL 文件 ==> 结构和数据
  
  * 导入数据
    
    打开数据库 ==> 表 ==> 导入向导
    
