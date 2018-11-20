### `RHCE` 笔记

### 前言

`RHCE` 分为 `RHCSA` 和 `RHCE` 两部分考试。`RHCSA` 共 2.5 个小时，总分 300 分，210 通过，通过 `RHCSA` 考试后，可获得 `RHCSA` 证书。`RHCE` 考试共 3.5 个小时，总分 300 分，210 分通过，通过 `RHCSA` 和 `RHCE` 考试后才能获得 `RHCE`证书。

#### `RHCSA` 部分

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

##### 二、设置` IP` 地址及主机名

###### 设置 `IP`

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

+ 方法三 （使用 `tui` 或者 `gui` 来配置）

```sh
nmtui

或者

nm-connection-edit
```

###### 设置主机名(重新登陆生效)

```shell
hostnamectl set-name desktop.example.com
```

##### 三、开启 `selinux`

```shell
setenforce 1

getenforce


vim /etc/selinux/config

SELINUX=enforcing
```

##### 四、配置` YUM` 仓库

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

##### 五、调整逻辑卷容量

[参考](https://blog.csdn.net/lovektm/article/details/78461453)

###### 1. 检查容量

```sh
df -Th 或者 lvdisplay
```

###### 2、扩展容量

```sh
lvresize -L 290M /dev/vg0/lv0
lvextend -L 290M /dev/vg0/lv0
lvextend -L +100M /dev/vg0/lv0
通知文件系统(默认使用 resize2fs, xfs 文件系统需要先挂载，在执行操作)
resize2fs /dev/vg0/lv0
xfs_growfs /dev/vg0/lv0
```

###### 3、缩小容量

`ext4` 文件系统支持缩小容量，`xfs` 文件系统不支持缩小容量

```sh
需要卸载分区
umount /mnt/lvm
检查文件系统
e2feck -f /dev/vg0/lv0
通知文件系统 (这里的 resize2fs 要指定缩小到的容量)
resize2fs /dev/vg0/lv0 200M
缩小容量
lvresize -L 200M /dev/vg0/lv0
lvreduce -L 200M /dev/vg0/lv0
lvreduce -L -100M /dev/vg0/lv0
检查容量
lvdisplay
重新挂载
mount /dev/vg0/lv0 /mnt/lvm
mount -a
```

##### 六、创建用户和用户组

###### 创建名为 `staff` 的组，组 `id` 为 40000

```sh
groupadd -g 40000 staff
```

###### 创建名为` admin` 的用户， `staff` 为其附属组

```sh
useradd -G staff admin
```

###### 创建名为 `hello` 的用户指定 `shell` 为不可登录 `shell`

```sh
useradd hello -s /sbin/nologin
```

##### 七、文件权限

```sh
文件所有者及所属组为 root
chown root:root /var/tmp/fstab
文件对任何人都没有可执行权限
chmod a-x /var/tmp/fstab
用户 admin 对文件有读写权限
setfacl -m u:admin:rw- fstab
用户 hello 对文件没有读写权限
setfacl -m u:hello:--- fstab
检查文件权限
getfacl
````

##### 八、建立定时任务

```sh
参数 '-e' 是编辑模式，'-u' 是指定用户 (大致格式： 分、时、日、月、星期、命令)
crontab -e -u admin
28 3 * * * /bin/echo 'hello' >>/root/test.txt
检查计划任务
crontab -l -u admin
```

##### 九、创建一个共享目录

```sh
mkdir /mnt/share
所属组为 staff
chgrp staff /mnt/share/
组成员可读可写可执行
chmod g+rwx /mnt/share/
其他组成员没有任何权限
chmod o-rwx /mnt/share/
目录下创建的文件的所属组被自动设置为 staff
chmod g+s /mnt/share/
```

#### `RHCE` 部分

##### `selinux` 设置

##### `ssh` 通过 `firewalld` 防火墙进行访问控制

+ 方法一

在图形界面下使用 `firewall-config` 命令打开图形化的配置工具，使用图形界面配置

+ 方法二

直接使用命令行进行配置

```shell
firewall-cmd --permanent --add-rich-rule='rule family="ipv4" source address="172.24.3.0/24" service name="ssh" reject'
```

**移除规则**

```shell
firewall-cmd --permanent --remove-rich-rule='rule family="ipv4" source address="192.168.149.0/24" service name="ssh" reject'
```

##### alias 别名设置

```shell
echo "alias newps='ps -Ao user,pid,ppid,command'" >>/etc/profile.d/newps.sh
. /etc/profile
```

##### samba 搭建

安装软件

```shell
yum install -y samba samba-client cifs-utils
```

创建目录，检查用户，设置用户密码

```shell
mkdir /smb1
id ldapuser1
smbpasswd -a ldapuser1
```

修改配置文件(修改组为 `STAFF`)

```shell
vim /etc/samba/smb.conf

workgroup = STAFF


[smb1]
		path = /smb1
		hosts allow = 172.16.254.
```

selinux 相关配置

```shell
chcon -R -t samba_share_t /smb1
```