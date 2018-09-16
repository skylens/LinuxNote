# 打印机安全

[参考](https://www.anquanke.com/post/id/86900)

## 打印机发现

+ 网络打印机的默认端口号是 9100

```bash
# nmap -p 9100 --open 192.168.1.0/24
```

+ 其他

```bash
nmap -p 515,631,9100 -oG - 10.81.129.0/24 | gawk '/open/{print $2}' | xargs --delimiter='\n' nmap -sU -p 161 -oG - | gawk '/open/{print $2}' | xargs --replace=$ipaddress snmpget -v 1 -O v -c public $ipaddress system.sysDescr.0 | sed 's/STRING:\s//'
```

+

```bash
nmap -O 192.168.1.1/24 -oG - | grep printer >> outfile
```

+ 

```bash
nmap -p 9100,515,631 192.168.1.1/24 -oX printers.xml
```
