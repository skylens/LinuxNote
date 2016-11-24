# oh-my-zsh 很好用的shell

### linux 上 oh-my-zsh 的简单配置

```shell
$ sudo apt-get install git zsh
$ git clone https://github.com/robbyrussell/oh-my-zsh.git
$ cd oh-my-zsh/tools/
$ sh install.sh
```

#####对于而言，我比较喜欢默认的配置，但是除了默认的主题和插件外，还有一些其他的插件和主题不需要，所以删除这些多余的文件

```shell
$ cd .oh-my-zsh/
$ rm -rf .git* README.md LICENSE.txt
$ cd themes/
$ rm -rf !(robbyrussell.zsh-theme)
$ cd ../plugins
$ rm -rf !(git*)
```
