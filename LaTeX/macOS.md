# macOS 

## 安装 MacTex

[USTC CTAN MacTex 下载](http://mirrors.ustc.edu.cn/CTAN/systems/mac/mactex/MacTeX.pkg)

## 更新及安装 [latexmk](http://mg.readthedocs.io/latexmk.html)

[参考](http://jimolonely.github.io/2018/01/12/tools/004-install-texlive/)

```zsh
sudo tlmgr option repository http://mirror.ctan.org/systems/texlive/tlnet
sudo tlmgr update --self
sudo tlmgr install latexmk
```

## 添加环境变量

zsh PATH 加入

```zsh
/Library/TeX/texbin
```

## 安装 fontconfig

```zsh
brew install fontconfig
fc-list -f "%{family}\n"  :lang=zh   //列出中文字体
```

## 安装 [Pygments](http://pygments.org/)

先安装 pip，通过 pip 安装 pygments

```bash
sudo easy_install pip
sudo pip install Pygments
```
