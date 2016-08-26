## 拷贝进度条

> **```cp```**拷贝没有进度条
> **```rsync```**本地拷贝有进度显示

```
rsync -vh --progress test.mp4 test/
#-v, --verbose 详细模式输出 
#-h 人性化
#--progress 在传输时现实传输过程
```
