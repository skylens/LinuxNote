#**检查服务器性能的10条命令

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
