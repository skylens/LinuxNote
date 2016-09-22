# 在 linux 下通过源码安装软件

* 安装 gcc 编译环境

```
$ sudo apt-get install gcc make
```

* 下载并解压源码包, 进入源码目录

```
$ wget http://1270.0.1/download/test.tar.gz
$ tar -zxf test.tar.gz
$ cd test/
```


* 开始编译安装

```
$ ./configure --prefix=/usr/local/test/
$ make
$ make install
```
