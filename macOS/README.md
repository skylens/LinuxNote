# macOS 配置

### brew list

```bash
ffmpeg
mpg123
fontconfig
htop
p7zip
pandoc
mosh
minicom
tmux
wget
libav
you-get
youtube-dl
unrar
```

### Sublime Text 3

+ setting

```
{
	"default_encoding": "utf-8",
	"font_face": "SFMono-Regular",
	"font_size": 20,
	"ignored_packages":
	[
		"Vintage"
	]
}
```

+ packages

```bash

```

### Atom

```bash
$ 
```

### [adb](https://developer.android.com/studio/releases/platform-tools.html)

```bash
$ wget https://dl.google.com/android/repository/platform-tools-latest-darwin.zip
$ unzip platform-tools-latest-darwin.zip -d ~/ && mv platform-tools ~/.platform-tools
```

### [scrcpy开源Android投屏软件]()

```sh
brew install scrcpy
```

### [osxfuse](https://github.com/osxfuse/osxfuse/releases) + [sshfs](https://osxfuse.github.io/)

```bash
$ brew install sshfs
```

### git && svn

+ git client

```sh
SourceTree
```

+ svn client

```sh
SnailSVN
svnX2
```

### JDK

+ 下载

+ 设置环境变量

```sh
# JDK PATH
JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_172.jdk/Contents/Home"
CLASS_PATH="$JAVA_HOME/lib"
PATH=".;$PATH:$JAVA_HOME/bin"
```