# CentOS 6 升级 OpenSSH 7.6p1

1. 关闭防火墙及 selinux

   ```bash
   service iptables stop
   setenforce 0
   ```

2. 安装 telnet ，升级时 SSH 连接会断开，所以使用 telnet 进行远程连接

   ```bash
   wget https://mirrors.aliyun.com/centos/6.10/os/x86_64/Packages/xinetd-2.3.14-40.el6.x86_64.rpm
   wget https://mirrors.aliyun.com/centos/6.10/os/x86_64/Packages/telnet-server-0.17-48.el6.x86_64.rpm
   
   rpm -ivh xinetd-2.3.14-40.el6.x86_64.rpm
   rpm -ivh telnet-server-0.17-48.el6.x86_64.rpm
   
   vim /etc/xinetd.d/telnet
   
   disable         = no
   
   service xinetd restart
   ```

3. 下载源码包

   https://cloudflare.cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/

   https://www.openssl.org/source/old/

4. 安装依赖 zlib 及 pam-devel

   ```bash
   curl -O https://zlib.net/zlib-1.2.11.tar.gz
   ./configure --prefix=/usr/local/zlib && make && make install
   ```

5. 卸载旧版本的 OpenSSH 及 OpenSSL

   ```bash
   rpm -e --nodeps `rpm -qa|grep openss` 
   ```

6. 升级 OpenSSL 至 1.0.2m

   ```bash
   tar -xvf openssl-1.0.2m.tar.gz && cd openssl-1.0.2m
   ./config --prefix=/usr --shared && make && make install
   
   ln -s /usr/lib64/libcrypto.so.1.0.0 /usr/lib64/libcrypto.so.10
   ln -s /usr/lib64/libssl.so.1.0.0 /usr/lib64/libssl.so.10
   ```

7. 升级 OpenSSH 至 7.6p1

   ```bash
   tar -xvf openssh-7.6p1.tar.gz && cd openssh-7.6p1
   ./configure --prefix=/usr --sysconfdir=/etc/ssh --with-pam --with-zlib --with-md5-passwords && make && make install
   
   cp contrib/redhat/sshd.pam /etc/pam.d/sshd.pam
   cp contrib/redhat/sshd.init /etc/init.d/sshd
   
   vim /etc/ssh/sshd_config
   ...
   PermitRootLogin yes
   
   PasswordAuthentication yes
   ...
   
   service sshd restart
   ```
