## 搭建自己的私人云盘 __owncloud__

+ 安装

```
# apt-get install php5-gd
```

+ [上传限制修改](http://d-prototype.com/archives/2016)

```
# cd /var/www/owncloud/
# cp .htaccess .htaccess.bak
# vim .htaccess   //修改以下几行()
...
  php_value upload_max_filesize 10240M
  php_value post_max_size 10240M
  php_value memory_limit 10240M
...
# cd /etc/php5/apache2/
# cp php.ini php.ini.bak
# vim php.ini
...
  upload_max_filesize = 10240M
...
  post_max_size = 10240M
...
# cd /etc/php5/cli/
# cp php.ini php.ini.bak
# vim php.ini
...
  upload_max_filesize = 10240M
...
  post_max_size = 10240M
...
# /etc/init.d/apach2 restart
```
