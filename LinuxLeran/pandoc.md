# [Pandoc](http://www.pandoc.org/) Markdown 格式转换

__[pandoc 安装](https://github.com/jgm/pandoc/releases/)__

markdown -> html ```pandoc filename.md -f markdown -t html -s -o filename.html```

markdown -> pdf  ```pandoc filename.md -f markdown -t pdf -s -o filename.pdf 或 pandoc filename.tex -t latex -o filename.pdf```

markdown -> latex ```pandoc filename.md -f markdown -t latex -s -o filename.tex ```

markdown -> docx ``````


# 问题

```
pandoc: Error producing PDF from TeX source.
! LaTeX Error: File `lmodern.sty' not found.

Type X to quit or <RETURN> to proceed,
or enter new name. (Default extension: sty)

Enter file name: 
! Emergency stop.
<read *> 

l.4 \usepackage

Error: pandoc document conversion failed with error 43
Execution halted
```

解决方法

```bash
$ sudo apt-get install lmodern -y
```
