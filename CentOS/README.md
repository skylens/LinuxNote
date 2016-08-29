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
