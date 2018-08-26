# nodejs

## 设置 npm 源

```bash
npm config set registry http://registry.npm.taobao.org/
npm config set registry https://registry.npmjs.org/
```

## 使用包管理工具安装

```
# sudo apt-get install nodejs
# sudo apt-get install npm
```

## 检查

```
# nodejs -v
v4.2.6
# npm -v
3.5.2
```

## 使用源码安装

+ CentOS 7

  ```bash
  # yum install -y gcc make gcc-c++ openssl-devel wget
  # wget https://nodejs.org/dist/v8.9.4/node-v8.9.4.tar.gz
  # tar -zxvf node-v8.9.4.tar.gz && cd node-v8.9.4
  # ./configure && make && make install
  # node -v
  # npm -v
  ```
