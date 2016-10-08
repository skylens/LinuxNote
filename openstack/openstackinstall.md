# 安装 openstack

+ CentOS 7 

 在CentOS 7 上安装 openstack 
 
 * 安装 CentOS 7 

   1.对旧服务器上的数据进行备份, 以免安装新的操作系统导致数据丢失
   
   2.选择默认语言为 Engilsh , 时区为 Asia/shanghai , 最小安装, 更改主机名(标明个节点的名称control,network,compute), 
   选择磁盘格式化(文件格式为ext4), 设置 Root 账户的密码, 普通用户的用户名及密码
   
   3.配置网络
    
    ```
    # cd /etc/sysconfig/network-scripts/
    # cp ifcfg-enp0s3 ifcfg-enp0s3.bak
    # vi ifcfg-enp0s3
       TYPE=Ethernet
      *BOOTPROTO=static
       DEFROUTE=yes
       PEERDNS=yes
       PEERROUTES=yes
       IPV4_FAILURE_FATAL=no
       IPV6INIT=yes
       IPV6_AUTOCONF=yes
       IPV6_DEFROUTE=yes
       IPV6_PEERDNS=yes
       IPV6_PEERROUTES=yes
       IPV6_FAILURE_FATAL=no
       NAME=eno16777736
       UUID=be068d11-d1de-4342-9f6f-96aaa53b957f
       DEVICE=eno16777736
      *ONBOOT=yes
      *IPADDR=192.168.2.7
      *GATEWAY=192.168.2.2
      *NETMASK=255.255.255.0
      *DNS1=114.114.114.114
      *DNS2=8.8.8.8

    ```
