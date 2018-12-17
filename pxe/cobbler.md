# cobbler 部署配置

### 存在的问题

不能同时进行 `uefi` 模式下安装 `VMware EXSI` 和 `Linux`，安装 `VMware EXSI` 需要当读修改 `dhcp.template`，`BIOS` 部署正常。

### 准备

`IP` 地址（两个，当然一个也是可以的），需要保证其中一个 `IP` 地址能够上外网。

`server` 和 `next_server` 的值为上外网的 `IP`(z这里就是 192.168.149.143)，`dhcp.template` 的种的子网根据实际情况设置(这里为 192.168.183.0/24，网关及 DNS 为 192.168.183.254/24)。 

### 部署

+ 安装相关软件

```sh
yum install -y dhcp tftp-server xinetd httpd cobbler cobbler-web pykickstart fence-agents debmirror
rpm -qa | grep -E "dhcp|tftp-server|xinetd|httpd|cobbler|cobbler-web|pykickstart|fence-agents|debmirror"
```

+ 修改 `cobbler` 配置

```sh
sed -i 's/allow_dynamic_settings: 0/allow_dynamic_settings: 1/g' /etc/cobbler/settings
systemctl restart cobblerd
cobbler setting edit --name=server --value=192.168.149.143
cobbler setting edit --name=next_server --value=192.168.149.143
cobbler setting edit --name=default_password_crypted --value=`openssl passwd -1 -salt 'cobblerAsdadAD' 'redhat'`
```

+ 获取 `bootloader` 文件及系统验证文件

```sh
cobbler get-loaders
cobbler signature update
cobbler sync
```

+ 修改 debmirror 配置文件

```sh
sed -i -e 's/@dists=/#@dists=/g' /etc/debmirror.conf
sed -i -e 's/@arches=/#@arches=/g' /etc/debmirror.conf
cobbler sync
```

+ 基本配置完毕，检查配置

```sh
systemctl restart cobblerd
cobblerd check
```

### 测试

+ 创建镜像寸挂载目录

```sh
mkdir -vp /mnt/centos/{7,6}
mkdir -pv /mnt/debian
mkdir -pv /mnt/ubuntu
mkdir -pv /mnt/suse
mkdir -vp /mnt/exsi/{6.7,6.5,6.0}
```

+ `centos 7`

```sh
mount -t iso9660 -o ro /dev/cdrom /mnt/centos/7
cobbler import --path=/mnt/centos/7 --name=CentOS-7 --arch=x86_64
cobbler profile add --name=CentOS-7-x86_64 --distro=CentOS-7-x86_64
```

+ `centos 6`

```sh
mount -t iso9660 -o ro /dev/cdrom /mnt/centos/6
cobbler import --path=/mnt/centos/6 --name=CentOS-6 --arch=x86_64
cobbler profile add --name=CentOS-6-x86_64 --distro=CentOS-6-x86_64
```

+ `exsi 6.5`

```sh
mount -t iso9660 -o ro /dev/cdrom /mnt/exsi/6.5/
cobbler import --path=/mnt/exsi/6.5 --name=exsi6.5 --arch=x86_64
cobbler profile add --name=exsi6.5-x86_64 --distro=exsi6.5-x86_64
```