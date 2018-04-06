# Debian 安装完之后，使用`Tab`键补全命令时会有一个烦人得嘀声，如何关闭它

+ 临时关闭

```bash
# rmmod pcspkr
```

+ [永久关闭](https://wiki.archlinux.org/index.php/PC_speaker#Globally)

```bash
# echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf  //Debian系
# echo "alias pcspkr off" >> /etc/modprobe.conf  //CentOS系
```

+ 修改 inputrc 文件

```bash
# vi /etc/inputrc
//取消注释
set bell-style none

```