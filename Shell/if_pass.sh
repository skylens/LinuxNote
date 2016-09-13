#!/bin/bash
#
read -p "enter your score (0-100) :"GREAD
if [ $GREAD -ge 85 ] && [ $GREAD -le 100 ];then
  echo "$GREAD is excellent!"
elif [ $GREAD -ge 70 ] && [ $GREAD -le 84 ];then
  echo "$GREAD is pass!"
else
  echo "$GREAD is fail!"
fi 
