# KVM

  安装 KVM
 -CentOS/Fedora: yum install qemu-kvm
 -Ubuntu/Debian: apt-get install qemu-kvm
 -获取源码：https://github.com/qemu/qemu/releases


 使用
 -获取 OS 镜像
 -http://docs.openstack.org/image-guide/obtain-images.html

 运行
 -qemu-system-x86_64 -m 1024 -hdc root_disk.img -vnc 0.0.0.0:0 ( :0 代表 vnc 端口 5900)

 -qemu-system-x86_64 -m 1024 -hdc cirros-0.3.4-x86_64-disk.img -vnc 0.0.0.0:2180 --no-kvm(:2180 代表 启动 80 端口)


 查看宿主机支持CPU硬件虚拟化
 -Intel:cat /proc/cpuinfo | grep vmx
 -AMD:cat /proc/cpuinfo | grep svm

 启用kvm内核模块
 -kvm.ko & kvm_intel.ko | kvm_amd.ko

 qemu/kvm启动参数
 -qemu-system-x86_64 -enable-kvm ...

 查看宿主机支持内存硬件虚拟化
 -Intel:cat /proc/cpuinfo | grep ept
 -AMD:cat /proc/cpuinfo | grep npt

 启用kvm内核模块
 -kvm.ko & kvm_intel.ko | kvm_amd.ko

 qemu/kvm启动参数
 -qemu-system-x86_64 -enable-kvm
