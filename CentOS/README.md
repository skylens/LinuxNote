# CentOS(Oracle Linux) Install

1. **网络设置**

查看网卡信息

```
# ip addr
```


备份并编辑```/etc/sysconfig/network-scripts/ifcfg-enp0s3```

```
# cd /etc/sysconfig/network-scripts/
# cp ifcfg-enp0s3 ifcfg-enp0s3.bak
# vi ifcfg-enp0s3

1 TYPE=Ethernet
2 BOOTPROTO=dhcp
3 DEFROUTE=yes
4 PEERDNS=yes
5 PEERROUTES=yes
6 IPV4_FAILURE_FATAL=no
7 IPV6INIT=yes
8 IPV6_AUTOCONF=yes
9 IPV6_DEFROUTE=yes
10 IPV6_PEERDNS=yes
11 IPV6_PEERROUTES=yes
12 IPV6_FAILURE_FATAL=no
13 NAME=eno16777736
14 UUID=be068d11-d1de-4342-9f6f-96aaa53b957f
15 DEVICE=eno16777736
16 ONBOOT=no

```

配置动态分配IP : 修改(16行)

```
16 ONBOOT=yes
```
配置静态IP : 修改(2,16行),添加

```
2 BOOTPROTO=static
.
.
.
16 ONBOOT=yes

IPADDR=192.168.2.7
GATEWAY=192.168.2.2
NETMASK=255.255.255.0
DNS1=114.114.114.114
DNS2=8.8.8.8
```
2. **利用本地镜像源安装几个软件**

```
# yum install -y wget openssh-server net-tools
```

3. **配置yum**

备份```/etc/yum.repos.d/CentOS-Base.repo```

```
# mv  /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak
```

下载或```scp```上传repo文件,放到```/etc/yum.repos.d/```下,生成缓存

```
# yum clean all
# yum makecache
```

4. **升级一下软件,安装一些常用软件**

```
# yum update
# yum install -y sudo vim bash bash-completion nano tmux ntpdate tar zip unzip
```

5. **其他配置**
    1. 关闭 selinux
    暂时
    ```
    # setenforce 0
    ```
    修改配置文件,永久关闭 selinux

    ```
    # vi /etc/selinux/config
    找到" SELINUX=encforcing " 改为 " SELINUX=disabled "
    ```
