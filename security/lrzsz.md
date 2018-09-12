# 编译安装 lrzsz

## 下载

```bash
# wget https://www.ohse.de/uwe/releases/lrzsz-0.12.20.tar.gz
```

## 安装

```bash
# tar -xvf lrzsz-0.12.20.tar.gz
# cd lrzsz-0.12.20
# ./configure --prefix=/usr/local/lrzsz
# make && make install
# ln -s /usr/local/lrzsz/bin/lrz /usr/bin/rz
# ln -s /usr/local/lrzsz/bin/lsz /usr/bin/sz
# rz --version
```