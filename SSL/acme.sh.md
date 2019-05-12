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
acme.sh --issue --dns -d *.readdemo.com -d readdemo.com \
--yes-I-know-dns-manual-mode-enough-go-ahead-please
```

### 更新证书



### 吊销证书
