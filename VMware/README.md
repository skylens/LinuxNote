## VMware

### 安装

+ 下载

Linux

```
$ wget https://download3.vmware.com/software/wkst/file/VMware-Workstation-Full-12.1.1-3770994.x86_64.bundle  //12.1.1
$ wget https://download3.vmware.com/software/wkst/file/VMware-Workstation-Full-12.5.0-4352439.x86_64.bundle  //12.5.0
$ wget https://download3.vmware.com/software/wkst/file/VMware-Workstation-Full-12.5.2-4638234.x86_64.bundle  //12.5.2
$ wget https://download3.vmware.com/software/wkst/file/VMware-Workstation-Full-14.0.0-6661328.x86_64.bundle  //14.0.0
```

Windows 

```
vmware workstation 9 : 
vmware workstation 10 : https://download3.vmware.com/software/wkst/file/VMware-workstation-full-10.0.4-2249910.exe
(1F04Z-6D111-7Z029-AV0Q4-3AEH8)
vmware workstation 11 : https://download3.vmware.com/software/wkst/file/VMware-workstation-full-11.0.0-2305329.exe
(JZ6WK-4529P-HZAA1-9RAG6-33JNR / 5F4EV-4Z0DP-XZHN9-0L95H-02V17) 
vmware workstation 12 pro : https://download3.vmware.com/software/wkst/file/VMware-workstation-full-12.5.7-5813279.exe
vmware workstation 14 pro : https://download3.vmware.com/software/wkst/file/VMware-workstation-full-14.0.0-6661328.exe
vmware workstation 15.0.0 pro : http://download3.vmware.com/software/wkst/file/VMware-workstation-full-15.0.0-10134415.exe
vmware workstation 15.5.0 pro : https://download3.vmware.com/software/wkst/file/VMware-workstation-full-15.5.0-14665864.exe
vmware workstation 15.5.1 pro : https://download3.vmware.com/software/wkst/file/VMware-workstation-full-15.5.1-15018445.exe
```

macOS

```
VMware Fusion 10.1.1 : https://download3.vmware.com/software/fusion/file/VMware-Fusion-10.1.1-7520154.dmg
(
FG3TU-DDX1M-084CY-MFYQX-QC0RD
YZ71K-A0Y1P-48EGY-TQWEC-M7AY0
FV14H-DCG9Q-H84LY-XMXZT-Z3UY8
FF5D2-0RX46-H88KP-7YP7E-Z7KTD
AZ71U-FZX5P-H81ZP-Q4XQX-XVR9A
ZY59H-87W0Q-H84EZ-87MXC-X7HC4
)
VMware Fusion 10.1.3 : https://download3.vmware.com/software/fusion/file/VMware-Fusion-10.1.3-9472307.dmg
VMware Fusion 11.0.0 : https://download3.vmware.com/software/fusion/file/VMware-Fusion-11.0.0-10120384.dmg
(
7HYY8-Z8WWY-F1MAN-ECKNY-LUXYX
)

VMware Fusion 11.1.0 : https://download3.vmware.com/software/fusion/file/VMware-Fusion-11.1.0-13668589.dmg
```

+ 安装

```
$sudo chmod +x VMware-Workstation-Full-12.1.1-3770994.x86_64.bundle
$sudo ./VMware-Workstation-Full-12.1.1-3770994.x86_64.bundle
$ rm -rf *~  //删除目录下的 ~ (切忌不要 rm -rf ~ ,这样会删除但前用户的家目录)
```

+ 输入序列号

12.5.0

```
5A02H-AU243-TZJ49-GTC7K-3C61N
```

12.5.2 

```
FZ5X2-DKYE2-H88TP-3DQZC-YYUG6
CY54K-0DWEP-H89DZ-F4PGX-YFUZ2
ZG1RK-4PZ94-0809Z-2QQNV-Q62W0
ZC55U-2QXDH-M80AZ-CZQZT-XF8A6
AZ398-8MD53-M81RZ-VPM5X-W7AE2
```

14

```
CG54H-D8D0H-H8DHY-C6X7X-N2KG6

ZC3WK-AFXEK-488JP-A7MQX-XL8YF

AC5XK-0ZD4H-088HP-9NQZV-ZG2R4

ZC5XK-A6E0M-080XQ-04ZZG-YF08D

ZY5H0-D3Y8K-M89EZ-AYPEG-MYUA8
```

15

```
YG5H2-ANZ0H-M8ERY-TXZZZ-YKRV8

UG5J2-0ME12-M89WY-NPWXX-WQH88

UA5DR-2ZD4H-089FY-6YQ5T-YPRX6

GA590-86Y05-4806Y-X4PEE-ZV8E0

ZF582-0NW5N-H8D2P-0XZEE-Z22VA

YA18K-0WY8P-H85DY-L4NZG-X7RAD
```

15.5.0

```
ZC10K-8EF57-084QZ-VXYXE-ZF2XF

UF71K-2TW5J-M88QZ-8WMNT-WKUY4

AZ7MK-44Y1J-H819Z-WMYNC-N7ATF

CU702-DRD1M-H89GP-JFW5E-YL8X6

YY5EA-00XDJ-480RP-35QQV-XY8F6

VA510-23F57-M85PY-7FN7C-MCRG0
```

+ 启动VMware

```$ vmware```

### 卸载

```
$ su - root
# vmware-installer -u vmware-workstation  //点下一步进行卸载
```

ESXI 

```bash
https://download2.vmware.com/software/esx/67u3/VMware-VMvisor-Installer-6.7.0.update03-14320388.x86_64.iso
```
