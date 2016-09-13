#!/bin/bash
#批量创建用户 , 所有用户名都放到 users.txt 的文件中 
read -p "enter the users passwd:" PASSWD
for UNAME in `cat users.txt`
do
id $UNAME &>/dev/null
if [[ $? -eq 0 ]] ; then
  echo "Already exits!"
else
  useradd $UNAME &>/dev/null
  echo "$PASSWD" | passwd --stdin $UNAME &>/dev/null
  if [[ $? -eq 0 ]] ; then
    echo "create success!"
  else
    echo "create failure!"
  fi
fi
done
