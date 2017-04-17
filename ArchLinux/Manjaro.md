# Manjaro 

`Manjaro`是`Archlinux`的衍生版 

`Manjaro`安装是基于图型界面的，安装起来比和`ubuntu`一样简单，不像`Archlinux`采用命令行来安装，这样来说对于新手来说是不友好的，`Manjaro`则采用图形化的方式来安装，要友好许多！

###设置`sudo`免密码(skylens 为普通用户名)

```bash
$ sudo vim /etc/sudoers.d/skylens
User_Alias      NORMAL = skylens
NORMAL  ALL = NOPASSWD: ALL
$ sudo chmod 0440 /etc/sudoers.d/skylens
```

###安装

推荐英语安装

###修改源和配置`yaourt`

在 `/etc/pacman.d/mirrorlist` 中修改（也可以使用 `grep -A 1 'China' mirrorlist >> mirrorlist ` 把不是中国的源删除）

```bash
## Country       : China
Server = http://mirrors.ustc.edu.cn/manjaro/stable/$repo/$arch
## Country       : China
Server = http://mirrors.tuna.tsinghua.edu.cn/manjaro/stable/$repo/$arch
## Country       : China
Server = http://mirrors.zju.edu.cn/manjaro/stable/$repo/$arch
## Country       : China
Server = https://mirrors.zju.edu.cn/manjaro/stable/$repo/$arch
## Country       : China
Server = ftp://ftp.cuhk.edu.hk/pub/Linux/manjaro/stable/$repo/$arch
## Country       : China
Server = http://ftp.cuhk.edu.hk/pub/Linux/manjaro/stable/$repo/$arch
```

配置`yaourt`

在 `/etc/pacman.conf` 末尾添加

```bash
[archlinuxcn]
#The Chinese Arch Linux communities packages.
SigLevel = Optional TrustAll
Server   = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
```

更新一下源，并安装`archlinuxcn-keyring`和`yaourt`

```bash
$ sudo pacman -S archlinuxcn-keyring
$ sudo pacman -Syu yaourt
```

###安装软件

```bash
$ sudo pacman -S xfce4-terminal git fish unzip zip unrar p7zip file-roller ntfs-3g dosfstools wget emacs 
```

###安装中文字体

```bash
$ sudo pacman -S wqy-bitmapfont wqy-zenhei adobe-source-han-sans-cn-fonts wqy-microhei-lite wqy-microhei noto-fonts-emoji ttf-mac-fonts ttf-droid ttf-ubuntu-font-family ttf-dejavu ttf-monaco 
```

当然也可以把字体文件拷贝到`/usr/share/fonts/TTF/`目录下，然后刷新字体`fc-cache -vf`,适合在linux下使用windows字体

###安装输入法

```bash
$ sudo pacman -S fcitx fcitx-fbterm fctix-googlepinyin fcitx-cloudpinyin
```

###安装主题和图标

```bash
$ sudo pacman -S arc-gtk-theme arch-icons-themes
```

