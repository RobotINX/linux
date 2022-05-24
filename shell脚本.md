# shell脚本

## linux启动过程

- 启动流程

  ``` shell
  BIOS-MBR-BootLoader(grub)-kernel-init-系统初始化-shell
  BIOS：选择主引导记录
  MBR：判断硬盘是否可引导
  grub：选择引导内核
  kernel：启动内核，初始化系统，加载硬件
  init/systemd：1号进程，启动各种服务
  ```

- 各种文件的位置

  ```shell
  #引导mbr
  #确认引导硬盘
  fdisk -l
  #查看引导文件
  dd if=/dev/sda of=/root/Desktop/mbr.bin bs=446 count=1
  #包括磁盘分区表
  dd if=/dev/sda of=/root/Desktop/mbr2.bin bs=512 count=1
  #十六进制的引导信息
  hexdump -C mbr.bin
  
  #grub
  /boot/grub2
  #查看默认引导内核
  grub2-editenv list
  
  #初始化系统化境
  #centos6
  /usr/sbin/init/
  /etc/rc.d/
  #centos7
  /etc/systemd/system/
  /usr/lib/systemd/
  ```

  

## shell脚本的格式

```shell
#开头需要声明脚本执行的程序
#!/bin/bash
#添加执行权限
chmod +x shell.sh
#z执行命令
./shell.sh
```



## 用户配置文件加载顺序

- 资料链接

  ```shell
  https://blog.csdn.net/weixin_46818279/article/details/107416774
  ```

- 涉及的加载文件

  ```shell
  /etc/profile
  /etc/profile.d/*.sh -> /etc/profile.d/lang.sh -> /etc/sysconfig/i18n
  ~/.bash_profile
  ~/.bashrc
  #we're not a login shell
  /etc/bashrc -> /etc/profile.d/*.sh -> /etc/profile.d/lang.sh -> /etc/sysconfig/i18n
  ```

- su - root和su root

  ```shell
  #su - root
  #will expericene a login process
  #改变用户的当前变量，重新读取root用户的环境变量配置
  #su root
  #like you open an interactive shell in root name,
  #then only .bashrc will be sourced
  #不改变用户的当前变量，只能获取权限
  ```

  

## 管道和重定向

### 管道符

### 重定向符号

- 输入重定向

  ```shell
  #<：将指定的文件作为输入
  wc -l < /etc/passwd
  read var < /root/var.txt
  ```

- 输出重定向

  ```shell
  #>：输出重定向，清空原文件的内容
  #>>：输出重定向，追加原文件的内容
  #2>：错误输出重定向，脚本执行的错误信息重定向到文件中
  #&>：无论正确或错误的执行信息，都重定向输出到文件中
  ```

## 变量

- 几种赋值方法

  ```shell
  #直接赋值
  a=123
  #let赋值，shell中尽量不要涉及计算
  let a=123+123
  #将命令赋值
  l=ls
  #将命令结果进行赋值
  let a=$(ls -l /root)
  let a=`ls -l /root`
  #特殊字符赋值
  #''无转义字符
  dir='/root'
  #""有转义字符
  dir="/root"
  ```

- 变量的引用

  ```shell
  #一般写法
  echo $string
  #操作变量
  echo hello ${string}
  ```

- 变量的范围

  ```shell
  #导出变量
  export string
  ```

- 删除变量

  ```shell
  unset a
  unset string
  ```

- 环境变量

  ```shell
  #查看系统变量
  env
  echo $USER
  #命令搜索路径
  echo $PATH
  echo $PS1
  #查看预定义变量和位置变量
  set
  #上一条命令的运行结果，成功0，失败1
  $?
  #显示当前进程的PID
  $$
  #查看当前进程的名称
  $0
  #变量替换
  pos2=${2-_}
  ```

- 环境变量配置文件

  ```shell
  #etc下的配置文件都是所有用户通用的配置
  #log in shell带-号
  #no log in shell不带-号
  /etc/profile.d/
  #系统或者终端启动的配置文件
  /etc/profile
  
  #家目录配置文件
  ~/.bash_profile
  ~/.bashrc
  /etc/bashrc
  
  #修改配置文件
  export PATH=$PATH:/root
  source /etc/profile
  ```

  

