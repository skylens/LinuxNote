# Archlinux 常用命令

### `pacman` 包管理

```bash
$ pacman -S package_name         //安装 package_name 
$ pacman -S extra/package_name   //安装不同仓库里的 package_name 
$ pacman -R package_name         //删除 package_name 
$ pacman -Rs pckage_name         //删除指定 package_name，及其所有没有被其他已安装软件包使用的依赖关系
$ pacman -Q                      //询本地软件包数据库
$ pacman -Ss string              //在包数据库中查询关键字 string 有关的包
$ pacman -Si                     //显示包详细的信息
$ pacman -Qi                     //查询本地安装包的详细信息
$ pacman -Ql                     //获取已安装软件包所包含文件的列表
pacman -Sy      //更新源
$
```
