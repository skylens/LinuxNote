# Docker Learn！

#### docker 安装

+ 默认安装

```sh
curl -sSL get.docker.com | sh
```

+ 指定镜像源

```sh
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh --mirror Aliyun
```

#### 设置加速地址

```sh
curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s https://registry.docker-cn.com
```

#### docker compose 安装

```sh
curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```

#### docker 命令

​	
