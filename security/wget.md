# 编译安装 wget

## 下载

```bash
# curl -O https://www.openssl.org/source/openssl-1.0.1u.tar.gz
# curl -O https://ftp.gnu.org/gnu/wget/wget-1.19.tar.gz
```

## 编译安装 openssl

```bash
# tar -zxf openssl-1.0.1u.tar.gz
# cd openssl-1.0.1u/
# ./config shared
# make && make install
```

## 复制 ssl 相关的动态链接库

```bash
# cp  /usr/local/ssl/lib/libcrypto.so.1.0.0  /usr/local/ssl/lib/libssl.so.1.0.0  /usr/lib64/
```

## 添加动态链接库的环境变量

```bash
# vim /etc/profile

export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

```

## 编译安装 wget

```bash
# tar -xvf wget
# ./configure --prefix=/usr --sysconfdir=/etc --with-ssl=openssl
# make && make install
```

[参考](https://lempstacker.github.io/tw/compile-wget-1.18-from-source-on-centos-7.2/)

[参考](http://www.linuxfromscratch.org/blfs/view/svn/basicnet/wget.html)
