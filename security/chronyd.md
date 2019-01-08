# chronyd 升级

### 安装依赖

```bash
yum install -y gcc make curl wget
```

### 下载源码包

```bash
curl -O https://download.tuxfamily.org/chrony/chrony-3.4.tar.gz
```

### 备份旧程序

+ rpm 包安装程序相关文件位置

```bash
# rpm -ql chrony
/etc/NetworkManager/dispatcher.d/20-chrony
/etc/chrony.conf
/etc/chrony.keys
/etc/dhcp/dhclient.d/chrony.sh
/etc/logrotate.d/chrony
/etc/sysconfig/chronyd
/usr/bin/chronyc
/usr/lib/systemd/ntp-units.d/50-chronyd.list
/usr/lib/systemd/system/chrony-dnssrv@.service
/usr/lib/systemd/system/chrony-dnssrv@.timer
/usr/lib/systemd/system/chrony-wait.service
/usr/lib/systemd/system/chronyd.service
/usr/libexec/chrony-helper
/usr/sbin/chronyd
/usr/share/doc/chrony-3.2
/usr/share/doc/chrony-3.2/COPYING
/usr/share/doc/chrony-3.2/FAQ
/usr/share/doc/chrony-3.2/NEWS
/usr/share/doc/chrony-3.2/README
/usr/share/man/man1/chronyc.1.gz
/usr/share/man/man5/chrony.conf.5.gz
/usr/share/man/man8/chronyd.8.gz
/var/lib/chrony
/var/lib/chrony/drift
/var/lib/chrony/rtc
/var/log/chrony
```

+ 备份

```bash
cp
```

### 编译安装

```bash
tar -xvf chrony-3.4.tar.gz && cd chrony-3.4
./configure --prefix=/usr --sysconfdir=/etc \
--bindir=/usr/bin --sbindir=/usr/sbin \
--docdir=/usr/share/doc/chrony-3.4 \
--chronyvardir=/var/run/chrony \
--with-pidfile=/var/run/chronyd.pid
make && make install
```

### 启动服务测试

```bash
systemctl restart chronyd; systemctl enable chronyd
chronyc sources
timedatectl set-timezone Asia/Shanghai
date
```
