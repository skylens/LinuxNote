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
  from IPy import IP

  ip_s = raw_input('Please input an IP or net-range: ')
  ips = IP(ip_s)
  if len(ips) > 1:
          print('net: %s' % ips.net())
          print('netmask: %s' % ips.netmask())
          print('broadcast: %s' % ips.broadcast())
          print('reverse address: %s' % ips.reverseNames() [0])
          print('subnet: %s' % len(ips))
  else:
          print('reverse address: %s' % ips.reverseNames() [0])
          print('hexadecimal: %s' % ips.strHex())
          print('binary ip: %s' % ips.strBin())
          print('iptype: %s' % ips.iptype())
  ```

  ```
  代码解释
  #!/usr/bin/env python
  from IPy import IP

  #接收用户输入，参数为IP地址或网段地址
  ip_s = raw_input('Please input an IP or net-range: ')
  ips = IP(ip_s)
  # 为一个网络地址
  if len(ips) > 1:
    #输出网络地址
    print('net: %s' % ips.net())
    #输出网络掩码地址
    print('netmask: %s' % ips.netmask())
    #输出网络广播地址
    print('broadcast: %s' % ips.broadcast())
    #输出地址反向解析
    print('reverse address: %s' % ips.reverseNames() [0])
    #输出网络子网数
    print('subnet: %s' % len(ips))
  #为单个IP地址
  else:
    #输出IP反向解析
    print('reverse address: %s' % ips.reverseNames() [0])
  #输出十六进制地址
  print('hexadecimal: %s' % ips.strHex())
  #输出二进制地址
  print('binary ip: %s' % ips.strBin())
  #输出地址类型
  print('iptype: %s' % ips.iptype())
  ```
