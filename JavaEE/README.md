# JavaEE

## Linux 下设置JDK环境变量

```shell
# vi /etc/profile

JAVA_HOME=/opt/jdk/
PATH=$JAVA_HOME/bin:$PATH
CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export JAVA_HOME
export PATH
export CLASSPATH

# 重启生效
```

