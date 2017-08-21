## Debian 下的 VMware Workstation Pro

### 安装

+ 下载

```
$ wget https://download3.vmware.com/software/wkst/file/VMware-Workstation-Full-12.1.1-3770994.x86_64.bundle  //12.1.1
$ wget https://download3.vmware.com/software/wkst/file/VMware-Workstation-Full-12.5.0-4352439.x86_64.bundle  //12.5.0
$ wget https://download3.vmware.com/software/wkst/file/VMware-Workstation-Full-12.5.2-4638234.x86_64.bundle  //12.5.2
```
windows 

```
vmware workstation 9 : 
vmware workstation 10 : https://download3.vmware.com/software/wkst/file/VMware-workstation-full-10.0.4-2249910.exe
(1F04Z-6D111-7Z029-AV0Q4-3AEH8)
vmware workstation 11 : https://download3.vmware.com/software/wkst/file/VMware-workstation-full-11.0.0-2305329.exe
(JZ6WK-4529P-HZAA1-9RAG6-33JNR / 5F4EV-4Z0DP-XZHN9-0L95H-02V17) 
vmware workstation 12 pro : https://download3.vmware.com/software/wkst/file/VMware-workstation-full-12.5.7-5813279.exe
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

+ 启动VMware

```$ vmware```

### 卸载

```
$ su - root
# vmware-installer -u vmware-workstation  //点下一步进行卸载
```
