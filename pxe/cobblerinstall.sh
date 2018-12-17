#!/bin/sh

echo 'Install cobbler Server.....'
yum clean all
yum makecache all
echo 'Start install.....'
yum install -y dhcp tftp-server xinetd httpd cobbler cobbler-web pykickstart fence-agents debmirror
rpm -qa | grep -E "dhcp|tftp-server|xinetd|httpd|cobbler|cobbler-web|pykickstart|fence-agents|debmirror"
systemctl start httpd cobblerd xinetd rsyncd
systemctl enable httpd cobblerd xinetd rsyncd
# tftp config
cp /etc/xinetd.d/tftp{,.ori}
sed -i '/disable/c\\tdisable\t\t\t= no' /etc/xinetd.d/tftp
systemctl restart xinetd
# sed -i -e 's/\=\ yes/\=\ no/g' /etc/xinetd.d/rsync
cp /etc/cobbler/settings{,.ori}
sed -i 's/allow_dynamic_settings: 0/allow_dynamic_settings: 1/g' /etc/cobbler/settings
systemctl restart cobblerd
cobbler setting edit --name=server --value=192.168.149.143
cobbler setting edit --name=next_server --value=192.168.149.143
cobbler setting edit --name=default_password_crypted --value=`openssl passwd -1 -salt 'cobblerAsdadAD' 'redhat'`
# get loaders
cobbler get-loaders
# signature
cobbler signature update
# debmirror config
sed -i -e 's/@dists=/#@dists=/g' /etc/debmirror.conf
sed -i -e 's/@arches=/#@arches=/g' /etc/debmirror.conf
# cobblerd restart
systemctl restart cobblerd
cobblerd check
# mkdir dir
mkdir -vp /mnt/centos/{7,6}
mkdir -pv /mnt/debian
mkdir -pv /mnt/ubuntu
mkdir -pv /mnt/suse
mkdir -vp /mnt/exsi/{6.7,6.5,6.0}

# uefi(每次sync之后都要修改)
##################################################################
# sed -ri 's/^(timeout=).*/\160/' /var/lib/tftpboot/grub/efidefault
# sed -ri 's/^(default=).*/\11/' /var/lib/tftpboot/grub/efidefault
##################################################################

# example
#################################################################
# mount -t iso9660 -o ro /dev/cdrom /mnt/centos/7
# cobbler import --path=/mnt/centos/7 --name=CentOS-7 --arch=x86_64
# cobbler profile add --name=CentOS-7-x86_64 --distro=CentOS-7-x86_64
# 
# mount -t iso9660 -o ro /dev/cdrom /mnt/centos/6
# cobbler import --path=/mnt/centos/6 --name=CentOS-6 --arch=x86_64
# cobbler profile add --name=CentOS-6-x86_64 --distro=CentOS-6-x86_64 
#
# mount -t iso9660 -o ro /dev/cdrom /mnt/exsi/6.5/
# cobbler import --path=/mnt/exsi/6.5 --name=exsi6.5 --arch=x86_64
# cobbler profile add --name=exsi6.5-x86_64 --distro=exsi6.5-x86_64
#
# 添加失败之后仍然还有残留文件，手动到这个目录删除对应残留的内容
# /var/www/cobbler/ks_mirror
#################################################################