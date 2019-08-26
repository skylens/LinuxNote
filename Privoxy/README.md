# Privoxy

http://www.privoxy.org/sf-download-mirror/

## 将 macOS 上的 ShadowSocks 代理共享给其他设备

+ 修改配置文件

/usr/local/etc/privoxy/config

```
.
.
.
       forward-socks5t   /               127.0.0.1:1086 .
.
.
.
listen-address  0.0.0.0:8118
```

+ 启动服务

```
# 进入 Privoxy 开启关闭脚本的文件
cd /Applications/Privoxy
# 开启 Privoxy:
sudo ./startPrivoxy.sh
# 关闭 Privoxy:
sudo ./stopPrivoxy.sh
```
