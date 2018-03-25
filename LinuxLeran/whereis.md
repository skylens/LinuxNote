# linux下查看某个命令属于哪个包

+ CentOS 

```bash
yum provides /etc/passwd
rpm -qf /etc/passwd
```

+ Debian

```bash
dpkg -S whereis
dpkg-query -S /usr/bin/whereis
```

+ gentoo

```bash
e-file qmake
query b qmake
```