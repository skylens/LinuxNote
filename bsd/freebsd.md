# FreeBSD 

## 使用 `pkg` 安装软件

```sh
pkg install mosh
```

## 使用 `ports` 安装软件

+ 安装 `ports`

```sh
portsnap fetch
portsnap extract
portsnap upadte
```

或

```sh
portsnap fetch extract update
```

+ 安装软件

```sh
whereis mosh
mosh:/usr/ports/lang/mosh
```

```sh
cd /usr/ports/lang/mosh
make install clean
```

## 更改 `shell` 为 `bash`

```sh
whereis bash
bash: /bin/bash /usr/local/man/man1/bash.1.gz /usr/ports/shells/bash

chsh -s /bin/bash
```

退出重新登录，完成更改

## 安装 `shadowsocks-livbe`

```sh
cd /usr/ports/security/libsodium
make install clean
cd /usr/ports/security/mbedtls
make install clean
cd /usr/ports/dns/udns
make install clean
cd /usr/ports/devel/libev
make install clean
```

```sh
wget https://github.com/shadowsocks/shadowsocks-libev/releases/download/v3.0.8/shadowsocks-libev-3.0.8.tar.gz
tar -xvf shadowsocks-libev-3.0.8.tar.gz
cd shadowsocks-libev-3.0.8
./configure --disable-documentation
make
make install
```

修改配置文件 `config.json`

```json
{
  "server":"0.0.0.0",
  "server_port":9443,
  "local_address":"127.0.0.1",
  "local_port":1080,
  "password":"passworld",
  "timeout":600,
  "method":"chacha20"
}
```

启动服务

```sh
ss-server -c /etc/ss-livbe/config.json -v
```
