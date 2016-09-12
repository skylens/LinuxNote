# **在ubuntu server 下搭建 lamp 环境**

  环境:ubuntu server 12.04 LTS

  **1. 安装软件**

  (一次性安装 ```$ sudo apt-get install mysql-server apache2 php5 php5-mysql```)

  (tasksel 安装 ```$ sudo tasksel install lamp-server```)

    1.1 安装 mysql-server

    ```
    $ sudo apt-get install mysql-server
    ```

    1.2 安装 apache2

    ```
    $ sudo apt-get install apache2
    ```

    1.3 安装 php5 php5-mysql

    ```
    $ sudo apt-get install php5 php5-mysql
    ```

    apache2 通过一个名为 'libphp5.so' 的模块调用 php

    ```
    $ cat /etc/apache2/mods-enabled/php5.load
    LoadModule php5_module /usr/lib/apache2/modules/libphp5.so
    ```

    php 通过一个名为 'mysql.so' 的模块对 mysql 进行 CURD 操作 (creat、update、retrieve、delete)

    ```
    $ cat /etc/php5/conf.d/mysql.ini
    ; configuration for php MySQL module
    extension=mysql.so
    ```

  **2. 创建 phpinfo 服务器探针**

  ```
  $ cd /var/www/html/
  $ sudo vim info.php
  <?php
  echo mysql_connect('localhost','root','123456') ? 'Hello' : 'world!';
  phpinfo();
  ```

  **3. 安装 php 的扩展包**

  ```
  $ sudo apt-get install php5-gd curl libcurl3 libcurl3-dev php5-curl
  ```

  重启 apache2

  ```
  $ sudo service apache2 restart
  ```

  **4. 创建 wwwroot 目录,在 apache2 中配置虚拟主机**

  ```
  $ cd /var/
  $ sudo mkdir -p /wwwroot/{vedio,bbs,oa}
  $ cd /etc/apache2/site-available/
  $ sudo cp default vedio
  $ sudo cp default bbs
  $ sudo cp default oa
  $ sudo vim vedio
  <VirtualHost *:80>
    ServerName vedio.imooc.com
    ServerAdmin webmaster@localhost

    DocumentRoot /wwwroot/vedio
    <Directory />
      Options FollwSymLinks
      AllowOverride None
    </Directory>
    <Directory /wwwroot/vedio/>
      Options Index FollwSymLinks MultiViews
      AllowOverride None
      Order allow,deny
      allow from ail
    </Driectory>

    ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/
    <Driectory "/usr/lib/cgi-bin">
      AllowOverride None
      Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch

  ...
  </VirtualHost>

  $ cd ../site-enabled
  $ cd sudo ln -s ../site-available/vedio video
  ```

  **5. MySQL 数据库存储目录迁移**

  ```
  $ sudo service mysql stop
  $ cd /var/lib/
  $ ls -l
  $ sudo mkdir /mysqldate
  $ sudo chown -vR mysql:mysql /mysqldata/
  $ sudo chmod -vR 700 /mysqldata/
  $ su -
  passwd:
  # cp -av /var/lib/mysql/* /mysqldata/
  # exit
  $ sudo vim /etc/mysql/my.cnf
  ...
  #datadir       =/var/lib/mysql
  datadir        =/mysqldata
  ...
  $ sudo vim /etc/apparmor.d/usr.sbin.mysqld
  ...
  #/var/lib/mysql/ r,
  #/var/lib/mysql** rwk,
  /mysqldata/ r,
  /mysqldata/** rwk,
  ...
  $ sudo service apparmor reload
  $ sudo service mysql start
  $ mysql -uroot -p
  ...
  mysql>create database imooc;
  mysql>show databases;
  +------------------+
  |Databases         |
  +------------------+
  |infomation_schema |
  |imooc             |
  |mysql             |
  |performance_schema|
  +------------------+
  4 rows in set (0.00 sec)
  mysql>exit;
  $ su -
  passwd:
  # cd /mysqldata/
  # ls -al
  # exit
  $
  ```
  **6. phpmyadmin 安装**

  ```
  $ sudo apt-get install phpmyadmin
  $ sudo ln -s /usr/share/phpmyadmin /var/www/pma
  ```

  ```
  $ wget https://files.phpmyadmin.net/phpMyAdmin/4.6.4/phpMyAdmin-4.6.4-all-languages.zip
  $ unzip phpMyAdmin-4.6.4-all-languages.zip
  $ cd /var/www/
  $ sudo mkdir pma
  $ sudo cp phpmyadmin/* /var/www/pma
  ```

  浏览器访问```http://127.0.0.1/pma```

  **7. 开启 MySQL 的 remote access**

  ```
  $ sudo vim /etc/mysql/my.cnf
  ...
  #bind-address        =127.0.0.1
  ...
  ```

  在 mysql 中添加用户 imooc , '%' 表示 任意主机访问

  ```
  $ sudo service mysql restart
  ```
  
