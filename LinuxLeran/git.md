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

# ** `git' 服务器**

[user manual](https://www.kernel.org/pub/software/scm/git/docs/user-manual.html)

```bash
$ 
```
