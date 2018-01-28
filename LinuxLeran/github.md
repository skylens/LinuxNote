#**GitHub 设置及使用**

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
sh-rsa ********************************** your_email@youremail.com
``` 

复制 cat 内容

添加到 github 上的 SSH key 中

测试

```
$ ssh -T git@github.com

Hi youraccount! You've successfully authenticated, but GitHub does not provide shell access.
```

4. 配置 git 

```
$ git config --global user.name "your name" //配置用户名
$ git config --global user.email "your_email@youremail.com" //配置邮箱
$ git config --global color.ui true //开启颜色显示
$ git config --global core.editor emacs //配置你的编缉器
$ git config --global merge.tool vimdiff //配置你的比较工具
```

5. 配置 gitignore

[macOS gitignore](https://github.com/github/gitignore/blob/master/Global/macOS.gitignore)

[Windows gitignore](https://github.com/github/gitignore/blob/master/Global/Windows.gitignore)

[Vim gitignore](https://github.com/github/gitignore/blob/master/Global/Vim.gitignore)

[Emacs gitignore](https://github.com/github/gitignore/blob/master/Global/Emacs.gitignore)

[Xcode gitignore](https://github.com/github/gitignore/blob/master/Global/Xcode.gitignore)

[Tex gitignore](https://github.com/github/gitignore/blob/master/TeX.gitignore)

[Python gitignore](https://github.com/github/gitignore/blob/master/Python.gitignore)

```
cd ~
ls .gitignore
```
