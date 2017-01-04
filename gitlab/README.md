# GitLab

## CentOS 7 安装 `GitLab`

[官方文档](https://about.gitlab.com/downloads/#centos7)

安装 `GitLab`

```bash
sudo yum install curl policycoreutils openssh-server openssh-clients
sudo systemctl enable sshd
sudo systemctl start sshd
sudo yum install postfix
sudo systemctl enable postfix
sudo systemctl start postfix
sudo firewall-cmd --permanent --add-service=http
sudo systemctl reload firewalld
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sudo bash
sudo yum install gitlab-ce
```

配置并启动 `GitLab`

```bash
sudo gitlab-ctl reconfigure
```
