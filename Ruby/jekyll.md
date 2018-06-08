# jekyll

### 介绍

[jekyll](https://jekyllrb.com/) 是一款简单的使用 `ruby` 语言开发的静态网页生成器。

### 通过 `[docker](../docker/)` 来使用 `jekyll` 

+ 从远程仓库拉取镜像

```bash
docker pull jekyll/jekyll
```

+ [启动服务](https://github.com/envygeeks/jekyll-docker/blob/master/README.md)

```bash
git clone https://github.com/skylens/skylens.github.io.git && cd skylens.github.io
export JEKYLL_VERSION=3.8 ; docker run --rm --volume="$PWD:/srv/jekyll" -p 8000:4000 \
-it jekyll/builder:$JEKYLL_VERSION jekyll serve
```