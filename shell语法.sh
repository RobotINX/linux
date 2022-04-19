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












