# KVM

## ubuntu 安装 KVM

```bash
$ sudo apt-get install -y qemu-kvm qemu-system 
$ sudo apt-get install -y libvirt-bin ubuntu-vm-builder 
$ sudo apt-get install -y bridge-utils kvm virtinst virt-manager
```

## centos 安装 KVM

```bash
$ sudo yum install -y qemu-kvm python-virtinst 
$ sudo yum install -y virt-manager virt-top
$ sudo yum install -y virt-viewer libvirt libvirt-client
```

## 运行

```bash
$ qemu-system-x86_64 -m 1024 -hdc root_disk.img -vnc 0.0.0.0:0
``` 

## 用`virsh`查看虚拟机

```bash
$ virsh -c qemu:///system list
```

[windows 驱动](https://fedoraproject.org/wiki/Windows_Virtio_Drivers)

[获取OS镜像](http://docs.openstack.org/image-guide/obtain-images.html)