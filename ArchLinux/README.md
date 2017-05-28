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
# dhcpcd eth0 //dhcp获取 IP 地址
# systemctl enable dhcpcd
# pacman -S openssh fbterm net-tools vim tmux 
```

#### 时间

```bash
# ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime //设置时区
# hwclock --systohc --utc #将硬件时间设置为 UTC 
# hwclock --systohc --localtime #将硬件时间设置为 localtime
# 命令自动生成 /etc/adjtime

```

#### X-window

```bash
# pacman -S xorg-server xorg-server-utils xorg-xinit xf86-input-synaptics xf86-video-intel 
# pacman -S xorg-xinit xorg-server xorg-server-utils 
# pacman -S xf86-input-synaptics xf86-input-elographics xf86-input-keyboard 
```

####  声音

```bash
# pacman -S alsa-utils
```

#### 回收站机制及windows盘挂载

```bash
# pacman -S gvfs
```

#### 启动器

```bash
# pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
# systemctl enable lightdm
```

#### 网络

```bash
# pacman -S networkmanager #主程序
# pacman -S networkmanager-openconnect #支持VPN（也可选networkmanager-openvpn/networkmanager-pptp/networkmanager-vpnc任意一个）
# pacman -S rp-pppoe #支持 PPPoE/DSL 连接
# systemctl start NetworkManager.service #立即启动 NetworkManager
# systemctl enable NetworkManager.service #开机自动启用 NetworkManager
```

### 输入法

```bash
# pacman -S fcitx fcitx-im fcitx-cloudpinyin fcitx-configtool fcitx-googlepinyin fcitx-qt5
```

#### 解压软件

```bash
# pacman -S p7zip file-roller unrar
```

#### gksu

```bash
# pacman -S gksu
```

#### 其它设置

```bash
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

