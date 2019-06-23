# PXE 网络启动

1、生成 bootx64.efi

```bash
grub2-mkstandalone -d /usr/lib/grub/x86_64-efi/ -O x86_64-efi –modules=”tftp net efinet linux part_gpt efifwsetup” -o bootx64.efi
```

2、usb pxe
