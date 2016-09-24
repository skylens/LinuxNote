**#GitHub 设置及使用**

1. 注册 GitHub 账号

2. 安装

```
$ sudo apt-get install git
```

3. 添加 GitHub ssh

```
$ ssh-keygen -t rsa -C "your_email@youremail.com"
$ cd .ssh/
cat id_rsa.pub
sh-rsa ************************************************************************************************************************************************************************************************************************************************************************************ your_email@youremail.com
``` 

复制 cat 内容

添加到 github 上的 SSH key 中

测试

```
$ ssh -T git@github.com

```
Hi youraccount! You've successfully authenticated, but GitHub does not provide shell access.
```

4. 配置 git 

```
$ git config --global user.name "your name" //配置用户名
$ git config --global user.email "your_email@youremail.com" //配置邮箱
```
