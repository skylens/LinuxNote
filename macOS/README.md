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

### chrome

```sh
wget https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg
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

### VS Code


### [adb](https://developer.android.com/studio/releases/platform-tools.html)

```bash
$ wget https://dl.google.com/android/repository/platform-tools-latest-darwin.zip
$ unzip platform-tools-latest-darwin.zip -d ~/ && mv platform-tools ~/.platform-tools
```

### [scrcpy开源Android投屏软件](https://github.com/Genymobile/scrcpy)

```sh
brew install scrcpy
```

### [osxfuse](https://github.com/osxfuse/osxfuse/releases) + [sshfs](https://osxfuse.github.io/)

```bash
$ brew install sshfs
```

### [Mounty](http://enjoygineering.com/mounty/)

```sh
wget http://enjoygineering.com/mounty/releases/Mounty.dmg
```

### git && svn

+ git client

[SourceTree](https://www.sourcetreeapp.com)

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

### 允许任何来源

```sh
sudo spctl --master-disable
```

### gpg

+ gpg

```sh
brew install gnupg

```

+ [gpg tools](https://gpgtools.org/)

### lrzsz 设置

```sh
brew install lrzsz
git clone https://github.com/mmastrac/iterm2-zmodem.git
cp iterm2-zmodem/*.sh /usr/local/bin/
```

### wechat 小助手

```sh
cd ~/Downloads && rm -rf WeChatPlugin-MacOS && git clone https://github.com/TKkk-iOSer/WeChatPlugin-MacOS.git --depth=1 && ./WeChatPlugin-MacOS/Other/Install.sh
```

### MS Office 2016

[Suite Install (Word / Excel / PowerPoint / Outlook / OneNote / MAU) 16.11.1 [18031100] 64-bit](https://go.microsoft.com/fwlink/?linkid=525133)

[Word Standalone 16.11.1 [18031100] 64-bit](https://go.microsoft.com/fwlink/?linkid=525134)

[Excel Standalone 16.11.1 [18031100] 64-bit](https://go.microsoft.com/fwlink/?linkid=525135)

[PowerPoint Standalone 16.11.1 [18031100] 64-bit](https://go.microsoft.com/fwlink/?linkid=525136)

[Outlook Standalone 16.11.1 [18031100] 64-bit](https://go.microsoft.com/fwlink/?linkid=525137)

[OneNote Standalone 16.11.1 [18031100] 64-bit](https://go.microsoft.com/fwlink/?linkid=820886)

[Microsoft AutoUpdate (MAU) 3.17.18031100 64-bit](https://go.microsoft.com/fwlink/?linkid=830196)

### [Visual Studio](https://www.visualstudio.com/zh-hans/vs/mac/)

### [JetBrains Toolbox](https://www.jetbrains.com/toolbox/download/#section=mac)

### [snipaste 截图](https://zh.snipaste.com/)

### [壁纸 pap.er](http://paper.meiyuan.in/)

### [NextCloud](https://nextcloud.com/install/#install-clients)

### [CheatSheet](https://www.mediaatelier.com/CheatSheet/)

### [Real VNC](https://www.realvnc.com/en/connect/download/viewer/)

### [opera neon](https://www.opera.com/zh-cn/computer/neon)

### 日志文件阅读

[lnav](http://lnav.org/)

```sh
brew install lnav
```

### [IINA 开源 MPV 播放器](https://lhc70000.github.io/iina/)

### [BaiduPCS go 版 百度云部限速](https://github.com/iikira/BaiduPCS-Go)

