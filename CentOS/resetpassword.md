### 重置 CentOS 的密码

+ `rd.break`

1. 启动系统，并在 `GRUB2` 启动屏显时，按下 `e` 键进入编辑模式

2. 找到 `linux16` 开头的地方，在末尾添加 `rd.break console=tty0`，按 `ctrl + x` 进入单用户模式

3. `mount -o remount,rw /sysroot ` 重新再挂载文件系统

4. `chroot /sysroot ` 

5. `echo redhat|passwd -stdin root`

6. `touch /.autorelabel `

7. `ctrl + d`

8. `reboot`

+ `init`

1. 启动系统，并在 `GRUB2` 启动屏显时，按下 `e` 键进入编辑模式

2. 找到 `linux16` 开头的地方，在末尾添加 `init=/bin/sh`，按 `ctrl + x` 进入单用户模式

3. `mount –o remount,rw /`

4. `echo redhat|passwd –stdin root`

5. `touch /.autorelabel `

6. `ctrl + d`

7. `reboot`
