# lamp learn note

> apache2 安装设置

```
$ sudo apt-get install apache2 apache2-doc
$ sudo a2enmod userdir
$ mkdir /home/$USER/public_html
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
