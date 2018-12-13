#!/bin/sh

yum makecache all
yum groupinstall 'Development Tools' -y
yum install wget vim nano mosh -y
wget http://www.zlib.net/zlib-1.2.11.tar.gz
wget https://www.openssl.org/source/openssl-1.0.2q.tar.gz
wget http://www.linux-pam.org/library/Linux-PAM-1.3.0.tar.gz
wget http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-7.9p1.tar.gz
systemctl stop firewalld
setenforce permissive
tar -xvf zlib-1.2.11.tar.gz && cd zlib-1.2.11
./configure && make && make install
cd
tar -xvf openssl-1.0.2q.tar.gz && cd openssl-1.0.2q
./config --prefix=/usr --shared && make && make install
cd
tar -xvf Linux-PAM-1.3.0.tar.gz && cd Linux-PAM-1.3.0
./configure --prefix=/usr --sysconfdir=/etc --libdir=/usr/lib --disable-regenerate-docu --enable-securedir=/lib/security --docdir=/usr/share/doc/Linux-PAM-1.3.0
make && make install
cd
tar -xvf openssh-7.9p1.tar.gz && cd openssh-7.9p1
./configure --prefix=/usr --sysconfdir=/etc/ssh --with-pam-dir=/usr --with-pam --with-zlib --with-md5-passwords --with-ssl-dir=/usr
make && make install
cp sshd_config /etc/ssh/sshd_config
systemctl restart sshd
echo "=================="
openssl version
echo "=================="
ssh -V
echo "=================="