## 数组

```shell
#定义数组
IPTS=(192.168.1.1 192.168.2.1 192.168.3.1)
#显示数组所有元素
echo ${IPTS[@]}
#显示数组元素个数
echo ${#IPTS[@]}
#显示数组第一个元素
echo ${IPTS[0]}
#截取数组元素
echo ${array[@]:1:3}
```



## 转义和引用

- 特殊字符

  ```shell
  ##		注释
  #;		分号
  #\		转义符号
  #"和'	引号
  ```

- 转义

- 引用

```shell
a=10;b=10;ab=101
#"		带变量解释，可以有变量、转义
echo "$a"
#'		无变量解释，无视任何变量、转义
echo '$a'
#`		命令替换，先执行``里面的内容，再将结果加入到原命令中重新执行
echo `ls -l`
#$()		放命令，可以用来进行命令替换
echo $(ls -l)
#{}		放变量，可以用来引用变量
echo ${ab}; echo $ab
#$(())	算数运算，空格位置没有影响
echo $(($a * $b))
#$[]	算术运算，空格位置没有影响
echo $[ $a * $b ]
#(())	表达式运算
#[[]]	主要用于正则表达式
```



## 运算符

- 赋值运算符

  ```shell
  =
  #expr只支持整数
  expr 4 + 5
  #expr赋值
  num1=`expr 4 + 5`
  ```

- 算术运算符

  ```shell
  +
  -
  *
  /
  **
  %
  ```

- 数字常量

  ```shell
  #变量值0开头为八进制
  #变量值0x开头为十六进制
  ```

- 双圆括号

  ```shell
  #let命令的简化
  (( a = 10 ))
  (( a++ ))
  echo $((10+20))
  ```

  

## 特殊符号



## 条件语句

### case

```shell
#!/bin/bash
#demo case

read -p "press any key, then press enter:" key

case $key in
[a-z]|[A-Z])
        echo "it is a letter."
;;
[1-9])
        echo "it is a number."
;;
*)
        echo "It's function keys、Spacebar or other ksys."
esac
```



## 循环语句



## 函数

- 函数库

  ```shell
  #系统自建函数库位置
  /etc/init.d/functions
  #自建函数库，需要运行脚本导入函数
  . /myFunctions.sh
  ```

- 系统函数

  ```shell
  
  ```

  

## 综合实例

```shell
#!/bin/bash

#把所有的.sh文件筛选出来
#判断这些.sh文件能否执行
#如果可以，执行
#否则跳过

for filename in `ls /etc/profile.d/*.sh`
do
	if [ -x $filename ]
	then
		$filename
		#pwd
	else
		echo $filename cannot be excute
	fi
done
```



```shell
#!/bin/bash
#给定一个路径，进入目录
#打印位置
#输出目录下的文件
cdls(){
	cd $1
	pwd
	ls
}
```



```shell
#/bin/bash
#给定一组PID
#判断这些PID是否存在进程

chkpid(){
	for pid in $* ; do
		if [ -d "/proc/$pid" ] ; then
			echo $pid exits
         fi
     done
}
```



```shell
#/bin/bash

#忽略相应的信号
trap "echo sig 15" 15
trap "echo sig 2" 2

$echo $$
while :
do
	:
done
```

```shell
#抓取脚本路径下除index.html外的html文件，将他们做成超链接插入到index.html中
#!/bin/bash

for file in $(ls *.html | grep -v index.html); do
echo
echo
echo
                echo $file
                filename=$(basename $file .html)    
                echo filename

                # \<h1\ id=\'$file\'\>\<a\ href=\"$file\"\>\<span\>$file\<\/span\>\<\/a\>\<\/h1\>#
                insertion=\<h1\ id=\'$filename\'\>\<a\ href=\"$file\"\>\<span\>$filename\<\/span\>\<\/a\>\<\/h1\>

                sed --in-place=SUFFIX "/robotinx_notes_append/ i ${insertion}" index.html
echo
echo
echo
done
```



```shell
#!/bin/bash
#author:RobotINX
#from:runoob.com

