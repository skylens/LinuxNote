# LDAP Server 

### 编辑 hosts 

```
# vi /etc/hostname
  server.ldap.com
# reboot
```

### 安装

```
# apt-get install slapd ldap-utils
  设置密码 
# vi /etc/ldap/ldap.conf
  BASE	dc=ldap,dc=com
  URI	ldap://localhost:389
# dpkg-reconfigure slapd
(要设置域名 DNS )
# ldapsearch -x

# apt-get install phpldapadmin
# vi /etc/phpldapadmin/config.php

155行
// $config->custom->appearance['custom_templates_only'] = true;

249行
$servers->setValue('server','host','192.168.131.138');

301行
 $servers->setValue('server','base',array('dc=example,dc=com'));

326行
$servers->setValue('login','bind_id','cn=admin,dc=example,dc=com');


```