#!/bin/bash
Path=/root/test
[ -d $Path ] || mkdir $Path
for i in `seq 1000000`
do
#     char=`echo $RANDOM|md5sum|cut -c 2-11|tr[0-9] [a-j]`   #//md5sum 加密   
     touch $Path/${i}_mon.html
done
