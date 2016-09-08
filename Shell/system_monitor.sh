#!/bin/bash
clear

if [ $# -eq 0 ] ;then
# Define variable reset_terminal
reset_terminal=$(tput sgr0)
#Check OS Type
	os=$(uname -o)
	echo -e '\E[32m' "Check OS Type:" $reset_terminal $os
#Check OS Release Version and Name
	os_name=$(cat /etc/issue|grep -e "Server")
	echo -e '\E[32m' "Check OS Release Version and Name:" $reset_terminal $os_name
#Check Architecture
	architecture=$(uname -m)
	echo -e '\E[32m' "Check Architecture:" $reset_terminal $architecture
#Check Kernel Release
	kernelrelease=$(uname -r)
	echo -e '\E[32m' "Check Kernel Release:" $reset_terminal $kernelrelease
#Check hostname
	#echo $HOSTNAME
	hostname=$(uname -n)
	echo -e '\E[32m' "Check hostname:" $reset_terminal $hostname
#Check if connected to Internet or not
	ping -c 3 www.163.com &>/dev/null && echo "Internet:Conneted" || echo "Internet:Disconnected"
#Check Internal IP
  internalip=$(hostname -I)
  echo -e '\E[32m' "Check Internal IP:" $reset_terminal $internalip
#Check External IP
  externalip=$(curl -s http://ipecho.net/plain)
  echo -e '\E[32m' "Check External IP:" $reset_terminal $externalip
#Check DNS
  nameservers=$(cat /etc/resolv.conf |grep -E "\<nameserver[ ]+"|awk '{print $NF}')
  echo -e '\E[32m' "Check DNS:" $reset_terminal $nameservers
#Check Logged In Users
  who>/tmp/who
  echo -e '\E[32m' "Check Logged In Users:" $reset_terminal && cat /tmp/who
  rm -rf /tmp/who
fi
