#!/bin/bash
#author:RobotINX
#根据给定的文本内容创建用户
#脚本需要一开始就指定一个文件路径
dir=$1
if [ ! -f ${dir} ]
then
    echo "文件不存在"
    exit
fi
i=1
length=`wc -l $dir | awk '{print $1}'`

echo $length
while [ $i -le $length ]
do
    echo "the No.$i user creating : "
    user=`sed -n "$i,1p" ${dir} | awk '{print $1}'`
    echo $user
    passwd=`sed -n "$i,1p" ${dir} | awk '{print $2}'`
    echo $passwd
    id $user > /dev/null
    if [ $? -eq 1 ]
    then
        useradd $user
        passwd $user
        < $passwd
        < $passwd
    fi
    i=`expr $i + 1`
done