# 校验文件

## macOS 软件

```sh
brew install md5sha1sum
```

## MD5

```sh
md5sum test.zip
md5sum -c test.zip.md5
```

## SHA （默认 sha-1 ）

```sh
shasum test.zip
shasum -c test.zip.sha
```