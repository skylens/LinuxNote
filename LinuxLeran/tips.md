
### shell 脚本

#### read 的小技巧

1.从用户接受参数，可以使用 Backspace 删除输入的内容，达到修改的目的

```bash
read -e -p "请输入一个名字" name
echo $name
```

2.如果不加'-e'参数，需要按住 'ctrl' 键再按 Backspace 才能删除输入的内容，来修改你想输入的内容

```bash
read -p "请输入一个名字" name
echo $name
```

3.当我需要输入不回显的内容时，需要加 '-s' 参数

```bash
read -s -p "请输入一个名字" name
echo $name
```
