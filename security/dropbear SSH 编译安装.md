# dropbear SSH 编译安装

1. 下载

   ```bash
   curl -O https://matt.ucc.asn.au/dropbear/releases/dropbear-2018.76.tar.bz2
   ```

2. 安装

   ```bash
   tar -xvf dropbear-2018.76.tar.bz2 && cd dropbear-2018.76
   ./configure --prefix=/usr/local/dropbear && make && make install
   mkdir /etc/dropbear
   /usr/local/dropbear/bin/dropbearkey -t rsa -s 2048 -f /etc/dropbear/dropbear_rsa_host_key
   ```

3. 启动服务

   ```bash
   /usr/local/dropbear/sbin/dropbear -p 1213
   netstat -tunlp
   ```

4. 停止服务

   ```bash
   ps aux | grep dropbear
   kill 进程号
   ```
