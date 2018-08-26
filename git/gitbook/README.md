# GitBook 

[官方文档](https://toolchain.gitbook.com/)

## GitBook 环境搭建

### Ubuntu 下环境搭建

GitBook 依赖于 JavaScript 先安装 JavaScript 环境

```bash
$ sudo apt-get install nodejs npm
$ sudo ln -s /usr/bin/nodejs /usr/bin/node
```

GitBook 安装

```bash
$ sudo npm install -g gitbook
$ sudo npm install -g gitbook-cli
```

初始化一本书 

```bash
$ gitbook init ./BookName
```

启动服务，浏览器验证(浏览器输入 `http://localhost:4000` 或者 `http:// ip :4000`)

```bash
$ cd BookName/
$ gitbook serve
```

编译成 html 静态文件

```bash
$ cd BookName
$ gitbook build ./ /usr/share/nginx/html/ --gitbook=3.2.2
```

编译成 epub、mobi 文件

```bash
$ gitbook epub ./ ./mybook.epub
$ gitbook mobi ./ ./mybook.mobi
```

epub 文件转 pdf

```bash
ebook-convert mybook.epub mybook.pdf
```