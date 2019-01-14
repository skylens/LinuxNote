# ntp 升级

[http://archive.ntp.org/ntp4/ntp-4.2](http://archive.ntp.org/ntp4/ntp-4.2/)

### 下载软件包

```bash
wget http://archive.ntp.org/ntp4/ntp-4.2/ntp-4.2.8p12.tar.gz
```

### 安装依赖

```bash
yum install gcc gcc-c++ libcap-devel make
```

### 备份原先配置文件

+  rpm 包安装程序相关文件位置

```bash
# rpm -ql ntp
/etc/dhcp/dhclient.d
/etc/dhcp/dhclient.d/ntp.sh
/etc/ntp.conf
/etc/ntp/crypto
/etc/ntp/crypto/pw
/etc/sysconfig/ntpd
/usr/bin/ntpstat
/usr/lib/systemd/ntp-units.d/60-ntpd.list
/usr/lib/systemd/system/ntpd.service
/usr/sbin/ntp-keygen
/usr/sbin/ntpd
/usr/sbin/ntpdc
/usr/sbin/ntpq
/usr/sbin/ntptime
/usr/sbin/tickadj
/usr/share/doc/ntp-4.2.6p5
/usr/share/doc/ntp-4.2.6p5/COPYRIGHT
/usr/share/doc/ntp-4.2.6p5/ChangeLog
/usr/share/doc/ntp-4.2.6p5/NEWS
/usr/share/man/man5/ntp.conf.5.gz
/usr/share/man/man5/ntp_acc.5.gz
/usr/share/man/man5/ntp_auth.5.gz
/usr/share/man/man5/ntp_clock.5.gz
/usr/share/man/man5/ntp_decode.5.gz
/usr/share/man/man5/ntp_misc.5.gz
/usr/share/man/man5/ntp_mon.5.gz
/usr/share/man/man8/ntp-keygen.8.gz
/usr/share/man/man8/ntpd.8.gz
/usr/share/man/man8/ntpdc.8.gz
/usr/share/man/man8/ntpq.8.gz
/usr/share/man/man8/ntpstat.8.gz
/usr/share/man/man8/ntptime.8.gz
/usr/share/man/man8/tickadj.8.gz
/var/lib/ntp
/var/lib/ntp/drift
/var/log/ntpstats
```

+ 备份

```bash
cp -ar /etc/ntp{,.bak}
cp /etc/ntp.conf{,.bak}
cp /etc/init.d/ntpd{,.bak}
cp /etc/sysconfig/ntpd{,.bak}
cp /etc/sysconfig/ntpdate{,.bak}
```

### 卸载 ntp 及 ntpdate (非必须)

```bash
yum erase ntp ntpdate
```

### 编译安装

```bash
tar -xvf ntp-4.2.8p12.tar.gz && cd ntp-4.2.8p12
install -v -m710 -o ntp -g ntp -d /var/lib/ntp
./configure --prefix=/usr \
--bindir=/usr/sbin \
--sysconfdir=/etc \
--enable-linuxcaps \
--with-lineeditlibs=readline \
--docdir=/usr/share/doc/ntp-4.2.8p12 \
--enable-all-clocks \
--enable-parse-clocks \
--enable-clockctl && make && make install
```

### 重新拷贝会原来配置文件

```bash
cp /etc/init.d/ntpd.bak /etc/init.d/ntpd
cp /etc/sysconfig/ntpd.bak /etc/sysconfig/ntpd
cp /etc/sysconfig/ntpdate.bak /etc/sysconfig/ntpdate
mv /etc/ntp.bak /etc/ntp
cp /etc/ntp.conf.bak /etc/ntp.conf
```

### 启动服务，并测试

```bash
/etc/init.d/ntpd start
ntpd --help
ntpq -p
```
