#检查服务器性能的10条命令

```
$ uptime
 22:55:53 up  3:19,  2 users,  load average: 0.00, 0.01, 0.05
```

(作用:查看机器的负载情况)

```
$ dmesg | tail
[ 6183.733212] e1000: eth0 NIC Link is Down
[ 6189.749698] e1000: eth0 NIC Link is Up 1000 Mbps Full Duplex, Flow Control: None
[ 7601.997278] e1000: eth0 NIC Link is Down
[ 7608.016023] e1000: eth0 NIC Link is Up 1000 Mbps Full Duplex, Flow Control: None
[ 7714.333631] e1000: eth0 NIC Link is Down
[ 7720.351641] e1000: eth0 NIC Link is Up 1000 Mbps Full Duplex, Flow Control: None
[ 8516.740571] e1000: eth0 NIC Link is Down
[ 8520.752878] e1000: eth0 NIC Link is Up 1000 Mbps Full Duplex, Flow Control: None
[ 8572.912551] e1000: eth0 NIC Link is Down
[ 8576.925192] e1000: eth0 NIC Link is Up 1000 Mbps Full Duplex, Flow Control: None
```

(作用:输出系统日志的最后10行)

```
$ vmstat 1
procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
 0  0     48  15532  65696 268524    0    0    14    55   21   41  0  0 99  0  0
 0  0     48  15508  65696 268516    0    0     0     0   30   14  0  6 94  0  0
 0  0     48  15508  65696 268516    0    0     0     0   19   22  0  1 99  0  0
 0  0     48  15508  65696 268516    0    0     0     0   13   18  0  1 99  0  0
 0  0     48  15508  65696 268516    0    0     0     0   19   22  0  1 99  0  0
 0  0     48  15508  65696 268516    0    0     0     0   13   16  0  0 100  0  0
 0  0     48  15508  65704 268512    0    0     0    12   22   27  0  1 99  0  0
 0  0     48  15508  65704 268516    0    0     0     0   11   12  0  0 100  0  0
 0  0     48  15508  65704 268516    0    0     0     0   18   23  0  0 100  0  0
 0  0     48  15508  65704 268516    0    0     0     0   13   14  0  0 100  0  0
 0  0     48  15508  65704 268516    0    0     0     0   19   28  0  0 100  0  0
^C
```

(作用:每一行会输出系统的核心指标)

```
$ mpstat -P ALL 1
Linux 3.16.0-4-amd64 (VM) 	2016年09月24日 	_x86_64_	(1 CPU)

23时03分20秒  CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
23时03分21秒  all    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00
23时03分21秒    0    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00

23时03分21秒  CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
23时03分22秒  all    0.00    0.00    0.99    0.00    0.00    0.00    0.00    0.00    0.00   99.01
23时03分22秒    0    0.00    0.00    0.99    0.00    0.00    0.00    0.00    0.00    0.00   99.01

23时03分22秒  CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
23时03分23秒  all    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00
23时03分23秒    0    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00
^C

平均时间:  CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
平均时间:  all    0.00    0.00    0.33    0.00    0.00    0.00    0.00    0.00    0.00   99.67
平均时间:    0    0.00    0.00    0.33    0.00    0.00    0.00    0.00    0.00    0.00   99.67
```

(备注:需要安装)
(作用:显示每个CPU的占用情况)

```
$ pidstat 1
Linux 3.16.0-4-amd64 (VM) 	2016年09月24日 	_x86_64_	(1 CPU)

23时05分03秒   UID       PID    %usr %system  %guest    %CPU   CPU  Command
23时05分04秒     0         7    0.00    0.98    0.00    0.98     0  rcu_sched
23时05分04秒  1000      4048    0.00    0.98    0.00    0.98     0  pidstat

23时05分04秒   UID       PID    %usr %system  %guest    %CPU   CPU  Command
23时05分05秒  1000      3345    0.00    1.01    0.00    1.01     0  sshd
23时05分05秒  1000      4048    0.00    1.01    0.00    1.01     0  pidstat

23时05分05秒   UID       PID    %usr %system  %guest    %CPU   CPU  Command
23时05分06秒  1000      4048    0.00    1.00    0.00    1.00     0  pidstat
^C

平均时间:   UID       PID    %usr %system  %guest    %CPU   CPU  Command
平均时间:     0         7    0.00    0.33    0.00    0.33     -  rcu_sched
平均时间:  1000      3345    0.00    0.33    0.00    0.33     -  sshd
平均时间:  1000      4048    0.00    1.00    0.00    1.00     -  pidstat
```

(作用:输出进程的CPU占用率)

