# seafile 私人云盘

## Debian jessie 下安装

```
# sudo apt-get install mysql-server python-imaging python-mysqldb python-setuptools
# sudo mkdir /home/seafile/
# sudo chown username:username /home/seafile/
# cd /home/seafile/
# wget http://download-cn.seafile.com/seafile-server_6.0.5_x86-64.tar.gz
# tar -zxf seafile-server_6.0.5_x86-64.tar.gz
# rm seafile-server_6.0.5_x86-64.tar.gz
# cd seafile-server-6.0.5/
# ./setup-seafile-mysql.sh
# ./seafile.sh start && ./seahub.sh start      //启动服务
// 浏览器查看 端口为 8000
```
