# **`git`使用**

### 本地创建项目，推送到代码托管平台

注：`emacs.d` 为项目名称;`git@git.coding.net:skylens/emacs.d.git` 为代码托管平台的地址，采用ssh的方式

```bash
mkdir emacs.d
cd emacs.d
git init
echo "# emacs.d" >> README.md
git add README.md
git commit -m "first commit"
git remote add origin git@git.coding.net:skylens/emacs.d.git
git push -u origin master
```

### `git`子模块

[子模块](https://git-scm.com/book/zh/v1/Git-%E5%B7%A5%E5%85%B7-%E5%AD%90%E6%A8%A1%E5%9D%97)

```bash
git submodule add git://github.com/chneukirchen/rack.git rack
```

# **`git`服务器**

[user manual](https://www.kernel.org/pub/software/scm/git/docs/user-manual.html)

### Apache2 user_dir + git

1. 初始化一个仓库

```bash
$ cd /home/you/public_html/
$ mkdir proj
$ git --bare init
$ git --bare update-server-info
$ mv hooks/post-update.sample hooks/post-update
```

2. 使用 `git clone` 拉取到本地 (http方式只可以pull，ss方式可以pull和push) 

```bash
$ git clone http://yourserver.com/~you/proj
$ git clone ssh://you@yourserver.come/home/you/public_html/proj
```

3. Tips

a. 打包源代码

```bash
$ cd proj
$ git archive --format zip --output ../proj.zip master
$ git archive HEAD --format=zip > ../proj.zip
```

b. 使用原生的 `git` 协议来做 `git clone`

```bash
$ git daemon --reuseaddr --base-path=/home/you/public_html/ /home/you/public_html/
$ cd proj
$ touch git-daemon-export-ok
```

c. 有时候不能 `git push`,在服务器端这么做

```bash
$ git config --bool core.bare true
```
