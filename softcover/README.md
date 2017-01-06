# [softcover 在线文档托管](http://manual.softcover.io/book/)

## ubuntu 下安装 `softcover` 

先安装 [`ruby 和 gem`](../Ruby/README.md) 

```bash
$ sudo gem install softcover
```

检查依赖

```bash
$ softcover check
```

![](../picture/softcover_check.png)

```
Missing dependencies:
  • PhantomJS (http://phantomjs.org/)
      ∟ Put bin/phantomjs version 2 somewhere on your path, e.g., in /usr/local/bin
  • Inkscape (http://inkscape.org/)
  • Calibre (http://calibre-ebook.com/)
      ∟ Enable Calibre command-line tools (http://manual.calibre-ebook.com/generated/en/cli-index.html)
  • KindleGen (http://www.amazon.com/gp/feature.html?ie=UTF8&docId=1000765211)
      ∟ Put the kindlegen executable on your path, e.g., in /usr/local/bin
  • Java (http://www.java.com/en/download/help/index_installing.xml)
  • EpubCheck 4.0.1 (https://github.com/IDPF/epubcheck/releases/download/v4.0.1/epubcheck-4.0.1.zip)
      ∟ Unzip and place epubcheck-4.0.1/ in a directory on your path
```

[Latex (xelatex)](https://www.latex-project.org/get/)

```bash
$ sudo apt-get install texlive-xetex
```

[PhantomJS](http://phantomjs.org/)

```bash
$ sudo apt-get install phantomjs
```

[Calibre](http://calibre-ebook.com/)

```bash
$ sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.py | sudo python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()"
```


`Can't find libcurl or curl/curl.h (runtimeerror) ruby` 错误解决办法

```bash
$ sudo apt-get install libcurl3 libcurl3-gnutls libcurl4-openssl-dev
``` 
