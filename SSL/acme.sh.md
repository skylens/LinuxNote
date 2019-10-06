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

+ RSA

```sh
~/.acme.sh/acme.sh --issue --dns \
-d readdemo.com -d *.readdemo.com \
--yes-I-know-dns-manual-mode-enough-go-ahead-please
```

+ ECC

```sh
~/.acme.sh/acme.sh --issue --dns \
-d readdemo.com -d *.readdemo.com \
--yes-I-know-dns-manual-mode-enough-go-ahead-please \
--keylength ec-256
```

### 安装证书

+ RSA

```sh
~/.acme.sh/acme.sh --install-cert \
-d readdemo.com -d *.readdemo.com \
--key-file /tmp/privkey.pem \
--fullchain-file /tmp/fullchain.pem
```

+ ECC

```sh
~/.acme.sh/acme.sh --install-cert --ecc \
-d readdemo.com -d *.readdemo.com \
--key-file /tmp/privkey.pem \
--fullchain-file /tmp/fullchain.pem
```

### 更新证书

+ RSA

```sh
~/.acme.sh/acme.sh --renew --force \
-d readdemo.com -d *.readdemo.com \
--yes-I-know-dns-manual-mode-enough-go-ahead-please \
--debug
```

+ ECC

```sh
~/.acme.sh/acme.sh --renew --force --ecc \
-d readdemo.com -d *.readdemo.com \
--yes-I-know-dns-manual-mode-enough-go-ahead-please \
--debug
```

### 吊销证书

+ RSA

```sh
~/.acme.sh/acme.sh --revoke --force \
-d readdemo.com -d *.readdemo.com \
--yes-I-know-dns-manual-mode-enough-go-ahead-please \
--debug
```

+ ECC

```sh
~/.acme.sh/acme.sh --revoke --ecc \
-d readdemo.com -d *.readdemo.com \
--yes-I-know-dns-manual-mode-enough-go-ahead-please \
--debug
```