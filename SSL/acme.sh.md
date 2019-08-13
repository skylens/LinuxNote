# acme.sh

### 安装

```sh
curl https://get.acme.sh | sh && source ~/.bash_profile
```

### 卸载

```bash
acme.sh --uninstall && rm -rf ~/.acme.sh
```

### 申请证书

```sh
acme.sh --issue --dns -d readdemo.com -d *.readdemo.com \
--yes-I-know-dns-manual-mode-enough-go-ahead-please \
--keylength ec-256
```

### 安装证书

```sh
acme.sh --install-cert --ecc -d readdemo.com -d *.readdemo.com \
--key-file /etc/nginx/ssl/privkey.pem \
--fullchain-file /etc/nginx/ssl/fullchain.pem
```

### 更新证书

```sh
acme.sh --renew -d readdemo.com -d *.readdemo.com --force --ecc \
--yes-I-know-dns-manual-mode-enough-go-ahead-please \
--debug
```

### 吊销证书
