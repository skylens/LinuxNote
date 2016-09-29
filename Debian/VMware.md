## Debian 下的 VMware Workstation Pro

### 安装

+ 下载

```
$ wget https://download3.vmware.com/software/wkst/file/VMware-Workstation-Full-12.1.1-3770994.x86_64.bundle  //12.1.1
$ wget https://download3.vmware.com/software/wkst/file/VMware-Workstation-Full-12.5.0-4352439.x86_64.bundle  //12.5.0
windows https://download3.vmware.com/software/wkst/file/VMware-workstation-full-12.5.0-4352439.exe
```

+ 安装

```
$sudo chmod a+x VMware-Workstation-Full-12.1.1-3770994.x86_64.bundle
$sudo ./VMware-Workstation-Full-12.1.1-3770994.x86_64.bundle
```
+ 输入序列号

**```5A02H-AU243-TZJ49-GTC7K-3C61N```**

+ 启动VMware

```$ vmware```

### 卸载

```
$ su - root
# vmware-installer -u vmware-workstation  //点下一步进行卸载
```
