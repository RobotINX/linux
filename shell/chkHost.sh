#!/bin/bash
#author:RobotINX
#测试是否能与指定的主机进行通信
echo $1
ping -c 4 -i 0.2 -W 3 $1 > ./test/get
if [ $? -eq 0 ]
then
    echo "Host $1 is On-line"
else
    echo "Host $1 is Off-line"
fi