#!/bin/bash
#判断是否有目录 /media/cdrom , 没有则创建 /media/cdrom
DIR="/media/cdrom"
if [ ! -e $DIR ]
then
mkdir -p $DIR
fi

#另一种表示方法
#DIR="/media/cdrom"
#if [[ ! -e $DIR ]];then
#  mkdir -p $DIR
#fi

#其他的表示方式
#DIR="/media/cdrom"
#if [ ! -e $DIR ];then
#  mkdir -p $DIR
#fi 
