# **Web**

### **在Debian上搭建wordpress博客系统**

[Vedio](http://www.imooc.com/learn/547)

[**1. 在Debian上搭建lamp**](https://github.com/skylens/LinuxNote/tree/master/Debian/lamp)

开启mod_rewrite模块,重启Apache

```
# a2enmod rewrite
# service apache2 restart
```

**2. 下载wordpress**

[**```WordPress主页```**](https://cn.wordpress.org/)

```
# wget https://cn.wordpress.org/wordpress-4.5.3-zh_CN.tar.gz
# tar zxf wordpress-4.5.3-zh_CN.tar.gz
# mv wordpress/ /var/www/html/
```

**3. 安装wordpress**

a. 在MySQL中创建数据库

  在浏览器中输入```http://127.0.0.1/phpmyadmin/```回车,在MySQL中创建一个数据库

b. 开始在web端安装wordpress

  在浏览器中输入```http://127.0.0.1/wordpress/```回车,出现wordpress安装的网页界面,填入刚刚创建的数据库名,用户名及密码,数据库IP(127.0.0.1)等,然后安装wordpress
