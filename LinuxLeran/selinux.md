# SELinux

临时关闭SELinux

```sh
/usr/sbin/setenforce 0
```

永久关闭SELinux

```sh
sed -i 's/^SELINUX=.*/#&/;s/^SELINUXTYPE=.*/#&/;/SELINUX=.*/a SELINUX=disabled' /etc/sysconfig/selinux
```