```
$ iostat -xz 1
Linux 3.16.0-4-amd64 (VM) 	2016年09月25日 	_x86_64_	(1 CPU)

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           0.42    0.00    2.65    0.38    0.00   96.55

Device:         rrqm/s   wrqm/s     r/s     w/s    rkB/s    wkB/s avgrq-sz avgqu-sz   await r_await w_await  svctm  %util
sda               8.70     2.21   22.88    1.46   378.74    17.95    32.59     0.06    2.32    1.11   21.26   0.53   1.28

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           0.99    0.00    0.00    0.00    0.00   99.01

Device:         rrqm/s   wrqm/s     r/s     w/s    rkB/s    wkB/s avgrq-sz avgqu-sz   await r_await w_await  svctm  %util

^C
```

(作用:查看机器磁盘IO情况)

```
$ free -m
             total       used       free     shared    buffers     cached
Mem:           480        134        346          4          9         41
-/+ buffers/cache:         83        397
Swap:          879          0        879
```

(作用:查看系统内存的使用情况)

```
$ sar -n DEV 1
Linux 3.16.0-4-amd64 (VM) 	2016年09月25日 	_x86_64_	(1 CPU)

23时00分55秒     IFACE   rxpck/s   txpck/s    rxkB/s    txkB/s   rxcmp/s   txcmp/s  rxmcst/s   %ifutil
23时00分56秒      eth0      0.00      0.00      0.00      0.00      0.00      0.00      0.00      0.00
23时00分56秒        lo      0.00      0.00      0.00      0.00      0.00      0.00      0.00      0.00

23时00分56秒     IFACE   rxpck/s   txpck/s    rxkB/s    txkB/s   rxcmp/s   txcmp/s  rxmcst/s   %ifutil
23时00分57秒      eth0      0.99      0.99      0.06      0.41      0.00      0.00      0.00      0.00
23时00分57秒        lo      0.00      0.00      0.00      0.00      0.00      0.00      0.00      0.00
```

(作用:查看网络设备的吞吐率)

```
$ sar -n TCP,ETCP 1
Linux 3.16.0-4-amd64 (VM) 	2016年09月25日 	_x86_64_	(1 CPU)

23时02分27秒  active/s passive/s    iseg/s    oseg/s
23时02分28秒      0.00      0.00      0.00      0.00

23时02分27秒  atmptf/s  estres/s retrans/s isegerr/s   orsts/s
23时02分28秒      0.00      0.00      0.00      0.00      0.00

23时02分28秒  active/s passive/s    iseg/s    oseg/s
23时02分29秒      0.00      0.00      0.99      0.99

23时02分28秒  atmptf/s  estres/s retrans/s isegerr/s   orsts/s
23时02分29秒      0.00      0.00      0.00      0.00      0.00
```

(作用:查看TCP连接状态)

```
$ top 
top - 23:03:52 up 7 min,  2 users,  load average: 0.00, 0.03, 0.04
Tasks:  64 total,   1 running,  63 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem:    492492 total,   138708 used,   353784 free,     9768 buffers
KiB Swap:   901116 total,        0 used,   901116 free.    43188 cached Mem

   PID USER      PR  NI    VIRT    RES    SHR S %CPU %MEM     TIME+ COMMAND                                                                    
    32 root      20   0       0      0      0 S  0.3  0.0   0:01.62 kworker/0:2                                                                
     1 root      20   0   28492   4584   3084 S  0.0  0.9   0:01.04 systemd                                                                    
     2 root      20   0       0      0      0 S  0.0  0.0   0:00.00 kthreadd                                                                   
     3 root      20   0       0      0      0 S  0.0  0.0   0:00.04 ksoftirqd/0                                                                
     5 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 kworker/0:0H                                                               
     6 root      20   0       0      0      0 S  0.0  0.0   0:00.03 kworker/u256:0                                                             
     7 root      20   0       0      0      0 S  0.0  0.0   0:00.38 rcu_sched                                                                  
     8 root      20   0       0      0      0 S  0.0  0.0   0:00.00 rcu_bh                                                                     
     9 root      rt   0       0      0      0 S  0.0  0.0   0:00.00 migration/0                                                                
    10 root      rt   0       0      0      0 S  0.0  0.0   0:00.00 watchdog/0                                                                 
    11 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 khelper                                                                    
    12 root      20   0       0      0      0 S  0.0  0.0   0:00.00 kdevtmpfs                                                                  
    13 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 netns                                                                      
    14 root      20   0       0      0      0 S  0.0  0.0   0:00.00 khungtaskd                                                                 
    15 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 writeback                                                                  
    16 root      25   5       0      0      0 S  0.0  0.0   0:00.00 ksmd                                                                       
    17 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 crypto

```

(作用:查看系统负载情况, 系统内存使用情况, 系统CPU使用情况, 等 为前面一些命令的汇总)



