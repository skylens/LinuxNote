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

+ 文件内容差异对比方法

  * 两个字符串的差异对比

  ```
  #!/usr/bin/env python
  #coding:utf-8

  import difflib
  text1 = """text1:  #定义字符串1
  This module provides classes and functions for comparing sequences.
  including HTML and context and unidied diffs.
  difflib document v7.4
  add string
  """
  text1_lines = text1.splitlines()  # 以行进行分隔,以便进行对比
  text2 = """text2:   # 定义字符串2
  This module provides classes and function for Comparing sequences.
  including HTML and context and unified diffs.
  difflib document v7.5"""
  text2_lines = text2.splitlines()
  d = difflib.Differ()  #创建Differ()对象
  diff = d.compare(text1_lines, text2_lines)  #采用compare方法对字符串进行比较
  print '\n'.join(list(diff))
  ```

  采用HtmlDiff()类的make_file()方法生成HTML文档

  ```
  d = difflib.Differ()  
  diff = d.compare(text1_lines, text2_lines)
  print '\n'.join(list(diff))
  ```

  替换为

  ```
  d = difflib.HtmlDiff()
  print d.make_file(text1_lines, text2_lines)
  ```

* 对比 ndinx 配置文件的差异

  ```
  #!/usr/bin/env python
  #cosing:utf-8

  import difflib
  import sys

  try:
  	textfile1=sys.argv[1]
  	textfile2=sys.argv[2]
  except Exception,e:
  	print "Error:"+str(e)
  	print "Usage: simple9.py filename1 filename2"
  	sys.exit()

  def readfile(filename):
  	try:
  		fileHandle = open (filename, 'rb')
  		text=fileHandle.read().splitlines()
  		fileHandle.close()
  		return text
  	except IOError as error:
  		print ('Read file Error:'+str(error))
  		sys.exit()
  if textfile1=="" or textfile2=="":
  	print "Usage : simaple9.py filename1 filename2"
  	sys.exit()

  text1_lines = readfile(textfile1)
  text2_lines = readfile(textfile2)

  d = difflib.HtmlDiff()
  print d.make_file(text1_lines,text2_lines)
  ```

  运行

  ```
  python simaple9.py nginx.conf1 nginx.conf2 > /var/www/html/nginx_1.html
  ```

+ 文件目录差异对比

  * 
