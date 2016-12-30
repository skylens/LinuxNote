# *ArchLinux*

相关链接 

[How to install archlinux on VMwareWorkstation](http://regenerus.com/how-to-install-archlinux-on-vmware-workstation/)

[虚拟机安装Archlinux的简易步骤](http://www.jianshu.com/p/82a40aac52aa)

### cfdisk 分区 

```cfdisk```

分区1: Boot /dev/sda1 

分区2: Sawp /dev/sda2 

分区3: Root /dev/sda3

### 查看分区

```lsblk```

### 格式化分区 

#### 格式化 boot 分区 

```mkfs.ext4 /dev/sda1```  

#### 格式化 swap

```
mkswap /dev/sda2
swapon /dev/sda2
```

#### 格式化主分区 

```mkfs.ext4 /dev/sda3``` 

### 挂载主分区到 /mnt 下面

```mount /dev/sda3 /mnt ```

### 源设置

```
# nano /etc/pacman.d/mirrorlist

##
## Arch Linux repository mirrorlist
## Sorted by mirror score from mirror status page
##

## China
Server = http://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch
Server = http://mirrors.163.com/archlinux/$repo/os/$arch
Server = http://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch
Server = http://mirrors.neusoft.edu.cn/archlinux/$repo/os/$arch
Server = http://mirrors.zju.edu.cn/archlinux/$repo/os/$arch
Server = http://mirrors.xjtu.edu.cn/archlinux/$repo/os/$arch
Server = http://mirror.lzu.edu.cn/archlinux/$repo/os/$arch
Server = http://mirrors.cqu.edu.cn/archlinux/$repo/os/$arch
```

### 安装基本系统

```pacstrap -i /mnt base```

### 安装 Boot Leader

```pacstrap /mnt grub-bios```

###配置系统

```
# genfstab –p /mnt >> /mnt/etc/fstab
# arch-chroot /mnt
# mkinitcpio –p linux
# grub-mkconfig –o /boot/grub/grub.cfg
# grub-install /dev/sda
# passwd
# exit
```

### 卸载 mnt 目录

```umount /mnt```

### 重启

```systemctl reboot```

### 进行一些设置

```
# pacman -S openssh fbterm
# ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime //设置时区
# nano /etc/locale.gen  //修改语言为 en_US.UTF-8

# locale-gen
# localectl set-locale LANG=”en_US.UTF-8”
# dhcpcd eth0 //dhcp获取 IP 地址
# systemctl enable dhcpcd
# vim /etc/hosts.allow
  ...  
  sshd:192.168.1.x:ALLOW
  ...
# vim /etc/ssh/sshd_config
  ...
  PermitRootLogin yes
  ...
# timedatectl status
# timedatectl set-ntp true
# 1
```

