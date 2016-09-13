#!/bin/bash
# ping 主机 , 判断主机是否异常

ping -c 3 -i 0.2 -W 3 $1 &>/dev/null
if  [ $? -eq 0 ]
then
  echo "host $1 is up!"
else
  echo "host $1 is down!"
fi 
