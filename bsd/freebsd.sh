#!/bin/sh

pkg install mosh wget tmux bash automake
chsh -s /bin/bash
portsnap fetch extract update
cd /usr/ports/security/libsodium
make install clean
cd /usr/ports/security/mbedtls
make install clean
cd /usr/ports/dns/udns
make install clean
cd /usr/ports/devel/libev
make install clean
wget https://github.com/shadowsocks/shadowsocks-libev/releases/download/v3.0.8/shadowsocks-libev-3.0.8.tar.gz
cd shadowsocks-libev-3.0.8
./configure --disable-documentation
make
make install
