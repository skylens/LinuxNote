# MikroTik RouterOS 

### 设置

+ 备份

- 备份

```sh
system backup save name=backname
```

- 恢复备份

```sh
system backup load name=backname.backup
```

- 清除所有配置

```sh
system reset-configuration
```

+ 设置 `WAN` 和 `LAN` 名称

```sh
interface set ether1 name=wan
interface set ether2 name=lan
````

+ 设置 `LAN` 口 `IP`

```sh
ip address add interface=lan address=192.168.183.0/24
```

+ 设置 `WAN` 口 

- 静态地址

```sh
ip address add interface=wan address=211.13.17.2/26
ip route add gateway=211.139.17.1 disabled=no    设置并启用网关
```

- 动态地址

```sh
ip dhcp-client add interface=wan disabled=no
```

+ 设置 NAT 转发

```sh
ip firewall nat add action=masquerade chain=srcnat src-address=192.168.183.0/24
ip firewall nat print
```

+ 设置 dhcp 服务器

```sh
ip dhcp-server> setup
```

+ 关闭不必要的服务

```sh
ip service disable telnet
ip service disable ftp
ip service disable api
ip service disable api-ssl
```