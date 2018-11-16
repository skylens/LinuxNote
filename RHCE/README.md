### RHCE

### 前言



#### RHCSA 部分

##### 一、破解 `root` 密码


###### `rd.break` 方法

1. 启动系统，并在 `GRUB2` 启动屏显时，按下 `e` 键进入编辑模式

2. 找到 `linux16` 开头的地方，在末尾添加 `rd.break console=tty0`，按 `ctrl + x` 进入单用户模式

3. `mount -o remount,rw /sysroot ` 重新再挂载文件系统

4. `chroot /sysroot `

5. `echo redhat|passwd --stdin root`

6. `touch /.autorelabel `

7. `ctrl + d`

8. `reboot`

###### `init` 方法

1. 启动系统，并在 `GRUB2` 启动屏显时，按下 `e` 键进入编辑模式

2. 找到 `linux16` 开头的地方，在末尾添加 `init=/bin/sh`，按 `ctrl + x` 进入单用户模式

3. `mount –o remount,rw /`

4. `echo redhat|passwd -–stdin root`

5. `touch /.autorelabel `

6. `ctrl + d`

7. `reboot`

##### 二、设置 IP 地址及主机名

###### 设置 IP

+ 方法一

```shell
cp /etc/sysconfig/network-scripts/ifcfg-ens33{,.orig}
vim /etc/sysconfig/network-scripts/ifcfg-ens33

IPADDR=172.16.254.250
NETMASK=255.255.255.0
GATEWAY=172.16.254.254
DNS1=172.16.254.254

systemctl restart network
systemctl enable network
```

+ 方法二

```shell
nmcli conn
nmcli conn modify ens33 connection.interface-name ens33
nmcli conn modify ens33 ipv4.method manual
nmcli conn modify ens33 ipv4.address "172.16.254.250/24"
nmcli conn modify ens33 ipv4.gateway "172.16.254.254"
nmcli conn modify ens33 ipv4.dns "172.16.254.254"
nmcli conn modify ens33 connection.autoconnect yes

systemctl restart network
systemctl enable network
```

###### 设置主机名(重新登陆生效)

```shell
hostnamectl set-name desktop.example.com
```

##### 三、开启 selinux

```shell
setenforce 1

getenforce


vim /etc/selinux/config

SELINUX=enforcing
```

##### 四、配置 YUM 仓库

```shell
vim /etc/yum.repo.d/rhel.repo

[rhel]
name=RedHatEnterpriseLinux
baseurl=http://server.example.com/yum
enabled=1
gpgcheck=0

yum makecache all
yum repolsit all
```

##### 调整逻辑卷容量

```sh

```

#### RHCE 部分

##### selinux 设置

##### ssh 通过 firewalld 防火墙进行访问控制

+ 方法一

在图形界面下使用 `firewall-config` 命令打开图形化的配置工具，使用图形界面配置

+ 方法二

直接使用命令行进行配置

```shell
firewall-cmd --permanent --add-rich-rule='rule family="ipv4" source address="172.24.3.0/24" service name="ssh" reject'
```

--移除规则--

```shell
firewall-cmd --permanent --remove-rich-rule='rule family="ipv4" source address="192.168.149.0/24" service name="ssh" reject'
```
