# Alibaba Cloud Linux Kernel

```bash
sudo cat >> /etc/yum.repos.d/alinux-2.1903-plus.repo << EOF
[plus]
name=Alibaba Cloud Linux 2.1903 Plus Software Collections
baseurl=http://mirrors.aliyun.com/alinux/2.1903/plus/x86_64/
enabled=1
gpgcheck=1
gpgkey=http://mirrors.aliyun.com/alinux/RPM-GPG-KEY-ALIYUN
EOF
sudo yum install -y kernel kernel-devel kernel-headers
```
