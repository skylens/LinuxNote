# 搭建 RHCE 模拟环境

#### httpd

```sh
yum install -y httpd
```

#### ldap

yum install openldap compat-openldap openldap-clients openldap-servers openldap-servers-sql openldap-devel

cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG

chown ldap. /var/lib/ldap/DB_CONFIG

systemctl start slapd
systemctl status slapd
systemctl enable slapd


```sh
slappasswd
New password:
Re-enter new password: redhat
{SSHA}XXadscFmVaieB+Cu7tBgm09YdsePZcYX

centos7
New password:
Re-enter new password:
{SSHA}lGEIPEP8XJh3UjlfzZJ/bWyEERryD1l+
```

ldapadd -x -D cn=Manager,dc=example,dc=com -W -f basedomain.ldif
ldapadd -x -D cn=Manager,dc=example,dc=com -W -f ldapuser.ldif