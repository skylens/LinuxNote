# certbot

### 下载

+ wget

```bash
# wget https://dl.eff.org/certbot-auto
# chmod a+x certbot-auto
```


+ git

```bash
# git clone https://github.com/certbot/certbot && cd certbot
```

### Apache(httpd)

+ 安装 httpd mod_ssl

```bash
yum install httpd mod_ssl -y
```

+ 配置虚拟主机(很重要)

```bash
vim /etc/httpd/conf.d/demo.skylens.co.conf

<VirtualHost *:80>
    DocumentRoot "/var/www/html/"
    ServerName demo.skylens.co
    ErrorLog "/var/log/httpd/demo.skylens.co/error_log"
    <Directory /var/www/html/>
      Options Indexes FollowSymlinks
      AllowOverride All
      Require all granted
  </Directory>
</VirtualHost>

echo demo > /var/www/html/test.html
```

+ 取消欢迎页面

```bash
mv /etc/httpd/conf.d/welcome.conf /etc/httpd/conf.d/welcome.conf.bak
```

+ 申请 let's encrypt 证书

```bash
./certbot-auto certonly --manual -d demo.skylens.co --agree-tos --manual-public-ip-logging-ok --preferred-challenges dns-01 --server https://acme-v02.api.letsencrypt.org/directory
```

按照提示到域名解析控制台中添加 `txt` 记录，等待验证完毕

+ 通过 cerbot-auto 自动设置 httpd，不用再次申请，使用刚刚申请的证书即可

```bash
./certbot-auto --apache
```

+ 检查配置，重启服务

```bash
apachectl configtest

systemctl restart httpd
systemctl enable httpd
```

### nginx

+ 安装 nginx

```bash
yum install nginx -y
```

如果是编译安装需添加 openssl 模块支持

+ 申请 let's encrypt 证书

```bash
./certbot-auto certonly --manual -d demo.skylens.co --agree-tos --manual-public-ip-logging-ok --preferred-challenges dns-01 --server https://acme-v02.api.letsencrypt.org/directory
```

+ 生成 dhparam 密钥 (可选)

```bash
openssl dhparam -dsaparam -out /etc/letsencrypt/live/demo.skylens.co/dhparam.pem 4096
```

+ 通过配置虚拟主机

```bash
vim /etc/nginx/conf.d/demo.skylens.co.conf

server {
    listen 80;
    server_name demo.skylens.co;
    return 301 https://$server_name$request_uri;
}
server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    server_name demo.skylens.co;

    ssl on;

    ssl_certificate /etc/letsencrypt/live/demo.skylens.co/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/demo.skylens.co/privkey.pem;

    ssl_prefer_server_ciphers on;
    ssl_dhparam /etc/letsencrypt/live/demo.skylens.co/dhparam.pem;
    ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
    ssl_ciphers 'ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA:ECDHE-RSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-RSA-AES256-SHA256:DHE-RSA-AES256-SHA:ECDHE-ECDSA-DES-CBC3-SHA:ECDHE-RSA-DES-CBC3-SHA:EDH-RSA-DES-CBC3-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:DES-CBC3-SHA:!DSS';
    keepalive_timeout 70;
    ssl_session_cache shared:SSL:10m;
    ssl_session_timeout 10m;

    ssl_buffer_size 8k;

    access_log /var/log/nginx/demo.skylens.co/access.log;
    error_log /var/log/nginx/demo.skylens.co/error.log;

    charset utf-8;
    server_tokens off;

    add_header X-Frame-Options SAMEORIGIN;
    add_header X-Content-Type-Options nosniff;
    add_header X-XSS-Protection "1; mode=block";
    add_header Strict-Transport-Security "max-age=31536000; includeSubdomains;";

    location / {
        root /var/www/html;
        autoindex on;
        autoindex_exact_size off;
		autoindex_format html;
        autoindex_localtime on;
    }
}


mkdir /var/log/nginx/demo.skylens.co/
touch /var/log/nginx/demo.skylens.co/access.log
touch  /var/log/nginx/demo.skylens.co/error.log
```

+ 检查配置，重启服务

```bash
nginx -t

systemctl restart nginx
systemctl enable nginx
```