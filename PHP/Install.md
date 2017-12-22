# CentOS 7 安装 PHP 5.6

**安装源**

```bash
rpm -Uvh https://mirror.webtatic.com/yum/el7/epel-release.rpm
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
```

**安装 `PHP 5.6`** 

```sh
yum install php56w php56w-fpm php56w-opcache
```

**替换 `php-common`**       

```bash
yum install yum-plugin-replace
yum replace php-common --replace-with=php56w-common
```