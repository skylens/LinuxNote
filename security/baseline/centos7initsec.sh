#!/bin/bash

# systemctl stop firewalld 
# setenforce 0
# sed -i 's#SELINUX=enforcing#SELINUX=disabled#g' /etc/selinux/config

# 时间同步问题
# https://www.pool.ntp.org/zone/cn
timedatectl
timedatectl set-timezone Asia/Shanghai
timedatectl set-ntp true

# 使用 SSH 远程登录
service sshd restart
systemctl enable sshd 

# 用户、IP段访问控制
# echo -e "sshd:210.13.218.*:allow\nsshd:222.77.15.*:allow" >> /etc/hosts.allow && cat /etc/hosts.allow | grep -v "^#"

 # echo "sshd:all" >> /etc/hosts.deny && cat /etc/hosts.deny | grep -v "^#"

# 限制一些默认用户登录
# cat /etc/passwd

unusefullusers=(daemon bin sys adm uucp nuucp lpd imnadm ipsec ldap lp nobody snapp invscout)

for((i=0;i<${#unusefullusers[@]};i++)) do
	#${#unusefullusers[@]}获取数组长度用于循环
	# usermod -L 锁定用户 
	passwd -l ${unusefullusers[i]};
done;

# 限制 root 登录
# cat /etc/securetty
# sed -i "s/^#PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config 有什么区别？

sed -i "s/^console.*/console=\/dev\/tty01/g" /etc/securetty

# 口令策略
# cat /etc/login.defs | grep "PASS_" | grep -v "^#"

sed -i "s/^PASS_MAX_DAYS.*/PASS_MAX_DAYS   90/g" /etc/login.defs
sed -i "s/^PASS_MIN_DAYS.*/PASS_MIN_DAYS   1/g" /etc/login.defs
sed -i "s/^PASS_MIN_LEN.*/PASS_MIN_LEN    8/g" /etc/login.defs
sed -i "s/^PASS_WARN_AGE.*/PASS_WARN_AGE   28/g" /etc/login.defs

# 设置为连续输错 5 次，密码帐号锁定 3 分钟(180秒)
# 一定要插入到第一行？
# cat /etc/pam.d/system-auth | grep "unlock_time=180"

sed -i '9i\auth     required      pam_tally.so onerr=fail deny=5 unlock_time=180' /etc/pam.d/system-auth

# 密码复杂度设置（包含大小写字母、特殊字符和数字）
# 密码必须至少包含一个大写字母（ucredit），一个小写字母（lcredit），一个数字（dcredit）、一个标点符号（ocredit）和有0个字符与旧密码不同（difok）
# 最小长度为8（minlen）、修改密码失败次数3次（retry）、try_first_pass
sed -i '16i\password     requisite      pam_cracklib.so try_first_pass retry=3 ucredit=-1 lcredit=-1 dcredit=-1 ocredit=-1 minlen=8' /etc/pam.d/system-auth

awk -F: '($2 == "") { print $1 }' /etc/shadow

# 设置登录超时
# cat /etc/profile | grep TMOUT

echo "TMOUT=600" >> /etc/profile

# 禁止FTP用户
# cat /etc/ftpusers

touch /etc/ftpusers && chmod 644 /etc/ftpusers

denyftpusers=(root daemon bin sys adm lp uucp nobody)

for((i=0;i<${#denyftpusers[@]};i++)) do
	#${#denyftpusers[@]}获取数组长度用于循环
	echo ${denyftpusers[i]} >> /etc/ftpusers;
done;

# 确保只有 UID 为 0 的用户是 root
awk -F: '($3 == 0) { print $1 }' /etc/passwd

# 检查 root 是否包含父目录
echo $PATH | egrep '(^|:)(\.|:|$)'

# 检查
# 有小问题 PATH 中多了
find `echo $PATH | tr ':' ' '` -type d \( -perm -002 -o -perm -020 \) -ls

# 限制 root 用户 ssh 登录

sed -i "s/^#PermitRootLogin.*/PermitRootLogin no/g" /etc/ssh/sshd_config

service sshd restart

# 日志与审计

# kern.warning;*.err;authpriv.none\\t@loghost
# *.info;mail.none;authpriv.none;cron.none\t@loghost
# *.emerg\t@loghost
# local7.*\t@loghost

chmod 400 /etc/rsyslog.conf

# 禁用不必要的系统服务

necessaryservices=(vsftpd sendmail xinetd)

for((i=0;i<${#necessaryservices[@]};i++)) do
	#${#necessaryservices[@]}获取数组长度用于循环
	services ${necessaryservices[i]} stop;
	chkconfig --level 35 ${necessaryservices[i]} off;
done;

# umask 权限

echo "umask 022" >> /etc/profile

# 敏感文件安全保护
# ls -al /etc/passwd /etc/shadow /etc/group

chown root: /etc/passwd 
chown root: /etc/shadow
chown root: /etc/group 
chmod 644 /etc/passwd /etc/group 
chmod 400 /etc/shadow

# root 操作历史
# 原来是 1000 条，现在改为 5 条
# cat /etc/profile | grep HISTSIZE

sed -i "s/^HISTSIZE.*/HISTSIZE=5/g" /etc/profile

# 
source /etc/profile
