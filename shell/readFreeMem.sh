#!/bin/bash
free -m
echo
free -m | grep Mem:
echo
free -m | grep Mem: | awk '{print $2}'
echo
total=`free -m | grep Mem: | awk '{print $2}'`
printf "total:\t\t"$total
echo
used=`free -m | grep Mem: | awk '{print $3}'`
free=`free -m | grep Mem: | awk '{print $4}'`
printf "used:\t\t${used}\n"
printf "free:\t\t${free}\n"
[ $free -lt 1024 ] && echo "Insufficient Memory"