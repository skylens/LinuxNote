# CentOS 7 编译内核 RPM 包

[Compile Linux Kernel on CentOS7](https://linuxhint.com/compile-linux-kernel-centos7/)

[Custom Compiled Kernel on CentOS 7](https://www.linode.com/docs/tools-reference/custom-kernels-distros/custom-compiled-kernel-centos-7/)

[添加 BBR](https://www.cyberciti.biz/cloud-computing/increase-your-linux-server-internet-speed-with-tcp-bbr-congestion-control/)

CPU 数量尽量多，磁盘空间不少于30G

```bash
yum update
yum install -y wget tmux net-tools
yum -y groups install "Development Tools"
yum install -y ncurses-devel make gcc bc bison flex elfutils-libelf-devel openssl-devel grub2
wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.14.124.tar.xz
tar xvf linux-4.14.124.tar.xz
cd linux-4.14.124
cp -v /boot/config-3.10.0-957.el7.x86_64 .config
make menuconfig
make rpm-pkg
```

安装编译生成的 RPM 包，并重启

```bash
cd rpmbuild/RPMS/x86_64
rpm -iUv *.rpm

reboot
```

后续

```bash
echo "exclude=kernel*" >> /etc/yum.conf
```
