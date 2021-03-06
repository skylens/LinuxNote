# CentOS 6 安装升级 `nginx`

## 安装

### 备份！！！备份！！！备份！！！停止服务

### 下载源码包

```bash
# curl -O -L https://nginx.org/download/nginx-1.14.0.tar.gz
# curl -O -L https://ftp.pcre.org/pub/pcre/pcre-8.42.tar.gz
# curl -O -L http://zlib.net/zlib-1.2.11.tar.gz
```

### 安装依赖包

```bash
# tar -xvf pcre-8.42.tar.gz && cd pcre-8.42
# ./configure && make && make install

# tar -xvf zlib-1.2.11.tar.gz && cd zlib-1.2.11
# ./configure && make && make install

```

以及 升级安装 [OpenSSL](openssl.md)

### 安装 nginx

```bash
# ./configure \
--user=nginx \
--groupnginx \
--prefix=/etc/nginx \
--sbin-path=/usr/sbin/nginx \
--conf-path=/etc/nginx/nginx.conf \
--pid-path=/var/run/nginx.pid \
--lock-path=/var/run/nginx.lock \
--error-log-path=/var/log/nginx/error.log \
--http-log-path=/var/log/nginx/access.log \
--with-http_gzip_static_module \
--with-http_stub_status_module \
--with-http_ssl_module \
--with-pcre=../pcre-8.42 \
--with-zlib=../zlib-1.2.11 \
--with-file-aio \
--with-http_realip_module \
--with-http_v2_module \
--with-http_addition_module \
--with-http_sub_module \
--with-http_dav_module \
--with-http_flv_module \
--with-http_mp4_module \
--with-http_gunzip_module \
--with-http_gzip_static_module \
--with-http_auth_request_module \
--with-http_random_index_module \
--with-http_secure_link_module \
--with-http_degradation_module \
--with-http_slice_module \
--with-http_stub_status_module && make && make install
```

### 添加 nginx 用户组及用户

```bash
# groupadd nginx
# useradd nginx -g nginx --no-create-home --shell /sbin/nologin
```

### 添加启动脚本

+ SysVinit

```bash
# vi /etc/init.d/nginx

#!/bin/sh
#
# nginx - this script starts and stops the nginx daemin
#
# chkconfig:   - 85 15
# description:  Nginx is an HTTP(S) server, HTTP(S) reverse \
#               proxy and IMAP/POP3 proxy server
# processname: nginx
# config:      /etc/nginx/nginx.conf
# pidfile:     /var/run/nginx.pid
# user:        nginx

# Source function library.
. /etc/rc.d/init.d/functions

# Source networking configuration.
. /etc/sysconfig/network

# Check that networking is up.
[ "$NETWORKING" = "no" ] && exit 0

nginx="/usr/sbin/nginx"
prog=$(basename $nginx)

NGINX_CONF_FILE="/etc/nginx/nginx.conf"

lockfile=/var/run/nginx.lock

start() {
    [ -x $nginx ] || exit 5
    [ -f $NGINX_CONF_FILE ] || exit 6
    echo -n $"Starting $prog: "
    daemon $nginx -c $NGINX_CONF_FILE
    retval=$?
    echo
    [ $retval -eq 0 ] && touch $lockfile
    return $retval
}

stop() {
    echo -n $"Stopping $prog: "
    killproc $prog -QUIT
    retval=$?
    echo
    [ $retval -eq 0 ] && rm -f $lockfile
    return $retval
}

restart() {
    configtest || return $?
    stop
    start
}

reload() {
    configtest || return $?
    echo -n $"Reloading $prog: "
    killproc $nginx -HUP
    RETVAL=$?
    echo
}

force_reload() {
    restart
}

configtest() {
  $nginx -t -c $NGINX_CONF_FILE
}

rh_status() {
    status $prog
}

rh_status_q() {
    rh_status >/dev/null 2>&1
}

case "$1" in
    start)
        rh_status_q && exit 0
        $1
        ;;
    stop)
        rh_status_q || exit 0
        $1
        ;;
    restart|configtest)
        $1
        ;;
    reload)
        rh_status_q || exit 7
        $1
        ;;
    force-reload)
        force_reload
        ;;
    status)
        rh_status
        ;;
    condrestart|try-restart)
        rh_status_q || exit 0
            ;;
    *)
        echo $"Usage: $0 {start|stop|status|restart|condrestart|try-restart|reload|force-reload|configtest}"
        exit 2
esac

# chmod +x /etc/init.d/nginx
```

+ systemd

```sh
vim /usr/lib/systemd/system/nginx.service

[Unit]
Description=nginx - high performance web server
Documentation=https://nginx.org/en/docs/
After=network-online.target remote-fs.target nss-lookup.target
Wants=network-online.target

[Service]
Type=forking
PIDFile=/var/run/nginx.pid
ExecStartPre=/usr/sbin/nginx -t -c /etc/nginx/nginx.conf
ExecStart=/usr/sbin/nginx -c /etc/nginx/nginx.conf
ExecReload=/bin/kill -s HUP $MAINPID
ExecStop=/bin/kill -s TERM $MAINPID

[Install]
WantedBy=multi-user.target
```

### 启动服务

+ SysVinit

```bash
# service nginx start
# chkconfig --add nginx
# chkconfig --level 345 nginx on
```

+ systemd

```bash
# systemctl start nginx
# systemctl enable nginx
# systemctl status nginx
```

## 配置


## 参考

[官方源码安装配置指南](https://www.nginx.com/resources/guide/installing-nginx-open-source/)
[https://www.digitalocean.com/community/tutorials/how-to-compile-nginx-from-source-on-a-centos-6-4-x64-vps](https://www.digitalocean.com/community/tutorials/how-to-compile-nginx-from-source-on-a-centos-6-4-x64-vps)