:<<HelloWorldTest
echo "HELLO WORLD"
urname="runoob.com"
echo $urname
HelloWorldTest

:<<LoopWithVariables
#recommend use {} with variables
for skill in Ada Coffe Action Java; do
	echo "I am good at ${skill}Script"
done
LoopWithVariables

:<<LoopWithDirectory
#print all files and directory in /root
for file in $(ls /root); do
	echo $file
done
LoopWithDirectory

:<<UseVariables
#use symbol $ to use variable
#needn't symbol $ to change the value
urname=alibaba
echo $urname
urname=mayun
echo $urname
UseVariables

:<<ReadonlyVariables
#readonly variables cannot change its valus 
myUrl="https://www.runoob.com"
readonly myUrl
myUrl="www.googlt.com"

#unset to delete the variable
#cannot delete readonly variable
#if the variable has deleted, its value will change to null
unset myUrl
unset urname
echo $urname
ReadonlyVariables

:<<DefineString
#use 'or" to define string
str1=this is string1
str2='this is string2'
str3="this is string3"
echo $str1
echo $str2
echo $str3

#string define with '' cannot include variables
#string define with "" can include variables
#string define with "" can include escape characters
urname="runoob"
str="Hello, I know your name is \"$urname\"!\n"
echo -e $str
str2="Hello, I know your name is $urname!\n"
echo -e $str2

