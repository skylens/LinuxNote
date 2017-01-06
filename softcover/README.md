# [softcover 在线文档托管](http://manual.softcover.io/book/)

## ubuntu 下安装 `softcover` 

先安装 [`ruby 和 gem`](../Ruby/README.md), `texlive-xetex` 

```bash
$ sudo apt-get install texlive-xetex
```

```bash
$ sudo gem install softcover
```

`Can't find libcurl or curl/curl.h (runtimeerror) ruby` 错误解决办法

```bash
$ sudo apt-get install libcurl3 libcurl3-gnutls libcurl4-openssl-dev
``` 
