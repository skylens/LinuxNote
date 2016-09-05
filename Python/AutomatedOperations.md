# 《python自动化运维技术与最佳实践》读书笔记

+ 系统性能信息模块**```psutil```**

    * ```pip``` 安装 ```psutil```

    ```
    # pip install psutil
    ```

    * 源码安装 ```psutil```

    ```
    # wget https://pypi.python.org/packages/78/cc/f267a1371f229bf16db6a4e604428c3b032b823b83155bd33cef45e49a53/psutil-4.3.1.tar.gz
    # tar zxf psutil-4.3.1.tar.gz
    # cd psutil-4.3.1/
    # python setup.py install
    ```
    ...
+ 实用的IP地址处理模块 **```IPy```**

  * ```pip``` 安装 ```IPy```

  ```
  # pip install IPy
  ```

  * 源码安装 ```IPy```

  ```

  ```

  * 示例 根据输入的 IP 或子网掩码返回网络、掩码、广播、反向解析、子网数、IP 类型等信息

  ```
  #!/usr/bin/env python
  #coding:utf8

  from IPy import IP

  ip_s = raw_input('Please input an IP or net-range: ')   #接收用户输入，参数为IP地址或网段地址
  ips = IP(ip_s)
  if len(ips) > 1:   # 为一个网络地址
          print('net: %s' % ips.net())   #输出网络地址
          print('netmask: %s' % ips.netmask())   #输出网络掩码地址
          print('broadcast: %s' % ips.broadcast())   #输出网络广播地址
          print('reverse address: %s' % ips.reverseNames() [0])  #输出地址反向解析
          print('subnet: %s' % len(ips))   #输出网络子网数
  else:
          print('reverse address: %s' % ips.reverseNames() [0])   #输出IP反向解析
          print('hexadecimal: %s' % ips.strHex())   #输出十六进制地址
          print('binary ip: %s' % ips.strBin())   #输出二进制地址
          print('iptype: %s' % ips.iptype())    #输出地址类型
  ```

+ DNS 处理模块 dsnpython

  * A 记录

  ```
  #!/usr/bin/env python
  #coding:utf8

  import dns.resolver

  domain = raw_input('Please inout an domain: ')#输入域名地址
  A = dns.resolver.query(domain,'A')#指定查询类型为A记录
  for i in A.response.answer:
        for j in i.items:
                print j.address
  ```

  * MX 记录

  ```
  #!/usr/bin/env python
  #coding:utf8

  import dns.resolver

  domain = raw_input('Please input an domain: ')
  MX = dns.resolver.query(domain,'MX') #指定查询类型为MX记录
  for i in MX:
	     print 'MX preference =', i.preference, 'mail exchanger =', i.exchange
  ```

  * NS 记录

  ```
  #!/usr/bin/env python
  #coding:utf8

  import dns.resolver

  domain = raw_input('Please input an domain: ')
  ns = dns.resolver.query(domain,'NS') #指定查询类型为NS记录
  for i in ns.response.answer:
        for j in i.items:
                print j.to_text()
  ```

  * CNAME 记录

  ```
  #!/usr/bin/env python
  #coding:utf8

  import dns.resolver

  domain = raw_input('Please input an domain: ')
  cname = dns.resolver.query(domain,'CNAME') #指定查询类型为CNAME记录
  for i in cname.response.answer:  #结果将回应cname后的目标域名
        for j in i.items:
                print j.to_text()

  ```

  *
