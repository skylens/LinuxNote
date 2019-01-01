# SSH

## 向远程主机注入公钥

```bash
ssh-copy-id -i ~/.ssh/id_rsa.pub user@hostname
```

## ssh-kegen 删除 know_hosts 中的主机

```sh
ssh-kegen -R root@192.168.1.1

ssh-kegen -R root@github.io
```

## 动态端口映射

[参考](https://blog.csdn.net/chenjh213/article/details/49795521)

```bash
ssh -NfD 1080 user@hostname
ps aux | grep ssh   //查看进程
kill 1234    //结束进程
```

# mosh

防火墙需开放6000-61000的udp端口

```sh
firewall-cmd --permanent --zone=public --add-port=60000-61000/udp && firewall-cmd --reload 
```
