# openssl 升级

#### 下载软件包

```sh
curl -O -L https://www.openssl.org/source/openssl-1.0.2q.tar.gz
```

#### 编译安装

```sh
tar -xvf /tmp/openssl-1.0.2q.tar.gz && cd /tmp/openssl-1.0.2q
./config --prefix=/usr --shared && make && make install
```
