# CentOS 7 编译内核 RPM 包

[Compile Linux Kernel on CentOS7](https://linuxhint.com/compile-linux-kernel-centos7/)

[Custom Compiled Kernel on CentOS 7](https://www.linode.com/docs/tools-reference/custom-kernels-distros/custom-compiled-kernel-centos-7/)

[添加 BBR](https://www.cyberciti.biz/cloud-computing/increase-your-linux-server-internet-speed-with-tcp-bbr-congestion-control/)

CPU 数量尽量多，磁盘空间不少于30G

```bash
yum update
yum install -y wget tmux net-tools
yum -y groups install "Development Tools"
yum install -y ncurses-devel make gcc bc bison flex elfutils-libelf-devel openssl-devel grub2 rpm-build
wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.14.124.tar.xz
tar xvf linux-4.14.124.tar.xz
cd linux-4.14.124
cp -v /boot/config-$(uname -r) .config
# bbr 使用 Google 提供的 config
wget -O .config https://raw.githubusercontent.com/google/bbr/master/Documentation/config.gce
make menuconfig # 或者 make olddefconfig
make rpm-pkg
```

安装编译生成的 RPM 包，并重启

```bash
cd rpmbuild/RPMS/x86_64
rpm -iUv *.rpm

reboot
```

后续

查看内核版本  `uname -msr`

配置 grub2，有时需要

```bash
# 查看启动项
awk -F\' '$1=="menuentry " {print i++ " : " $2}' /etc/grub2.cfg
# 设置默认启动的内核（0 表示 第一个；1 表示 第二个）
grub2-set-default 0
```
清楚旧的内核文件

```bash
yum install -y yum-utils
package-cleanup --oldkernels
reboot
```

yum 排除内核更新

```bash
echo "exclude=kernel*" >> /etc/yum.conf
```
