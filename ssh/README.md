# ssh

### ssh

#### 安装

+ CentOS

```sh
sudo yum install -y openssh openssh-server openssh-clients
```

+ Debian/ubuntu


```sh
sudo apt-get install -y openssh-client openssh-server
```

### mosh

#### 安装

+ CentOS 7

```sh
sudo yum install -y mosh
```

+ CentOS 6

```sh
sudo yum install -y https://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
sudo yum --enablerepo=epel install -y mosh
```

+ Debian/ubuntu

```sh
sudo apt-get install mosh -y
```
