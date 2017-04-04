# ```linux shellscript```

## 注意空格

if 于 [ 之间的空格

! 于 - 之间的空格

## 网络相关的命令

+ `ifconfig`
   
   * 打印网络接口列表(`cut`提取每一行的前10个字符)
   ```bash
   $ ifconfig | cut -c -10 | tr -d ' ' | tr -s '\n'
   ``` 
   
   * 硬件地址欺骗(MAC地址)
   ```bash
   $ sudo ifconfig eth0 hw ether 00:1c:bf:87:25:d5
   ```
+ `DNS`查找

   * `host`
   ```bash
   $ host www.google.com
   ```

   * `nslookup`
   ```bash
   $ nslookup www.google.com
   ```
	
+ `route`显示路由表(包含关于分组如何转发以及通过网络中的哪些节点转发信息)
  ```bash
  $ route  // "-n" 以数字形式显示地址
  ```

+ `traceroute`
  ```bash
  $ traceroute www.google.com
  ```
## 慕课网

+ [```monitor_main.sh```](https://github.com/skylens/LinuxNote/tree/master/Shell/monitor_main.sh)

+ [```system_monitor.sh```](https://github.com/skylens/LinuxNote/tree/master/Shell/system_monitor.sh)
