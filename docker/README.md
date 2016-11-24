# Docker Learn！

#### docker 安装

######[ubuntu 安装](https://docs.docker.com/engine/installation/linux/ubuntulinux/)	

以 ubuntu 14.04 为例

```shell
$ sudo apt-get update
$ sudo apt-get install apt-transport-https ca-certificates
$ sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
$ sudo echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list
$ sudo apt-get update
$ sudo apt-get install docker-engine
$ sudo service docker start
$ sudo docker run hello-world
```

[其他类型的Linux系统安装](https://docs.docker.com/engine/installation/linux/)


####docker 安装脚本

[官方](https://get.docker.com/)

[阿里云](http://acs-public-mirror.oss-cn-hangzhou.aliyuncs.com/docker-engine/interne)



#### docker 命令

​	