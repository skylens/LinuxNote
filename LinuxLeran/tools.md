# linux 下的一些工具

## **scrot** 截屏工具

```
$ scrot '%Y-%m-%d_$wx$h_scrot.png' -e 'mv $f ~/Picture/shots/'		//截取的图片放到 Picture/shots/ 中
```

## **gwenview** 看图工具

```
$ gwenview >/dev/null
```

## **xrandr** 更改分辨率

```
$ xrandr -s 0	//回复到初始值
$ xrandr -q	//查看支持哪些分辨率
$ xrandr -s 1920x1080	//设置分辨率为1920x1080
```
