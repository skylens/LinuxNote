# 编译安装支持 TLSv1.1+ 版本的 curl

## 下载

```bash
# wget https://www.openssl.org/source/openssl-1.0.1u.tar.gz
# wget https://curl.haxx.se/download/curl-7.50.3.tar.gz
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

## 编译安装 curl

```bash
# tar -zxf curl-7.50.3.tar.gz
# cd curl-7.50.3/
# ./configure --with-ssl=/usr/local/ssl --enable-shared=no --exec-prefix=/usr
# make && make install
```

## 检查版本

```bash
# curl --version
```