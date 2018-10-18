# NTP 时间同步

### [NTP 地址池](http://www.ntp.org.cn/pool.php)


|       `域名`        |       `IP`       |
| :-----------------: | :--------------: |
|   `cn.ntp.org.cn`   |  `202.108.6.95`  |
| `0.cn.pool.ntp.org` | `193.228.143.12` |
|  `ntp.aliyun.com`   |  `203.107.6.88`  |
|  `time.apple.com`   | `17.253.114.125` |
| `time.windows.com`  | `52.173.193.166` |

### windows 搭建授时服务器

### CentOS 设置 ntp 时间同步

安装 `chrony`

```sh
yum install chrony -y
```

修改配置文件

```sh
vi /etc/chrony.conf

...
server  192.168.1.238     iburst
...

```

启动服务

```sh
systemctl start chronyd ; systemctl enable chronyd
```

检查是否生效

```sh
chronyc sources
```

使用 timedatectl ，设置启用 ntp 同步时间，设置时区，设置使用 UTC 时间

```sh
timedatectl set-ntp yes
timedatectl set-timezone Asia/Shanghai
timedatectl set-local-rtc no
systemctl restart systemd-timedated.service
```

使用 date 查看时间

```sh
date --utc
```