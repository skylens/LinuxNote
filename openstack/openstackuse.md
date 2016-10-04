# 使用管理 openstack

+ 镜像

  + 测试镜像 Cirros
    user:cirros
    password:cubswin:)

+ 安全组

  + linux
    添加所有规则除了(RDP, MS SQL)

  + windows
    添加所有规则除了(SSH)

+ VNC 
 
 + 用 virsh 查看所有虚拟机实例 ID
 
 ```# virsh list --all```

 + 查看 ID 所对应的虚拟机端口( 1 为虚拟机实例的 ID )

 ```# virsh vncdisplay 1```
 
 + 用 VNC 客户端连接虚拟机实例


