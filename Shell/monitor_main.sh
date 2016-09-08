#!/bin/bash

resettem=$(tput sgr0)
declare -A ssharray
i=0
numbers=""
for script_file in `ls -I "monitor_main.sh" ./`
do
	echo -e "\e[1;35m" "The Script:"${i} '==>' ${resettem} ${script_file}
  	grep -E "^\#Program function" ${script_file}
  	ssharray[$i]=${script_file}
  	numbers="${numbers} | ${i}"
  	i=$((i+1))
done
while true
do
	read -p "Please input a number [ ${numbers} ]:" execshell
	if [[ ! ${execshell} =~ ^[0-9]+ ]];then
		exit 0
	fi
	/bin/bash ./${ssharray[$execshell]}
done
