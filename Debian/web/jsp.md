# Ti's about jsp !

+ 安装 openjdk-8 及 tomcat8

```
$ sudo apt-get install openjdk-8-jdk openjdk-8-jre
$ sudo apt-get install tomcat8
```

+ tomcat8 的配置文件所在目录

```
# cd /var/lib/tomcat8/webapps/ROOT/     //放网页的目录
# cp mysql-connector-java-5.1.39-bin.jar /usr/share/tomcat8/lib/      //复制 mysql jdbc驱动到lib目录,以便于 jsp 连接数据库
# /etc/init.d/tomcat8 restart   //添加了 mysql jdbc驱动, 需要重启 tomcat8 服务, 否则不生效
```

+ 安装 php 及 mysql

```
$ sudo aptitude install php5 php5-mysql libapache2-mod-php5
$ sudo aptitude install mysql-server mysql-client
```