#use symbol # to get length of string
echo $str
echo ${#str}
DefineString

:<<SubString
#introduce how to sub string
str="abcdefghijklmn"
#get char from 1 to 4
echo ${str:1:4}
#get char from 1 to the end
echo ${str:1}
#get char from 1 to 5
echo ${str:1:5}
SubString

:<<SearchChar
#use expr command to search the character index in the string
string="runoob is a great site"
#find the index of s in the string
echo `expr index "$string" s`
#find the first i or o character's index in the string
echo `expr index "$string" io`
SearchChar

:<<DefineArray
#define array
array_name1=("value0" "value1" "value2" "value3")
#use the element with index number
echo ${array_name1[1]}
#use all element with element @
echo ${array_name1[@]}
stringtest=${array_name1[@]}
echo $stringtest
DefineArray

:<<ArrayLength
#get the length of array like string
length=${#array_name1[@]}
echo $length
echo ${#array_name1[@]}

#get the length of element like string
length=${#array_name1[1]}
echo $length
echo ${#array_name1[1]}
ArrayLength

PassingParameters(){
	echo "shell example passing parameters";
	echo "excuted file name: $0";
	echo "the first parameter: $1";
	echo "the second parameter: $2";
	echo "the third parameter: $3";
	echo "the amount of patameters: $#";
	echo "the parameters with \"\": $@";
	echo "each patamters with \"\": $*";
	echo "the pid of current shell: $$";
	echo "the last pid of background process: $!";
	echo "the using option of shell: $-";
	echo "the exit status of last command: $?";
	
	echo "all parameter print on one line, it means it's a string:"
	for i in "$*"; do
		echo $i
	done
	echo "each parameter print on defferent line, it means it's some strings"
	for i in "$@"; do
		echo $i
	done
}

Array(){
	array=(abandon bitcoin check destination)
	echo "the 1st element in array: ${array[0]}"
	echo "the 2nd element in array: ${array[1]}"
	echo "the 3rd element in array: ${array[2]}"
	echo "the 4th element in array: ${array[3]}"

	echo "all the element in array: ${array[@]}";

	echo "the length of array: ${#array[@]}"
	echo "the length of 1st element in array: ${#array[0]}"
}

Expr(){
	a=4
	b=5
	#val=`expr $a + $b`
	#echo "expr $a + $b = $val"
	echo "a=$a, b=$b"
	echo "expr $a + $b = `expr $a + $b`"
	echo "expr $a - $b = `expr $a - $b`"
	echo "expr $a * $b = `expr $a \* $b`"
	echo "expr $a / $b = `expr $a / $b`"
	echo "expr $a % $b = `expr $a % $b`"
	echo "$a == $b: $[$a == $b]"
	echo "$a != $b: $[$a != $b]"
	a=$b
	echo "a=\$b: a=$a, b=$b"
}

RelationshipOperation(){
	echo ""
	echo ""
	a=10
	b=20
	echo "a=$a, b=$b"
	if [ $a -eq $b ]
	then
		echo "$a -eq $b: a is equal to b"
	else
		echo "$a -eq $b: a is not equal to b"
	fi

	if [ $a -ne $b ]
	then
		echo "$a -ne $b: a is not equal to b"
	else
		echo "$a -ne $b: a is equal to b"
	fi

	if [ $a -lt $b ]
	then
		echo "$a -lt $b: a is less than b"
	else
		echo "$a -lt $b: a is not less than b"
	fi

	if [ $a -gt $b ]
	then
		echo "$a -gt $b: a is greater than b"
	else
		echo "$a -gt $b: a is not greater than b"
	fi

	if [ $a -le $b ]
	then
		 echo "$a -le $b: a is less than or equal to b"
	else
		 echo "$a -le $b: a is not less than or equal to b"
	fi

	if [ $a -ge $b ]
	then
		echo "$a -ge $b: a is greater than or equal to b"
	else
		echo "$a -ge $b: a is not greater than or equal to b"
	fi


}

BoolOperation(){
	a=10
	b=30
	echo "a=$a"
	echo "b=$b"
	if [ $a -gt 20 -a $b -gt 20 ]
	then
		echo "$a is greater than 20, and $b is greater than 20"
	else
		echo "$a is not greater than 20, or $b is not greater than 20"
	fi

	if [ $a -gt 20 -o $b -gt 20 ]
	then
		echo "$a is greater than 20, or $b is greater than 20"
	else
		echo "$a is not greater than 20, and $b is not greater than 20"
	fi

	if [ $a != $b ]
	then
		echo "$a != $b: a is not equal to b"
	else
		echo "$a != $b: a is equal to b"
	fi

}


LogicOperation(){
	a=10
	b=20
	echo "a=$a"
	echo "b=$b"
	if [[ $a -lt 100 && $b -gt 100 ]]
		then
			echo "$a -lt 100 && $b -gt 100: true"
		else
			echo "$a -lt 100 && $b -gt 100: false"
		fi

	if [[ $a -lt 100 || $b -gt 100 ]]
		then
			echo "$a -lt 100 || $b -gt 100: true"
		else
			echo "$a -lt 100 || $b -gt 100: false"
		fi
}

StringOperation(){
	a="abc"
	b="efg"
	echo "string a: $a"
	echo "string b: $b"
	
	if [ $a = $b ]
	then
		echo "$a = $b: string a is equal to string b"
	else
		echo "$a = $b: string a is not equal to string b"
	fi

	if [ $a != $b ]
	then
		echo "$a != $b: string a is not equal to string b"
	else
		echo "$a != $b: string a is equal to string b"
	fi

	if [ -z $a ]
	then
		echo "-z $a: the length of string a is 0"
	else
		echo "-z $a: the length of string a is not 0"
	fi

	if [ -n $a ]
	then
		echo "-n $a: the length of string a is not 0"
	else
		echo "-n $a: the length of string a is 0"
	fi

	if [ $a ]
	then
		echo "\$$a: string a is null"
	else
		echo "\$$a: string a is not null"
	fi
}

FileOperation(){
	file="/root/bash/test.sh"
	if [ -b $file ]
	then
		echo "$file is a block device file."
	else
		echo "$file is not a block device file."
	fi

	if [ -c $file ]
	then
		echo "$file is a char device file."
	else
		echo "$file is not a char device file."
	fi

	if [ -d $file ]
	then
		echo "$file is a directory."
	else
		echo "$file is not a directory."
	fi

	if [ -f $file ]
	then
		echo "$file is a usual file."
	else
		echo "$file is not a usual file."
	fi

	if [ -r $file ]
	then
		echo "$file is readable."
	else
		echo "$file is not readable."
	fi

	if [ -w $file ]
	then
		echo "$file is wtitable."
	else
		echo "$file is not writable."
	fi

	if [ -x $file ]
	then
		echo "$file is excutable."
	else
		echo "$file is not excutable."
	fi

	if [ -s $file ]
	then
		echo "$file is empty."
	else
		echo "$file is not empty."
	fi

	if [ -e $file ]
	then 
		echo "$file is exist."
	else
		echo "$file is not exist."
	fi

	if [ -L $file ]
	then 
		echo "$file is a link."
	else
		echo "$file is not exist, or it is not a link."
	fi
}

EchoCommand(){
	read string
	echo "$string is a test."

	echo -e "-e to use escape.\n"
	echo "it has escape a line."

	echo -e "use \\ c to do not wrap.\c"
	echo "it still print on the last line."

	#use > to print in to a file
	echo "It is a test." > ./test.txt

	#use '' to output the string it is
	echo '$name\'
	
	#output the date
	echo `date`
}

PrintCommand(){
	printf "Hello, Shell!\n"
	# use -*.* to output formatted number
	printf "%-10s %-8s %-4s\n" name gender height
	printf "%-10s %-8s %-4.2f\n" Benjamin male 66.6666
	printf "%-10s %-8s %-4.2f\n" Susan female 50.123456789
	printf "%-10s %-8s %-4.2f\n" Oranna female 47.258369
	printf "%-10s %-8s %-4.2f\n" Beatrice female 45.6789
	printf "%-10s %-8s %-4.2f\n" Kennedy male 66.6666

	# use %s to output string
	printf "%s\n" "Hello, Shell!"
	# use %d to output demical number
	printf "%d\n" "123456789"
	# use %c to output characters
	printf "%c\n" "a"
	# use %f to output float number
	printf "%f\n" "123.123123"
}

TestCommand(){
	a=10
	b=20
	if [ $a == $b ]
	then
		echo "$a is equal to $b."
	elif [ $a -gt $b ]
	then
		echo "$a is greater than $b."
	elif [ $a -lt $b ]
	then
		echo "$a is less than $b."
	else
		echo "no conditions are met."
	fi
	
	#loop will get the values in the list
	for loop in 1 2 3 4 5
	do
		echo "The value is: $loop"
	done

	num=1
	while(( $num<=5 ))
	do
		echo $int
		#let "num++"
		num=$num+1
	done

	echo "enter <ctrl - d > to exit"
	echo -n "enter your favarite site:"
	while read FILM
	do
		echo "yes! $FILM is a great site!"
	done
}

ProcessControl_if(){
	if [ $(ps -ef | grep -c "ssh") -gt 1 ]; then
		echo "true"
	fi
}

ProcessControl_ifelse(){
	if [ $(ps -ef | grep -c "ssh") -gt 1 ]; then
		echo "true"
	else
		echo "false"
	fi
}

ProcessControl_ifelif(){
	if [ $(ps -ef | grep -c "ssh") -gt 1 ]; then
		echo "true"
	elif [ $(ps -ef | grep -c "ssh") -eq 1 ]; then
		echo "false"
	fi
}

ProcessControl_if_elif2(){
	a=10
	b=20
	if [ $a -lt $b ]; then
		echo "a < b"
	elif [ $a -gt $b ]; then
		echo "a > b"
	else
		echo " a = b"
	fi
}


ProcessControl_for(){
	for var in {1..10}; do
		echo $var
	done
}


ProcessControl_while(){
	num=1
	while(( $num<=5 )); do
		echo $num
		(( num++ ))
	done
}

ProcessControl_until(){
	a=0

	until [ ! $a -lt 10 ]
	do
   		echo $a
   		a=`expr $a + 1`
	done
}

ProcessControl_case(){
	echo '输入 1 到 4 之间的数字:'
	echo '你输入的数字为:'
	read aNum
	case $aNum in
	    1)  echo '你选择了 1'
	    ;;
	    2)  echo '你选择了 2'
	    ;;
	    3)  echo '你选择了 3'
	    ;;
	    4)  echo '你选择了 4'
	    ;;
	    *)  echo '你没有输入 1 到 4 之间的数字'
	    ;;
	esac
}

