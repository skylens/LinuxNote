# golang

## 下载安装

+ 下载

[https://golang.google.cn/](https://golang.google.cn/)

+ 安装

```
tar -C /usr/local -xzf go1.12.9.linux-amd64.tar.gz
```

+ 环境变量配置

```
echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile.d/golang.sh
chmod +x /etc/profile.d/golang.sh
source /etc/profile
```

## 编辑器

+ vscode

+ Sublime Text

+ VIM

+ Emacs

+ GoLand

## Hello World

```bash
cat >> main.go << EOF
package main

import "fmt"

func main() {
  fmt.Println("Hello, 世界")
}
EOF
go run main.go
go build main.go
./main
```

## go mod

+ Hello World

```bash
mkdir godemo
go mod init godemo
cd godemo
cat >> main.go << EOF
package main

import "fmt"

func main() {
  fmt.Println("Hello, 世界")
}
EOF
go run main.go
```

+ proxy 设置

```
echo 'export GOPROXY=https://goproxy.io/' >> /etc/profile.d/golang.sh
echo 'export GOPROXY=https://mirrors.aliyun.com/goproxy/' >> /etc/profile.d/golang.sh
source /etc/profile
```
