# Web开发环境

## lamp learn note

__**# 表示以```root```身份登录系统进行操作**__

__**$ 表示以普通用户身份登录系统进行操作**__

> MySQl安装

```
# aptitude install mysql-server mysql-client
```

设置密码

```
# /usr/bin/mysqladmin -u root password 123456
```

> apache2 安装设置

```
# apt-get install apache2 apache2-doc
```

> PHP安装

```
# aptitude install php5 php5-mysql libapache2-mod-php5
# apt-get install php5-mysql php5-curl
```

测试

```
# nano /var/www/test.php
<?php phpinfo(); ?>
```
在浏览器中输入```http://127.0.0.1/test.php```

> phpmyadmin安装

```
# aptitude install phpmyadmin
```

重启Apache

```
# /etc/init.d/apache2 restart
```

> Apache的其他设置

**1. 开启mod_userdir模块,实现```http://127.0.0.1/~<username>```**
```
# a2enmod userdir
# mkdir /home/$USER/public_html
```
> 切换到**Root**用户
```
# chgrp www-data /home/<username>/public_html
# /etc/init.d/apache2 restart
```

> 切换回**普通用户**
```
curl http://127.0.0.1/~<username>
```

## lnmp learn note

> apt-get install nginx

> 安装mysql



## jsp learn note

> 安装 ```Tomcat8```

```
# apt-get install tomcat8
```
  + 在浏览器中输入```http://127.0.0.1:8080``` 测试

  + ```tomcat``` 的一些配置目录
    ```
    # 应用家目录
    # /var/lib/tomcat8/webapps/ROOT/
    # 依赖目录
    # /usr/share/tomcat8/lib/
    ```

> 安装 ```mysql```

```
# aptitude install mysql-client mysql-server
```
