## CentOS 7 通过源码包编译生成 rpm 包，更新内核

**！！！至少需要30G磁盘空间**

**! ! ! 可能导致系统启动失败**

### 1、切换至普通用户

### 2、安装依赖包

```bash
sudo yum install -y wget 
sudo yum install -y ncurses-devel make gcc bc bison flex elfutils-libelf-devel openssl-devel grub2 rpm-build
```

### 3、下载内核源码并解压

```bash
wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.14.124.tar.xz
tar xvf linux-4.14.124.tar.xz
```

### 4、使用旧的内核配置文件 

```bash
cd linux-4.14.124
# 拷贝自带的内核配置文件
cp -v /boot/config-$(uname -r) .config
make olddefconfig
```

### 5、编译 rpm 包

```bash
make rpm-pkg
```

### 6、安装 rpm 包升级内核

```bash
cd ~/rpmbuild/RPMS/x86_64
rpm -iUv kernel-4.19.50-1.x86_64.rpm kernel-devel-4.19.50-1.x86_64.rpm kernel-headers-4.19.50-1.x86_64.rpm
```

### 7、查看内核启动顺序

```bash
awk -F\' '$1=="menuentry " {print i++ " : " $2}' /etc/grub2.cfg
```

### 8、设置默认启动的内核（0 表示 第一个；1 表示 第二个）

```bash
grub2-set-default 0
```

### 9、重启

```bash
reboot
```

