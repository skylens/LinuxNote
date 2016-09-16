# **在 Debian 下安装 firefox** 

1 、下载 [firefox](www.mozilla.com/firefox/) 

2 、解压 firefox

```
$ cd Downloads/
$ ls
firefox-48.0.2.tar.bz2
$ tar jxf firefox-48.0.2.tar.bz2
$ ls
firefox-48.0.2.tar.bz2 firefox/
```
3 、移动 ```firefox/``` 到 ```/opt/``` 目录下

```
$ sudo mv firefox/ /opt/
```

4 、做 ``` ln -s``` 链接(以便于可以直接在 bash 下通过 firefox & 启动 firefox)

```
$ sudo ln -s /opt/firefox/firefox /usr/bin/firefox
```

5 、测试

```
$ firefox &
```

