# namp 教程

## 安装

+ windows 

- 安装图形界面版(推荐)

[zenmap](https://nmap.org/dist/nmap-7.70-setup.exe)

- 命令行版

```bash
wget -c https://nmap.org/dist/nmap-7.70-win32.zip
```

然后设置环境变量，把安装路径添加到 `Path` 中

+ linux

```bash
# curl -Ok https://nmap.org/dist/nmap-7.70.tar.bz2
# tar -xvf nmap-7.70.tar.bz2 && cd nmap-7.70
# ./configure && make && make install
```