# MySQL 的备份与恢复

### 备份

+ mysqldump

    + 备份整个数据库
    
```bash
mysqldump -h127.0.0.1 -uroot -p123456 --all-databases | gzip > AllDataBasesBackup-.sql.gz

```

### 恢复
