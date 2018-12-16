#!/bin/sh

managerIPaddress='192.168.149.130'
echo 'Install cobbler Server.....'
yum clean all
yum makecache all
echo 'Start install.....'
yum install -y dhcp tftp-server xinetd httpd cobbler cobbler-web pykickstart
rpm -qa | grep -E "dhcp|tftp-server|xinetd|httpd|cobbler|cobbler-web|pykickstart"
# tftp config
cp /etc/xinetd.d/tftp{,.ori}
sed -i '/disable/c\\tdisable\t\t\t= no' /etc/xinetd.d/tftp
# sed -i -e 's/\=\ yes/\=\ no/g' /etc/xinetd.d/rsync
cp /etc/cobbler/settings{,.ori}
sed -i 's/next_server: 127.0.0.1/next_server: $managerIPaddress/g' /etc/cobbler/settings
sed -i 's/server: 127.0.0.1/server: $managerIPaddress/g' /etc/cobbler/settings
sed -i 's/manage_dhcp: 0/manage_dhcp: 1/g' /etc/cobbler/settings
sed -i 's/pxe_just_once: 0/pxe_just_once: 1/g' /etc/cobbler/settings
