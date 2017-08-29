# 时间同步设置

## ubuntu 

### ubuntu 默认使用 timesyncd 

```
$ sudo timedatectl set-ntp on  //启用timeyncd
$ sudo timedatectl set-ntp no  //关闭timesyncd
$ timedatectl list-timezones   //查看时区列表
$ sudo timedatectl set-timezone Asia/Shanghai  //修改时区为Asia/Shanghai
```

### ubuntu 使用 ntpd

```
$ sudo timedatectl set-ntp no  //关闭timesyncd
$ timedatectl  //验证timesyncd是否关闭
$ sudo apt-get install ntp  //安装ntp
$ sudo ntpq -p  //查询ntpd的状态信息
```