#PHP学习笔记

> 部署ThinkPHP环境

+ 到[ThinkPHP官网](http://www.thinkphp.cn/)下载ThinkPHP zip压缩包

+ 解压```thinkphp_3.*.zip```

```unzip thinkphp_3.*.zip```

+ 将ThinkPHP文件夹拷贝到``` /var/www/html/ ```目录下

```
# cd /var/www/html/
ThinkPHP/
# vim index.php
<?php
define ('APP_PATH' , './Home/');
define ('APP_DEBUG' , true); //打开debug调试
include './ThinkPHP/ThinkPHP.php' ;
?>

````

+ 打开浏览器输入http://127.0.0.1,出现一下信息则证明搭建成功

:)
欢迎使用 ThinkPHP！
版本 V3.2.3
