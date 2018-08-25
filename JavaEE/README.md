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

## Windows 10 下设置JDK环境变量

- 新建 `JAVA_HOME` 变量，值为 `C:\Program Files\Java\jdk1.8.0_181` (jdk 的目录)

- `PATH` 变量，添加 `%JAVA_HOME%\bin` 和 `%JAVA_HOME%\jre\bin` (windows 7 两个值之间使用 ; 隔开)

- 新建 `CLASSPATH` 变量，值为 `.;%JAVA_HOME%\lib;%JAVA_HOME%\lib\tools.jar`


