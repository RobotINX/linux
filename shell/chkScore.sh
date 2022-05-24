#!/bin/bash
#author:RobotINX
#测试输入的数字在哪个区间
read -p "Enter your score (0-100) : " grade
if [ $grade -gt 100 ] || [ $grade -lt 0 ]
then
    echo "$grade is illegal"
elif [ $grade -le 100 ] && [ $grade -ge 85 ]
then
    echo "$grade is Excellent"
elif [ $grade -le 84 ] && [ $grade -ge 70 ]
then
    echo "$grade is Pass"
else
    echo "$grade is Fail"
fi