# Windows 

## 挂载 EFI 分区

**以管理员身份运行 `cmd` 或者 `powershell` **

```powershell
diskpart
sel disk 0 (选择第一块磁盘)
list part
sel part x (x为EFI分区分区号）
assign letter=x (x为分配的盘符）
```
