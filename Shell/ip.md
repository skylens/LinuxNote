# IP

## 获取操作系统的局域网IP

```bash
$ hostname -I

$ ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | tail -1 | cut -d: -f2 | awk '{ print $1}'
```

## 获取公网IP

```bash
$ curl icanhazip.com

$ curl -s http://ipecho.net/plain
```
