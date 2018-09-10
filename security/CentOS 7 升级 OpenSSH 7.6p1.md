# CentOS 7 升级 OpenSSH 7.6p1

1. 安装 telnet ，升级时 SSH 连接会断开，所以使用 telnet 进行远程连接

   ```bash
   yum install -y telnet-server
   yum install -y xinetd
   
   systemctl enable xinetd.service
   systemctl enable telnet.socket
   systemctl start telnet.socket
   systemctl start xinetd
   
   echo 'pts/0' >>/etc/securetty
   echo 'pts/1' >>/etc/securetty
   
   service  xinetd  restart
   ```

2. 下载源码包

   [OpenSSL 链接 https://www.openssl.org/source/old/](https://www.openssl.org/source/old/)

   [OpenSSH 链接 http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/](http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/)

   ```bash
   wget https://www.openssl.org/source/openssl-1.0.2m.tar.gz
   wget http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-7.6p1.tar.gz
   ```

3. 安装依赖包

   ```bash
   yum -y install pam-devel.x86_64 zlib-devel.x86_64
   ```

4. 卸载旧版本的 OpenSSH 及 OpenSSL

   ```bash
   rpm -e --nodeps `rpm -qa|grep openss` 
   ```

5. 升级 OpenSSL 至 1.0.2m

   ```bash
   tar -xvf openssl-1.0.2m.tar.gz && cd openssl-1.0.2m
   ./config --prefix=/usr --shared && make && make install
   
   ln -s /usr/lib64/libcrypto.so.1.0.0 /usr/lib64/libcrypto.so.10
   ln -s /usr/lib64/libssl.so.1.0.0 /usr/lib64/libssl.so.10
   ```

6. 升级 OpenSSH 至 7.6p1 (其实 7.8p1 也是可以的)

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
   systemctl enable sshd
   ```

7. 如果可以的话重启系统测试 SSH 远程是否正常

8. 关闭 telnet 服务

   ```bash
   systemctl stop telnet.socket
   systemctl stop xinetd
   systemctl disable telnet.socket
   systemctl disable xinetd
   ```