ProcessControl_case2(){
	site="runoob"

	case "$site" in
	   "runoob") echo "菜鸟教程"
	   ;;
	   "google") echo "Google 搜索"
	   ;;
	   "taobao") echo "淘宝网"
	   ;;
	esac
}

ProcessControl_break(){
	while :
	do
	    echo -n "输入 1 到 5 之间的数字:"
	    read aNum
	    case $aNum in
	        1|2|3|4|5) echo "你输入的数字为 $aNum!"
	        ;;
	        *) echo "你输入的数字不是 1 到 5 之间的! 游戏结束"
	            break
	        ;;
	    esac
	done
}

ProcessControl_continue(){
	while :
	do
	    echo -n "输入 1 到 5 之间的数字: "
	    read aNum
	    case $aNum in
	        1|2|3|4|5) echo "你输入的数字为 $aNum!"
	        ;;
	        *) echo "你输入的数字不是 1 到 5 之间的!"
	            continue
	            echo "游戏结束"
	        ;;
	    esac
	done
}
```





## 脚本控制



## 计划任务

### 一次性计划任务

- 实例

  ```shell
  #一次性计划任务
  at 
  ```

- TLDR

  ```shell
    at
  
    Executes commands at a specified time.
    More information: https://man.archlinux.org/man/at.1.
  
    - Open an `at` prompt to create a new set of scheduled commands, press `Ctrl + D` to save and exit:
      at hh:mm
  
    - Execute the commands and email the result using a local mailing program such as Sendmail:
      at hh:mm -m
  
    - Execute a script at the given time:
      at hh:mm -f path/to/file
  
    - Display a system notification at 11pm on February 18th:
      echo "notify-send 'Wake up!'" | at 11pm Feb 18
  ```



### 一般计划任务

- 实例

  ```shell
  #周期性计划任务
  #查看crond服务
  systemctl status crond
  
  #cron任务分为两种
  #系统cron任务：系统维护作业，/etc/crontab主配置文件，/etc/cron.d/子配置文件
  #用户cron任务：保存在/var/spool/cron/USERNAME，使用crontab管理
  
  #配置
  crontab -e
  #查看计划任务
  crontab -l
  #格式总结
  min hour day month week command >> output_file
  #配置实例
  #每分钟输出
  * * * * *  /usr/bin/date >> /tmp/date.txt
  #每周一到五每分钟
  * * * * 1-5 /usr/bin/date >> /tmp/date.txt
  #每年每七月七日每分钟
  * * 7 7 * /usr/bin/date >> /tmp/date.txt
  #每周一凌晨三点三十分
  30 3 * * 1 /usr/bin/date >> /tmp/date.txt
  #每周日十八点三十分
  30 18 * * 7 /usr/bin/date >> /tmp/date.txt
  #每月十五号三点正
  0 3 15 * * /usr/bin/date >> /tmp/date.txt
  #每隔五分钟执行一次
  0/5 * * * * /usr/bin/date >> /tmp/date.txt
  #每月最后一天执行一次
  * * L * * /usr/bin/date >> /tmp/date.txt
  #每26分、29分、33分执行一次
  26,29,33 * * * * /usr/bin/date >> /tmp/date.txt
  ```

- TLDR

  ```shell
    crontab
  
    Schedule cron jobs to run on a time interval for the current user.
    Job definition format: "(min) (hour) (day_of_month) (month) (day_of_week) command_to_execute".
    More information: https://manned.org/crontab.
  
    - Edit the crontab file for the current user:
      crontab -e
  
    - Edit the crontab file for a specific user:
      sudo crontab -e -u user
  
    - Replace the current crontab with the contents of the given file:
      crontab path/to/file
  
    - View a list of existing cron jobs for current user:
      crontab -l
  
    - Remove all cron jobs for the current user:
      crontab -r
  
    - Sample job which runs at 10:00 every day (* means any value):
      0 10 * * * command_to_execute
  
    - Sample job which runs every minute on the 3rd of April:
      * * 3 Apr * command_to_execute
  
    - Sample job which runs a certain script at 02:30 every Friday:
      30 2 * * Fri /absolute/path/to/script.sh
  ```

  

### 延时计划任务

- 实例

  ```shell
  /etc/cron.d/0hourly
  /etc/anacrontab
  anacontab
  flock
  ```

  