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

```bash
# mkfs.vfat -F32 /dev/sda1
```

#### 格式化 swap

```bash
# mkswap /dev/sda2
# swapon /dev/sda2
```

#### 格式化主分区 

```bash
# mkfs.ext4 /dev/sda3
```

### 挂载分区到 /mnt 下面

```bash
# mount /dev/sda3 /mnt
# cd /mnt
# mkdir boot && cd boot
# mkdir efi
# cd
# mount /dev/sda1 /mnt/boot/efi
```



### 源设置

```bash
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

```bash
# pacstrap -i /mnt base base-devel
```

### 配置系统

```bash
# genfstab –p /mnt >> /mnt/etc/fstab
# arch-chroot /mnt
# nano /etc/locale.gen   # 去掉en_US.UTF-8,zh_CN.GB18030,zh_CN.UTF-8前面 的注释
# locale-gen
# echo "LANG=en_US.UTF-8" > /etc/locale.conf
# mkinitcpio –p linux
```

### gurb安装

#### grub(UEFI)

```bash
# pacman -S grub-bios efibootmgr dosfstools os-prober 
# grub-mkconfig –o /boot/grub/grub.cfg
# grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=arch_grub --recheck --debug
```

#### grub(非UEFI)

```bash
# pacman -S grub-bios os-prober
# grub-mkconfig –o /boot/grub/grub.cfg
# grub-install /dev/sda
```

### 设置密码退出

```bash
# passwd
# exit
```

### 卸载挂载 的所有分区

```bash
# umount -R /mnt
```

### 重启

```bash
# reboot
```

### 设置

```bash
# pacman -S openssh fbterm net-tools vim 
# ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime //设置时区
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
```

