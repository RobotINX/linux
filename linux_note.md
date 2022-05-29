

[TOC]

# 帮助命令

## man	使用手册 manual

```shell
  man

  Format and display manual pages.
  More information: https://www.man7.org/linux/man-pages/man1/man.1.html.

  - Display the man page for a command:
    man command

  - Display the man page for a command from section 7:
    man 7 command

  - Display the path searched for manpages:
    man --path

  - Display the location of a manpage rather than the manpage itself:
    man -w command

  - Display the man page using a specific locale:
    man command --locale=locale

  - Search for manpages containing a search string:
    man -k "search_string"
```



## help	命令帮助 help

- type cd：查看命令的类型，分为内部命令和外部命令

- 外部命令使用举例：ls -help

- 内部命令使用举例：help cd

  

## info	命令详细信息 infomation

- 命令的详细信息

```shell
  info

  Reads documentation stored in the info format.
  More information: https://en.wikipedia.org/wiki/Info_(Unix).

  - Start reading top-level directory menu:
    info

  - Start reading at given menu item node from top-level directory:
    info menu_item

  - Start reading at second menu item within first menu item manual:
    info first_menu_item second_menu_item
```



## tldr	简略命令手册 

- 简略版的常用命令选项和解释

- 具体安装指令：

  ```shell
  yum install nodejs
  yum install npm
  yum install tldr
  tldr --update
  ```

# 文件操作

## ls	打印文件夹内容 list

- ls /root：显示root用户的根目录
- ls /root /etc：一次显示多个目录
- ls -l：各列参数的具体含义
- ls -F：文件夹后面带有/斜杆显示
- ls -lrt：按照时间倒序形式列出详细文件信息
- ls -lS：按照文件大小倒序列出文件详细信息
- ls -R：递归显示文件信息
- ls -lh /etc：带文件单位显示文件大小信息

- clear、CTRL + L：清理屏幕内容

```shell
  ls

  List directory contents.
  More information: https://www.gnu.org/software/coreutils/ls.

  - List files one per line:
    ls -1

  - List all files, including hidden files:
    ls -a

  - List all files, with trailing `/` added to directory names:
    ls -F

  - Long format list (permissions, ownership, size, and modification date) of all files:
    ls -la

  - Long format list with size displayed using human-readable units (KiB, MiB, GiB):
    ls -lh

  - Long format list sorted by size (descending):
    ls -lS

  - Long format list of all files, sorted by modification date (oldest first):
    ls -ltr

  - Only list directories:
    ls -d */
```



## cd	更改当前目录 change directory

- cd /path/to/...	绝对路径
  - 根目录下开始算
- cd ./path/to/...   相对路径
  - 当前目录开始算，执行结果与cd path/to/...一致
- cd -
  - 返回之前的目录
- cd ~
  - 返回当前用户的家目录

```shell
  cd

  Change the current working directory.
  More information: https://manned.org/cd.

  - Go to the given directory:
    cd path/to/directory

  - Go to the home directory of the current user:
    cd

  - Go up to the parent of the current directory:
    cd ..

  - Go to the previously chosen directory:
    cd -
```



- 网卡设置目录：cd /etc/sysconfig/network-scripts/



## mkdir	创建文件夹 make directory

- mkdir /directory
  - 在根目录下创建一个文件夹
- mkdir directory
  - 在当前目录下创建一个文件夹.
- mkdir directory_1 directory_2 directory_3
  - 一次在当前目录下创建多个文件夹
- mkdir /a/b/c
  - 在根目录下的a文件夹中的b文件夹下创建一个c文件夹（a和b都已存在，不存在会报错）
- mkdir -p /a/b/c
  - 在根目录下a文件夹中的b文件夹下创建一个c文件夹（a和b可能不存在）

```shell
  mkdir

  Creates a directory.
  More information: https://www.gnu.org/software/coreutils/mkdir.

  - Create a directory in current directory or given path:
    mkdir directory

  - Create multiple directories in the current directory:
    mkdir directory_1 directory_2 ...

  - Create directories recursively (useful for creating nested dirs):
    mkdir -p path/to/directory
```



## rmdir	删除文件夹 remove directory

- rmdir /directory
  - 删除根目录下的directory文件夹，只能删除非空目录
- rmdir -p path/to/directory
  - 递归删除相关目录

```shell
  rmdir

  Removes a directory.
  More information: https://www.gnu.org/software/coreutils/rmdir.

  - Remove directory, provided it is empty. Use `rm -r` to remove non-empty directories:
    rmdir path/to/directory

  - Remove the target and its parent directories (useful for nested dirs):
    rmdir -p path/to/directory
```



## rm	删除文件或文件夹 remove

- rm path/to/file path/to/another/file
  - 在任意文件夹下删除目录
- rm -r /directory
  - 删除根目录下的directory文件夹，可以删除非空目录，需要确认
- rm -rf /directory
  - 删除根目录下的directory文件夹，可以删除非空目录，不需要确认

```shell
  rm

  Remove files or directories.
  More information: https://www.gnu.org/software/coreutils/rm.

  - Remove files from arbitrary locations:
    rm path/to/file path/to/another/file

  - Recursively remove a directory and all its subdirectories:
    rm -r path/to/directory

  - Forcibly remove a directory, without prompting for confirmation or showing error messages:
    rm -rf path/to/directory

  - Interactively remove multiple files, with a prompt before every removal:
    rm -i file(s)

  - Remove files in verbose mode, printing a message for each removed file:
    rm -v path/to/directory/*
```



## mv	移动文件 move

```shell
  mv

  Move or rename files and directories.
  More information: https://www.gnu.org/software/coreutils/mv.

  - Move a file to an arbitrary location:
    mv source target

  - Move files into another directory, keeping the filenames:
    mv source1 source2 source3 target_directory

  - Do not prompt for confirmation before overwriting existing files:
    mv -f source target

  - Prompt for confirmation before overwriting existing files, regardless of file permissions:
    mv -i source target

  - Do not overwrite existing files at the target:
    mv -n source target

  - Move files in verbose mode, showing files after they are moved:
    mv -v source target
```



## cp	复制文件 copy

```shell
  cp

  Copy files and directories.
  More information: https://www.gnu.org/software/coreutils/cp.

  - Copy a file to another location:
    cp path/to/source_file.ext path/to/target_file.ext

  - Copy a file into another directory, keeping the filename:
    cp path/to/source_file.ext path/to/target_parent_directory

  - Recursively copy a directory's contents to another location (if the destination exists, the directory is copied inside it):
    cp -r path/to/source_directory path/to/target_directory

  - Copy a directory recursively, in verbose mode (shows files as they are copied):
    cp -vr path/to/source_directory path/to/target_directory

  - Copy text files to another location, in interactive mode (prompts user before overwriting):
    cp -i *.txt path/to/target_directory

  - Follow symbolic links before copying:
    cp -L link path/to/target_directory

  - Use the full path of source files, creating any missing intermediate directories when copying:
    cp --parents source/path/to/file path/to/target_file
```



## cat	查看文本 concatenate

- 查看文本
  - cat /root/Desktop/ping.txt
- 带行数查看文本
  - cat -n /root/Desktop/ping.txt
- 将多个文本的内容输出到另一个文本
  - cat save.txt test.txt > new.txt
- 将多个文本的内容附加到另一个文本
  - cat save.txt >> new.txt
- 输出不可见字符
  - cat -v -t -e new.txt

```shell
  cat

  Print and concatenate files.
  More information: https://www.gnu.org/software/coreutils/cat.

  - Print the contents of a file to the standard output:
    cat file

  - Concatenate several files into the target file:
    cat file1 file2 > target_file

  - Append several files into the target file:
    cat file1 file2 >> target_file

  - Number all output lines:
    cat -n file

  - Display non-printable and whitespace characters (with `M-` prefix if non-ASCII):
    cat -v -t -e file

```

## head	查看文本的头部 head

- head /root/Desktop/ping.txt
  - 显示文件的前十行
- head -5 /root/Desktop/ping.txt
  - 显示文件的前五行

```shell
  head

  Output the first part of files.
  More information: https://www.gnu.org/software/coreutils/head.

  - Output the first few lines of a file:
    head --lines count path/to/file

  - Output the first few bytes of a file:
    head --bytes count path/to/file

  - Output everything but the last few lines of a file:
    head --lines -count path/to/file

  - Output everything but the last few bytes of a file:
    head --bytes -count path/to/file
```



## tail	查看文件的尾部 tail

- tail /root/Desktop/ping.txt
  - 查看文件的最后十行
- tail -5 /root/Desktop/ping.txt
  - 查看文件的最后五行
- tail -f /root/Desktop/ping.txt
  - 实时更新文件尾部内容

```shell
  tail

  Display the last part of a file.
  See also: `head`.
  More information: https://www.gnu.org/software/coreutils/tail.

  - Show last 'count' lines in file:
    tail --lines count path/to/file

  - Print a file from a specific line number:
    tail --lines +count path/to/file

  - Print a specific count of bytes from the end of a given file:
    tail --bytes count path/to/file

  - Print the last lines of a given file and keep reading file until `Ctrl + C`:
    tail --follow path/to/file

  - Keep reading file until `Ctrl + C`, even if the file is inaccessible:
    tail --retry --follow path/to/file

  - Show last 'num' lines in 'file' and refresh every 'n' seconds:
    tail --lines count --sleep-interval seconds --follow path/to/file

```

## wc	统计文本信息 words count

- wc -l /root/Desktop/ping.txt
  - 统计行数信息
- wc /root/Desktop/ping.txt
  - 统计文本的行数、单词数和字符数

```shell
  wc

  Count lines, words, and bytes.
  More information: https://www.gnu.org/software/coreutils/wc.

  - Count all lines in a file:
    wc --lines path/to/file

  - Count all words in a file:
    wc --words path/to/file

  - Count all bytes in a file:
    wc --bytes path/to/file

  - Count all characters in a file (taking multi-byte characters into account):
    wc --chars path/to/file

  - Count all lines, words and bytes from `stdin`:
    find . | wc

  - Count the length of the longest line in number of characters:
    wc --max-line-length path/to/file

```



## more	更多信息 more

```shell
  more

  Open a file for interactive reading, allowing scrolling and search.
  More information: https://manned.org/more.

  - Open a file:
    more path/to/file

  - Open a file displaying from a specific line:
    more +line_number path/to/file

  - Display help:
    more --help

  - Go to the next page:
    <Space>

  - Search for a string (press `n` to go to the next match):
    /something

  - Exit:
    q

  - Display help about interactive commands:
    h
```

## less 更少信息 less

```shell
  less

  Open a file for interactive reading, allowing scrolling and search.
  More information: https://greenwoodsoftware.com/less/.

  - Open a file:
    less source_file

  - Page down / up:
    <Space> (down), b (up)

  - Go to end / start of file:
    G (end), g (start)

  - Forward search for a string (press `n`/`N` to go to next/previous match):
    /something

  - Backward search for a string (press `n`/`N` to go to next/previous match):
    ?something

  - Follow the output of the currently opened file:
    F

  - Open the current file in an editor:
    v

  - Exit:
    q
```

# tar打包和压缩 

## 打包

 - tar cf /root/Desktop/etc-backup.tar /etc
    - 打包文件
 - tar czf /root/Desktop/etc-backup.tar.gz /etc
    - 打包文件，并以gzip压缩
 - tar cjf /root/Desktop/etc-backup.tar.bz2 /etc
    - 打包文件，并以bzip2压缩

## 解压

- tar xf ./etc-backup.tar
  - 把文件解压到当前目录下
- tar zxf ./etc-backup.tar.gz
  - 把gzip压缩的文件解压到当前目录下
- tar jxf ./etc-backup.tar.bz2
  - 把gzip压缩的文件解压到当前目录下
- tar jxf ./etc-backup.tar.bz2 -C Desktop/
  - 把gzip压缩的文件解压到指定目录下
- tar tvf source.tar
  - 查看压缩包中的文件

```shell
  tar

  Archiving utility.
  Often combined with a compression method, such as gzip or bzip2.
  More information: https://www.gnu.org/software/tar.

  - [c]reate an archive and write it to a [f]ile:
    tar cf target.tar file1 file2 file3

  - [c]reate a g[z]ipped archive and write it to a [f]ile:
    tar czf target.tar.gz file1 file2 file3

  - [c]reate a g[z]ipped archive from a directory using relative paths:
    tar czf target.tar.gz --directory=path/to/directory .

  - E[x]tract a (compressed) archive [f]ile into the current directory [v]erbosely:
    tar xvf source.tar[.gz|.bz2|.xz]

  - E[x]tract a (compressed) archive [f]ile into the target directory:
    tar xf source.tar[.gz|.bz2|.xz] --directory=directory

  - [c]reate a compressed archive and write it to a [f]ile, using [a]rchive suffix to determine the compression program:
    tar caf target.tar.xz file1 file2 file3

  - Lis[t] the contents of a tar [f]ile [v]erbosely:
    tar tvf source.tar

  - E[x]tract files matching a pattern from an archive [f]ile:
    tar xf source.tar 
```



# vim

## 正常模式

### 操作范围

| 按键 | 说明                                 |
| ---- | ------------------------------------ |
| 0    | 将光标定位到**行首**的位置           |
| ^    | 同上                                 |
| $    | 将光标定位到**行尾**的位置           |
| b    | 将光标定位到光标所在单词的**起始处** |
| e    | 将光标定位到光标所在单词的**结尾处** |
| w    | 将光标定位到**下一个单词的起始处**   |
| gg   | 将光标定位到**文件开头**             |
| G    | 将光标定位到**文件末尾**             |

### 插入指令

| 按键 | 说明                                         |
| ---- | -------------------------------------------- |
| i    | 在光标的**前面**进入插入模式                 |
| I    | 在光标所在行的**行首**进入插入模式           |
| a    | 在光标的**后面**进入插入模式                 |
| A    | 在光标所在行的**行尾**进入插入模式           |
| o    | 在光标所在行的**下方**插入空行并进入插入模式 |
| O    | 在光标所在行的**上方**插入空行并进入插入模式 |
| s    | 删除光标**指定**的字符并进入插入模式         |
| S    | 将光标所在行**清除**并进入插入模式           |

### 删除指令

| 按键 | 说明                                                     |
| ---- | -------------------------------------------------------- |
| d0   | 删除光标从当前位置（不包括）到该行**行首**的所有字符     |
| d^   | 同上                                                     |
| d$   | 删除光标从当前位置（包括）到该行**行尾**的所有字符       |
| db   | 删除光标从当前位置（不包括）到**单词起始处**的所有字符   |
| de   | 删除光标从当前位置（包括）到**单词结尾处**的所有字符     |
| dw   | 删除光标从当前位置（包括）到**下个单词起始处**的所有字符 |
| dh   | 删除光标**前边**一个字符                                 |
| dl   | 删除光标**指定**的字符                                   |
| dj   | 删除光标所在行以及**下一行**的所有字符                   |
| dk   | 删除光标所在行以及**上一行**的所有字符                   |
| dd   | 删除光标**所在行**的字符                                 |
| dgg  | 删除光标所在行到**文件开头**的所有字符                   |
| dG   | 删除光标所在行到**文件末尾**的所有字符                   |

### 撤销指令

| 按键     | 说明             |
| -------- | ---------------- |
| u        | 撤销最后一次修改 |
| U        | 撤销对整行的修改 |
| ctrl + r | 恢复撤销的内容   |



## 命令模式

```
w /root/Desktop/save.txt：保存路径
wq：默认路径保存并推出
q!：不保存退出
!ifconfig：查看配置信息
/x：在已打开的文件中，查找x
查找状态下：
n：下一个字符
shift+n：上一个字符
s/x/X：把第一个找到的x替换成X
%s/x/X/g：把全部的x替换成X
3,5/s/x/X：在第三行和第五行中的x替换成X
```

## 可视模式

```
v：可视模式
CTRL+v：块可视化模式
I插入
u撤销
d删除
CTRL+r取消撤销
```

## vim配置

```shell
#配置文件位置：/etc/vimrc
set nohlsearch
set nonu
set nu
set hlsearch
```

# 用户管理

## useradd 添加用户

- useradd -u 1000 user1
  - 新增一个uid为1000的用户user1
- useradd -g 9999 user2
  - 新增一个user2，用户分组id为9999
- useradd -g user1 user3
  - 新增一个user3，用户分组名为user1

```shell
  useradd

  Create a new user.
  See also: `users`, `userdel`, `usermod`.
  More information: https://manned.org/useradd.

  - Create a new user:
    sudo useradd username

  - Create a new user with the specified user id:
    sudo useradd --uid id username

  - Create a new user with the specified shell:
    sudo useradd --shell path/to/shell username

  - Create a new user belonging to additional groups (mind the lack of whitespace):
    sudo useradd --groups group1,group2,... username

  - Create a new user with the default home directory:
    sudo useradd --create-home username

  - Create a new user with the home directory filled by template directory files:
    sudo useradd --skel path/to/template_directory --create-home username

  - Create a new system user without the home directory:
    sudo useradd --system username
```

## userdel 删除用户

- userdel -r user1
  - 删除用户user1，并且删除他的家目录
- userdel -rf user2
  - 删除用户user2和他的家目录，哪怕他仍在登录当中

```shell
  userdel

  Remove a user account or remove a user from a group.
  See also: `users`, `useradd`, `usermod`.
  More information: https://manned.org/userdel.

  - Remove a user:
    sudo userdel username

  - Remove a user in other root directory:
    sudo userdel --root path/to/other/root username

  - Remove a user along with the home directory and mail spool:
    sudo userdel --remove username
```

## groupadd 添加组

- groupadd -g 999 group1

```shell
  groupadd

  Add user groups to the system.
  See also: `groups`, `groupdel`, `groupmod`.
  More information: https://manned.org/groupadd.

  - Create a new group:
    sudo groupadd group_name

  - Create a new system group:
    sudo groupadd --system group_name

  - Create a new group with the specific groupid:
    sudo groupadd --gid id group_name
```

## groupdel 删除组

```shell
  groupdel

  Delete existing user groups from the system.
  See also: `groups`, `groupadd`, `groupmod`.
  More information: https://manned.org/groupdel.

  - Delete an existing group:
    sudo groupdel group_name
```

## passwd 更改密码

```shell
  passwd

  Passwd is a tool used to change a user's password.
  More information: https://manned.org/passwd.

  - Change the password of the current user interactively:
    passwd

  - Change the password of a specific user:
    passwd username

  - Get the current status of the user:
    passwd -S

  - Make the password of the account blank (it will set the named account passwordless):
    passwd -d
```

## usermod 修改用户属性

- usermod -l new_username username
  - 修改用户的登录名
- usermod -u 2999 user1
  - 修改用户的uid
- usermod -g group2 user1
  - 修改用户分组
- usermod -aG group2 user1
  - 附加用户分组
- usermod -L user1
  - 锁定用户
- usermod -U user1
  - 解锁用户

```shell
  usermod

  Modifies a user account.
  See also: `users`, `useradd`, `userdel`.
  More information: https://manned.org/usermod.

  - Change a username:
    sudo usermod --login new_username username

  - Change a user id:
    sudo usermod --uid id username

  - Change a user shell:
    sudo usermod --shell path/to/shell username

  - Add a user to supplementary groups (mind the lack of whitespace):
    sudo usermod --append --groups group1,group2,... username

  - Change a user home directory:
    sudo usermod --move-home --home path/to/new_home username
```

## chage 修改用户寿命

```shell
  chage

  Change user account and password expiry information.
  More information: https://manned.org/chage.

  - List password information for the user:
    chage --list username

  - Enable password expiration in 10 days:
    sudo chage --maxdays 10 username

  - Disable password expiration:
    sudo chage --maxdays -1 username

  - Set account expiration date:
    sudo chage --expiredate YYYY-MM-DD username

  - Force user to change password on next log in:
    sudo chage --lastday 0 username
```

## id 查看用户属性

```shell
  id

  Display current user and group identity.
  More information: https://www.gnu.org/software/coreutils/id.

  - Display current user's ID (UID), group ID (GID) and groups to which they belong:
    id

  - Display the current user identity as a number:
    id -u

  - Display the current group identity as a number:
    id -g

  - Display an arbitrary user's ID (UID), group ID (GID) and groups to which they belong:
    id username
```

## sudo以其他身份执行命令

```shell
  sudo

  Executes a single command as the superuser or another user.
  More information: https://www.sudo.ws/sudo.html.

  - Run a command as the superuser:
    sudo less /var/log/syslog

  - Edit a file as the superuser with your default editor:
    sudo --edit /etc/fstab

  - Run a command as another user and/or group:
    sudo --user=user --group=group id -a

  - Repeat the last command prefixed with `sudo` (only in `bash`, `zsh`, etc.):
    sudo !!

  - Launch the default shell with superuser privileges and run login-specific files (`.profile`, `.bash_profile`, etc.):
    sudo --login

  - Launch the default shell with superuser privileges without changing the environment:
    sudo --shell

  - Launch the default shell as the specified user, loading the user's environment and reading login-specific files (`.profile`, `.bash_profile`, etc.):
    sudo --login --user=user

  - List the allowed (and forbidden) commands for the invoking user:
    sudo --list
```



## 用户配置文件位置

- 关于passwd文件
  - user2：x：10000:9999::/home/user2:/bin/bash
    - user2：用户名
    - x：是否需要密码登录，为空则不需要密码登录
    - 10000：uid
    - 9999：gid
    - 中间有一段注释
    - /home/user2：用户家目录位置
    - /bin/bash：用户登录用bash，为/sbin/nologin则不允许登录

```shell
#passwd保存所有的用户信息
vim /etc/passwd
#group保存所有的用户组信息
vim /etc/group
#shadow保存所有的用户密码信息
vim /etc/shadow
```

# 文件权限

## 权限类型

- rwx 421
- all a
- user u
- group g
- others o

## chmod 修改权限



```shell
chmod a=r /tmp/filename
chmod u+w /tmp/filename
chmod u-x /tmp/testfile
chmod 755 /tmp/testfile
```

```shell
chmod

  Change the access permissions of a file or directory.
  More information: https://www.gnu.org/software/coreutils/chmod.

  - Give the [u]ser who owns a file the right to e[x]ecute it:
    chmod u+x file

  - Give the [u]ser rights to [r]ead and [w]rite to a file/directory:
    chmod u+rw file_or_directory

  - Remove e[x]ecutable rights from the [g]roup:
    chmod g-x file

  - Give [a]ll users rights to [r]ead and e[x]ecute:
    chmod a+rx file

  - Give [o]thers (not in the file owner's group) the same rights as the [g]roup:
    chmod o=g file

  - Remove all rights from [o]thers:
    chmod o= file

  - Change permissions recursively giving [g]roup and [o]thers the ability to [w]rite:
    chmod -R g+w,o+w directory

  - Recursively give [a]ll users [r]ead permissions to files and e[X]ecute permissions to sub-directories within a directory:
    chmod -R a+rX directory
```

## chown修改所有者

```shell
  chown

  Change user and group ownership of files and directories.
  More information: https://www.gnu.org/software/coreutils/chown.

  - Change the owner user of a file/directory:
    chown user path/to/file_or_directory

  - Change the owner user and group of a file/directory:
    chown user:group path/to/file_or_directory

  - Recursively change the owner of a directory and its contents:
    chown -R user path/to/directory

  - Change the owner of a symbolic link:
    chown -h user path/to/symlink

  - Change the owner of a file/directory to match a reference file:
    chown --reference=path/to/reference_file path/to/file_or_directory
```

## chgrp修改属组

```shell
  chgrp

  Change group ownership of files and directories.
  More information: https://www.gnu.org/software/coreutils/chgrp.

  - Change the owner group of a file/directory:
    chgrp group path/to/file_or_directory

  - Recursively change the owner group of a directory and its contents:
    chgrp -R group path/to/directory

  - Change the owner group of a symbolic link:
    chgrp -h group path/to/symlink

  - Change the owner group of a file/directory to match a reference file:
    chgrp --reference=path/to/reference_file path/to/file_or_directory
```



# 网络管理

## ifconfig 查看网络配置

- 主要用于查看网卡的配置信息，也可以用于临时修改网卡配置信息，但是服务器重启或者网卡重启之后就会恢复设置

- 修改默认的网卡名称

  ```shell
  vim /etc/default/grub
  #grub_cmdline_linux配置项中的net.ifnames=0 biosdevname=0
  #grub2-mkconfig -o /boot/grub2/grub.cfg
  reboot
  ```
  
- TLDR
  ```shell
    ifconfig
  
    Network Interface Configurator.
    More information: https://net-tools.sourceforge.io/man/ifconfig.8.html.
  
    - View network settings of an Ethernet adapter:
      ifconfig eth0
  
    - Display details of all interfaces, including disabled interfaces:
      ifconfig -a
  
    - Disable eth0 interface:
      ifconfig eth0 down
  
    - Enable eth0 interface:
      ifconfig eth0 up
  
    - Assign IP address to eth0 interface:
      ifconfig eth0 ip_address
  ```

## route 静态路由表配置

- 通过这个命令添加的路由表是一次性的，如果需要永久有效，需要在/etc/rc.local中修改

- 查看静态路由表

  ```shell
  #不带域名解析
  route -n
  #带域名解析
  route
  ```

- 删除默认网关

  ```shell
  route del default gw 10.0.8.1
  ```

- 添加默认网关

  ```shell
  route add default gw 10.0.8.1
  ```

- 添加明细路由

  ```shell
  #为指定主机添加路由节点
  route add -host 192.168.1.2 gw 192.168.1.1
  #为指定子网添加路由节点
  route add -net 192.168.1.0 gw 192.168.1.1 netmask 255.255.255.0
  ```

- TLDR

  ```shell
    route
  
    Use route cmd to set the route table.
    More information: https://manned.org/route.
  
    - Display the information of route table:
      route -n
  
    - Add route rule:
      sudo route add -net ip_address netmask netmask_address gw gw_address
  
    - Delete route rule:
      sudo route del -net ip_address netmask netmask_address dev gw_address
  ```




## ping 测试主机连通性

- 发送ICMP协议包给指定的主机测试连通性

  ```shell
  #指定发送包的数量
  ping -c 4 www.baidu.com
  #指定每个包之间的间隔时间
  ping -i 2 www.baidu.com
  
  ```

- TLDR

  ```shell
    ping
  
    Send ICMP ECHO_REQUEST packets to network hosts.
    More information: https://manned.org/ping.
  
    - Ping host:
      ping host
  
    - Ping a host only a specific number of times:
      ping -c count host
  
    - Ping host, specifying the interval in seconds between requests (default is 1 second):
      ping -i seconds host
  
    - Ping host without trying to lookup symbolic names for addresses:
      ping -n host
  
    - Ping host and ring the bell when a packet is received (if your terminal supports it):
      ping -a host
  
    - Also display a message if no response was received:
      ping -O host
  ```

## traceroute 路由节点跟踪

- 主要使用形式

  ```shell
  traceroute -m 10 www.baidu.com # 跳数设置 
  traceroute -n www.baidu.com # 显示IP地址，不查主机名 
  traceroute -p 6888 www.baidu.com # 探测包使用的基本UDP端口设置6888 
  traceroute -q 4 www.baidu.com # 把探测包的个数设置为值4 
  traceroute -r www.baidu.com # 绕过正常的路由表，直接发送到网络相连的主机 
  traceroute -w 3 www.baidu.com # 把对外发探测包的等待响应时间设置为3秒
  ```

- TLDR

  ```shell
    traceroute
  
    Print the route packets trace to network host.
    More information: https://manned.org/traceroute.
  
    - Traceroute to a host:
      traceroute host
  
    - Disable IP address and host name mapping:
      traceroute -n host
  
    - Specify wait time for response:
      traceroute -w 0.5 host
  
    - Specify number of queries per hop:
      traceroute -q 5 host
  
    - Specify size in bytes of probing packet:
      traceroute host 42
  ```

## mtr ping和traceroute的结合

- TLDR

  ```shell
    mtr
  
    Matt's Traceroute: combined traceroute and ping tool.
    More information: https://bitwizard.nl/mtr.
  
    - Traceroute to a host and continuously ping all intermediary hops:
      mtr host
  
    - Disable IP address and host name mapping:
      mtr -n host
  
    - Generate output after pinging each hop 10 times:
      mtr -w host
  
    - Force IP IPv4 or IPV6:
      mtr -4 host
  
    - Wait for a given time (in seconds) before sending another packet to the same hop:
      mtr -i seconds host
  
  ```

## nslookup 域名查询

- 域名服务器配置文件

  ```shell
  #/etc/resolv.conf
  ```

- 查询指定域名的IP地址

  ```shell
  nslookup www.baidu.com
  ```

- TLDR

  ```shell
    nslookup
  
    Query name server(s) for various domain records.
    More information: https://manned.org/nslookup.
  
    - Query your system's default name server for an IP address (A record) of the domain:
      nslookup example.com
  
    - Query a given name server for a NS record of the domain:
      nslookup -type=NS example.com 8.8.8.8
  
    - Query for a reverse lookup (PTR record) of an IP address:
      nslookup -type=PTR 54.240.162.118
  
    - Query for ANY available records using TCP protocol:
      nslookup -vc -type=ANY example.com 
  
    - Query a given name server for the whole zone file (zone transfer) of the domain using TCP protocol:
      nslookup -vc -type=AXFR example.com name_server
  
    - Query for a mail server (MX record) of the domain, showing details of the transaction:
      nslookup -type=MX -debug example.com
  
    - Query a given name server on a specific port number for a TXT record of the domain:
      nslookup -port=port_number -type=TXT example.com name_server
  
  ```

## telnet 登录远程主机和管理

- telnet的相关配置

  ```
  man xinetd.conf
  ```

  - 启动telnet服务

    ```
    service xinetd restart
    ```

  - 常用配置参数

    ```
    service telnet
    {
    	disable = no #启用
    	flags = REUSE#socket #可重用
    	socket_type = stream #链接方式为TCP
    	wait = no #为每个请求单独启动一个进程
    	user = root #启动服务的用户为root
    	server = /usr/sbin/in.telnetd #要激活的进程
    	log_on_failure += USERID #记录登录失败的用户名
    }
    ```

  - 配置允许登录的用户IP

    ```
    only_from = 192.168.1.2 #只允许192.168.1.1进行telnet登录
    ```

  - 配置禁止登录的用户IP

    ```
    no_access = 192.168.1.{3, 4, 5} #禁止192.168.1.3-5登录
    ```

  - 配置可以登录的时间段

    ```
    access_time = 9:00-12:00 13:00-17:00 #每天只有这两个时间段可以登录
    ```

  - 绑定指定的IP地址登录

    ```
    bind = 192.168.1.2
    ```

- 配置端口

  ```
  vim /etc/services
  telnet 23/tcp
  telnet 23/udp
  ```

- TLDR

  ```shell
    telnet
  
    Connect to a specified port of a host using the telnet protocol.
    More information: https://manned.org/telnet.
  
    - Telnet to the default port of a host:
      telnet host
  
    - Telnet to a specific port of a host:
      telnet ip_address port
  
    - Exit a telnet session:
      quit
  
    - Emit the default escape character combination for terminating the session:
      Ctrl + ]
  
    - Start telnet with "x" as the session termination character:
      telnet -e x ip_address port
  
    - Telnet to Star Wars animation:
      telnet towel.blinkenlights.nl
  ```

## tcpdump 抓包指令

- 直接启动tcpdump监听第一个网络接口上所有流经的数据包

  ```shell
  #如果不指定监听的网络接口，则默认监听第一个网络接口，一般是eth0
  tcpdump
  ```

- 监视指定网络接口的数据包

  ```shell
  tcpdump -i eth1
  ```

- 监听指定主机的数据包

  ```shell
  #打印所有进入或离开hostname的数据包
  tcpdump host hostname
  #也可以指定IP进行监听
  tcpdump host 192.168.1.2
  #监听helios与hot或者与ace之间的通信数据包
  tcpdump host helios and \( hot or ace \)
  #监听192.168.1.1与192.168.1.2或与192.168.1.3之间的通信数据包
  tcpdump host 192.168.1.1 and \( 192.168.1.2 or 192.168.1.3 \)
  #监听192.168.1.1与除192.168.1.2外的其他主机的通信数据包
  tcpdump host 192.168.1.1 and ! 192.168.1.2
  #监听eth0上所有来自主机hostname的数据包
  tcpdump -i eth0 src host hostname
  #监听eth0上所有去往主机hostname的数据包
  tcpdump -i eth0 dst host hostname
  ```

- 监听指定主机和端口的数据包

  ```shell
  #监听主机210.27.48.1接受或发出的telnet数据包（一般是tcp协议，端口23）
  tcpdump host 210.27.48.1 and tcp port 23
  #监听本机UDP协议的123端口
  tcpdump udp port 123
  ```

- 监听指定网络的数据包

  ```shell
  #监听本地主机与ucb-ether网络上的主机之间的数据包
  tcpdump net ucb-ether
  #监听所有通过网关snup的ftp数据包
  tcpdump 'gateway snup and ( port ftp or ftp-date )'
  #监听所有源地址或目标地址是本地主机的IP数据包
  tcpdump ip and not net localnet
  #监听80端口的HTTP报文
  tcpdump -i any port 80 -A
  ```

- TLDR

  ```shell
    tcpdump
  
    Dump traffic on a network.
    More information: https://www.tcpdump.org.
  
    - List available network interfaces:
      tcpdump -D
  
    - Capture the traffic of a specific interface:
      tcpdump -i eth0
  
    - Capture all TCP traffic showing contents (ASCII) in console:
      tcpdump -A tcp
  
    - Capture the traffic from or to a host:
      tcpdump host www.example.com
  
    - Capture the traffic from a specific interface, source, destination and destination port:
      tcpdump -i eth0 src 192.168.1.1 and dst 192.168.1.2 and dst port 80
  
    - Capture the traffic of a network:
      tcpdump net 192.168.1.0/24
  
    - Capture all traffic except traffic over port 22 and save to a dump file:
      tcpdump -w dumpfile.pcap port not 22
  
    - Read from a given dump file:
      tcpdump -r dumpfile.pcap
  ```

## netstat 查看网络状态

- 列出所有端口（包括监听和未监听的）

  ```shell
  netstat -a  #列出所有端口
  netstat -at #列出所有tcp端口
  netstat -au #列出所有udp端口
  ```

- 列出所有处于监听状态的SOCKETS

  ```shell
  netstat -l  #只显示监听状态的端口
  netstat -lt #只显示所有监听状态的tcp端口
  netstat -lu #只显示所有监听状态的udp端口
  netstat -lx #只显示所有监听状态的unix端口
  ```

- 显示每个协议的统计信息

  ```shell
  netstat -s  #显示所有端口的统计信息
  netstat -st #显示tcp端口的统计信息
  netstat -su #显示udp端口的统计信息
  netstat -pt #显示tcp端口的进程信息
  ```

- 取消域名解析

  ```shell
  netstat -n
  ```

- 持续显示netstat信息

  ```shell
  netstat -c
  ```

- 显示核心路由信息

  ```shell
  netstat -r #作用同route
  ```

- 显示网络接口列表

  ```shell
  netstat -i
  netstat -ie #作用同ifconfig
  ```

- 显示指定程序的运行端口

  ```shell
  netstat -ap | grep ssh
  ```

- 显示指定端口所运行的程序进程

  ```shell
  netstat -ap | grep ':23'
  ```

- 通过指定端口找到运行的程序ID

  ```shell
  netstat -anp | grep 8081 | grep LISTEN | awk '{printf $7}' | cut -d/ -f1
  ```

- 查看连接某服务端口最多的IP地址

  ```shell
  netstat -ntu | grep :80 | awk '{print $5}' | cut -d: -f1 | 
  awk '{++ip[$1]} END {for(i in ip) print ip[i], "\t", i}' | sort -nr
  ```

- tcp各种状态列表

  ```shell
  netstat -nt | grep -e 127.0.0.1 -e 0.0.0.0 -e ::: -v |
  awk '/^tcp/ {++state[$NF]} END {for(i in state) print i, "\t", state[i]}'
  ```

- 查看stdout进程数

  ```shell
  netstat -anpo | grep 'stdout' | wc -l
  ```

- TLDR

  ```shell
    netstat
  
    Displays network-related information such as open connections, open socket ports, etc.
    More information: https://man7.org/linux/man-pages/man8/netstat.8.html.
  
    - List all ports:
      netstat --all
  
    - List all listening ports:
      netstat --listening
  
    - List listening TCP ports:
      netstat --tcp
  
    - Display PID and program names:
      netstat --program
  
    - List information continuously:
      netstat --continuous
  
    - List routes and do not resolve IP addresses to hostnames:
      netstat --route --numeric
  
    - List listening TCP and UDP ports (+ user and process if you're root):
      netstat --listening --program --numeric --tcp --udp --extend
  ```




## 网络配置文件

- 主机名称配置文件

  ```shell
  #修改主机名称
  hostnamectl set-hostname centos7.test
  #需要在/etc/hosts中添加映射
  127.0.0.1 Robotinx Robotinx
  ```

- 网卡配置文件

  ```shell
  /etc/sysconfig/network-scipts/ifcfg-eth0
  
  1. TYPE=Ethernet  
  #  网络类型 Ethernet 以太网
   
  2. PROXY_METHOD=none    
  #  代理方式
   
  3. BROWSER_ONLY=no 
  #  只是浏览器：否
   
  4. BOOTPROTO=none 
  #  网卡协议 获取网卡IP的方式
  #  dhcp：    动态主机配置协议
  #  static：  手动配置固定IP
  #  none：    手动配置固定IP
   
  5. DEFROUTE=yes
  #  默认路由：是  
  #  如果IP数据包中的目的地址找不到存在的其他路由时，
  #  路由器会默认的选择路由
   
  6. IPV4_FAILURE_FATAL=no 
  #  是否开启IPV4致命错误检测：否
   
  7. PV6INIT=yes 
  #  IPV6初始化: 是
   
  8. IPV6_AUTOCONF=yes
  #  IPV6是否自动配置：是
   
  9. IPV6_DEFROUTE=yes
  #  IPV6 默认路由：是  
   
  10. IPV6_FAILURE_FATAL=no 
  #  是否开启IPV6致命错误检测：否
   
  11. IPV6_ADDR_GEN_MODE=stable-privacy 
  #  IPV6地址生成模型  stable-privacy:一种生成IPV6的策略
   
  12. NAME=ens33 
  #  网卡名称
   
  13. UUID=ce12bd82-d2c1-4425-8e16-ff976f178200
  #  唯一标识码
   
  14. DEVICE=ens33
  #  网卡设备名称
   
  15. ONBOOT=yes 
  #  在开机或重启时是否启动网卡
   
  16. IPADDR=192.168.2.121
  #  手动配置静态ip地址
   
  17. NETMASK=255.255.255.0
  #  子网掩码
   
  18. GATEWAY=192.168.2.1
  #  默认网关
   
  19. DNS1=8.8.8.8
  #  dns域名解析服务器
   
  重启网卡服务命令
  service network restart
  ```
  
- DNS服务器配置文件

  ```shell
  /etc/resolv.conf
  ```

- service自动控制服务名

  ```
  /etc/init.d
  ```



## 常用的网络端口

>
>
>常用端口号与对应的服务
>
>HTTP：80
>HTTPS:443
>FTP：21
>TELNET.TCP：23
>TFTP:69
>SMTP:25
>DNS:53



  # 软件管理

## rpm 软件包管理工具

- 软件包全名mysql-3.23.54a-11

- 查询系统中安装了的包

  ```shell
  #将所有安装过的包都列出来
  rpm -qa
  #只显示带有关键字mysql的包
  rpm -qa | grep mysql
  #查询某个软件包的全名
  rpm -q mysql
  #查询某个软件包安装目录
  rpm -ql mysql
  #查询可执行文件的位置
  which mysql
  #查询某个文件属于哪个软件包
  rpm -qf /usr/bin/mysql
  #卸载某个软件包
  rpm -e mysql
  #查询某个软件包的信息
  rpm -i mysql
  ```

- TLDR

  ```shell
    rpm
  
    RPM Package Manager.
    More information: https://rpm.org/.
  
    - Show version of httpd package:
      rpm -q httpd
  
    - List versions of all matching packages:
      rpm -qa 'mariadb*'
  
    - Forcibly install a package regardless of currently installed versions:
      rpm -U package_name.rpm --force
  
    - Identify owner of a file and show version of the package:
      rpm -qf /etc/postfix/main.cf
  
    - List package-owned files:
      rpm -ql kernel
  
    - Show scriptlets from an RPM file:
      rpm -qp --scripts package_name.rpm
  
    - Show changed, missing and/or incorrectly installed files of matching packages:
      rpm -Va 'php-*'
  ```

  

## yum 基于RPM的软件包管理器

### 配置yum源

- 备份原来的文件

  ```shell
  mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
  ```

- 下载新的 CentOS-Base.repo 到 /etc/yum.repos.d/

  ```shell
  Centos 8:
  wget -O /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-vault-8.5.2111.repo
  
  Centos 7:
  wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
  ```

- 更新缓存

  ```shell
  yum clean all
  yum makecache
  ```

### yum相关指令

- 安装

  ```shell
  #全部安装
  yum install
  #安装指定的包
  yum install mysql
  #安装程序组
  yum groupinstall group1
  ```

- 更新和升级

  ```shell
  #全部更新
  yum update
  #更新指定的程序包
  yum update mysql
  #检查可更新的程序
  yum check-update
  #升级指定程序包
  yum upgrade mysql
  #升级指定程序组
  yum groupupgrade group1
  ```

- 查找和显示

  ```shell
  #检查mysql是否已经安装
  yum list installed | grep mysql
  yum list installed mysql*
  #显示安装包信息
  yum info mysql
  #显示所有包
  yum list
  #显示指定包名的安装情况
  yum list mysql
  #显示指定程序包组的安装信息
  yum groupinfo group1
  ```

- 删除程序

  ```shell
  #删除程序包httpd
  yum remove httpd
  yum erase httpd
  #删除程序组group1
  yum groupremove group1
  #查看程序包的依赖情况
  yum deplist package1
  ```

- 清除缓存

  ```shell
  #清除缓存目录下的软件包
  yum clean packages
  #清除缓存目录下的headers
  yum clean headers
  ```

- TLDR

  ```SHELL
    yum
  
    Package management utility for RHEL, Fedora, and CentOS (for older versions).
    More information: https://manned.org/yum.
  
    - Install a new package:
      yum install package
  
    - Install a new package and assume yes to all questions (also works with update, great for automated updates):
      yum -y install package
  
    - Find the package that provides a particular command:
      yum provides command
  
    - Remove a package:
      yum remove package
  
    - Display available updates for installed packages:
      yum check-update
  
    - Upgrade installed packages to the newest available versions:
      yum upgrade
  ```

## 内核升级

- 查看系统版本

  ```shell
  #查看CPU信息
  lscpu
  #查看发行版本
  cat /etc/redhat-release
  #查看系统版本信息
  cat /proc/version
  uname -a
  #操作系统信息
  cat /etc/os-release
  ```

- 下载新版本内核

  ```shell
  #导入ELRepo软件仓库的公共秘钥
  rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
  #安装ELRepo软件仓库的yum源
  rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm
  #安装主线内核（ml=mainline）4.14.11
  yum --enablerepo=elrepo-kernel install kernel-ml
  #查看系统可用内核，因为是通过yum下载的内核，所以用yum查看
  #如果是自己用源码编译的内核，主要看自己编译时放在哪个文件夹，当然建议是放在/usr/src/kernels文件夹下
  yum list installed | grep kernel
  #设置默认内核
  grub2-set-default 0
  #生成 grub 配置文件
  grub2-mkconfig -o /boot/grub2/grub.cfg
  #重启系统并查看内核版本
  reboot
  uname -a
  cat /proc/version
  ```

## uname 查看系统信息

- TLDR

  ```shell
    uname
  
    Print details about the current machine and the operating system running on it.
    See also `lsb_release`.
    More information: https://www.gnu.org/software/coreutils/uname.
  
    - Print kernel name:
      uname
  
    - Print system architecture and processor information:
      uname --machine --processor
  
    - Print kernel name, kernel release and kernel version:
      uname --kernel-name --kernel-release --kernel-version
  
    - Print system hostname:
      uname --nodename
  
    - Print all available system information:
      uname --all
  ```




## 安装jdk

```shell
which java

cd /usr/bin

mv /usr/bin/java /usr/bin/java.bak


rpm -qa | grep java
rpm -ql java-11-openjdk-headless-11.0.12.0.7-0.el8_4.x86_64

ls -lrt /usr/bin/java
ls -lrt /etc/alternatives/java
cd /etc/alternatives/java



sudo yum install java-11-openjdk -y

rpm -qa | grep java

rpm -ql java-11-openjdk-headless-11.0.12.0.7-0.el8_4.x86_64

cd /usr/lib/jvm/java-11-openjdk-11.0.12.0.7-0.el8_4.x86_64/bin

pwd

/usr/lib/jvm/java-11-openjdk-11.0.12.0.7-0.el8_4.x86_64/bin

cp /etc/profile /etc/profile.bak

vim /etc/profile

export JAVA_HOME=/usr/lib/jvm
export PATH=$PATH:$JAVA_HOME/java-11-openjdk-11.0.12.0.7-0.el8_4.x86_64/bin
#export PATH=$PATH:/usr/lib/jvm/java-11-openjdk-11.0.12.0.7-0.el8_4.x86_64/bin

source /etc/profile

java -version
```



# 进程管理

## ps 查看当前系统的进程状态

- 相关实例

  ```shell
  #查看进程的PID
  ps axo pid
  #查看进程的名称
  ps axo comm
  #查看进程的CPU占用率
  ps axo pcpu
  #按内存资源的使用量对进程，从大到小
  ps aux | sort -rnk 4
  #按CPU资源的使用量对进程排序，从小到大
  ps aux | sort -nk 3
  #显示所有进程信息
  ps -A
  #显示指定用户的进程信息
  ps -u root
  #查看线程数
  ps -efL
  #查看进程并按内存使用大小排序
  ps -e -o "%C : %p : %z : %a" | sort -k5 -nr
  #显示所有进程信息，连同终端
  ps -ef
  #ps与grep常用组合，查找指定进程
  ps -ef | grep ssh
  #通过名字或者命令搜索进程
  ps -C nginx
  #CPU或者内存进行排序， -降序，+升序
  ps aux --sort=-pcpu
  ps aux --sort=+pmem
  #用树的风格显示进程的层次关系
  ps -f --forest -C nginx
  #显示一个父进程的子进程
  ps -o pid,uname,comm -C nginx
  #重定义标签
  ps -eo pid,uname=USERNAME,pcpu=CPU_USAGE,pmem=MEMUSAGE,comm
  #显示进程运行的时间
  ps -eo pid,comm,etime
  #查看named进程详细信息
  ps -aux | grep ssh
  #通过进程id获取服务名称
  ps -o command -p 91730 | sed -n 2p
  #找出与cron和 syslog这两个服务有关的PID号码
  ps aux | egrep '(cron|syslog)'
  ```

- TLDR

  ```shell
    ps
  
    Information about running processes.
    More information: https://manned.org/ps.
  
    - List all running processes:
      ps aux
  
    - List all running processes including the full command string:
      ps auxww
  
    - Search for a process that matches a string:
      ps aux | grep string
  
    - List all processes of the current user in extra full format:
      ps --user $(id -u) -F
  
    - List all processes of the current user as a tree:
      ps --user $(id -u) f
  
    - Get the parent PID of a process:
      ps -o ppid= -p pid
  
    - Sort processes by memory consumption:
      ps --sort size
  ```



## pstree 树状展现进程之间的关系

- 实例

  ```shell
  #显示当前所有进程和进程ID
  pstree -p
  #显示所有进程的详细信息
  pstree -a
  #获取SSH会话的PID
  pstree -a | grep ssh
  ```

- TLDR

  ```shell
    pstree
  
    A convenient tool to show running processes as a tree.
    More information: https://manned.org/pstree.
  
    - Display a tree of processes:
      pstree
  
    - Display a tree of processes with PIDs:
      pstree -p
  
    - Display all process trees rooted at processes owned by specified user:
      pstree user
  ```

  

## top 实时查看系统状态

- TLDR

  ```shell
    #top的界面是一个交互界面，可以按h进入帮助模式
    top
  
    Display dynamic real-time information about running processes.
    More information: https://manned.org/top.
  
    - Start top:
      top
  
    - Do not show any idle or zombie processes:
      top -i
  
    - Show only processes owned by given user:
      top -u username
  
    - Sort processes by a field:
      top -o field_name
  
    - Show the individual threads of a given process:
      top -Hp process_id
  
    - Show only the processes with the given PID(s), passed as a comma-separated list. (Normally you wouldn't know PIDs off hand. This example picks the PIDs from the process name):
      top -p $(pgrep -d ',' process_name)
  
    - Get help about interactive commands:
      ?
  ```

  

## 控制台输出的解释

### ps aux

```shell
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
#USER：进程所有者
#PID：进程id
#%CPU：进程所占用的CPU资源
#%MEM：进程所占用的内存资源
#VSZ：进程占用的虚拟内存量
#RSS：进程占用的固定内存量
#TTY：运行进程的终端机，若与终端机无关则为？，tty1-tty6是本机上面的登入程序，若为pts/0则为网络连接
#STAT：进程的运行状态
	#R：TASK_RUNNING,可执行状态
	#S：TASK_INTERRUPTIBLE,可中断的睡眠状态
	#D：TASK_UNINTERRUPTIBLE，不可中断的睡眠状态
	#T：TASK_TRACED,暂停状态或跟踪状态
	#Z：TASK_DEAD-EXIT_ZOMBIE,退出状态，进程成为僵尸进程
	#X：TASK_DEAD-EXIT_DEAD，退出状态，进程即将被销毁
#START：进程被启动的时间
#TIME：进程实际占用CPU的时间
#COMMAND：进程所属的指令
```

### ps -el

```shell
F S   UID   PID  PPID  C PRI  NI ADDR SZ WCHAN  TTY          TIME CMD
#F：进程的flag
#S：进程的状态
#UID：进程所属的用户
#PID：进程的id
#PPID：父进程的id
#C：占用的CPU比例
#PRI：PRIORITY值，进程优先级
#NI：NICE值
#ADDR：进程在内存中的位置
#SZ：进程占用的内存值
#WCHAN：进程是否正在运行，-表示正在运行
#TTY：登入者的终端机位置
#TIME：进程占用的CPU时间
#CMD：进程所属的指令
```

### top

```shell
top - 16:48:37 up 13:53,  1 user,  load average: 0.01, 0.08, 0.05
Tasks: 117 total,   2 running,  72 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.2 us,  0.2 sy,  0.0 ni, 99.7 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem :  4032776 total,  1944028 free,   194292 used,  1894456 buff/cache
KiB Swap:        0 total,        0 free,        0 used.  3567388 avail Mem 

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND  
  
#当前系统时间
top - 16:48:37
#系统运行时间
up 13:53
#当前登录用户数
1 user
#1min, 5min, 15min内的平均CPU负载
load average: 0.01, 0.08, 0.05
#进程数量：总进程数，正在运行进程数，休眠进程数，停止进程数，僵尸进程数
Tasks: 117 total,   2 running,  72 sleeping,   0 stopped,   0 zombie
#CPU占用：当前用户占用(user space)，内核空间占用(sysctl)，
#改变过优先级的进程占用(nice priority)，空闲百分比(idolt)，IO等待占用(wait)，
#硬中断占用(hardware interrupts)，软中断占比(software interupts)
%Cpu(s):  0.2 us,  0.2 sy,  0.0 ni, 99.7 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
#内存状态：总计，空闲，已用，缓存
KiB Mem :  4032776 total,  1944028 free,   194292 used,  1894456 buff/cache
#swap交换分区状态：总计，空心啊，已用，缓存
KiB Swap:        0 total,        0 free,        0 used.  3567388 avail Mem
#PID，所属用户，进程优先级，nice优先值，虚拟内存占用，物理内存占用，共享内存占用，进程状态，CPU占比，物理内存占比
PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
```



## nice 指定优先级给将运行的程序

- 实例

  ```shell
  #nice 范围从-20 到 19 ，值越⼩优先级越⾼，抢占资源就越多
  nice -n 10 ./a.sh
  ```

- TLDR

  ```shell
  ```

  

## renice 修改运行中的进程的优先级

- 实例

  ```shell
  #将pid为19314的进程的优先级提升15
  renice -n 15 19314
  ```

- TLDR

  ```shell
    renice
  
    Alters the scheduling priority/nicenesses of one or more running processes.
    Niceness values range from -20 (most favorable to the process) to 19 (least favorable to the process).
    More information: https://manned.org/renice.
  
    - Change priority of a running process:
      renice -n niceness_value -p pid
  
    - Change priority of all processes owned by a user:
      renice -n niceness_value -u user
  
    - Change priority of all processes that belong to a process group:
      renice -n niceness_value --pgrp process_group
  ```

  

## jobs 查看作业状态

- 实例

  ```shell
  #首先运行一个ssh程序产生一个作业
  ssh 192.168.1.1
  #之后按下CTRL + Z使作业移交后台处理
  #再后台执行一个睡眠程序
  sleep 60 &
  #查看正在运行的作业，带pid
  jobs -l
  #将编号为2的后台作业移交前台
  fg 2
  #将编号为2的前台作业移交后台
  bg 2
  ```

  

- TLDR

  ```shell
    jobs
  
    BASH builtin for viewing information about processes spawned by the current shell.
    More information: https://manned.org/jobs.
  
    - View jobs spawned by the current shell:
      jobs
  
    - List jobs and their process IDs:
      jobs -l
  
    - Display information about jobs with changed status:
      jobs -n
  
    - Display process ID of process group leader:
      jobs -p
  
    - Display running processes:
      jobs -r
  
    - Display stopped processes:
      jobs -s
  ```

  

## kill 结束进程

- 实例

  ```shell
  #查看kill的信号列表
  kill -l
  #常用的kill信号，只有SIGKILL可以无条件终止，其他信号进程都有权利忽略
  HUP		1	终端挂断
  INT		2	终端，效果等同CTRL+C
  QUIT	3	退出，效果等同CTRL+\
  KILL	9	强制终止
  TERM	15	终止
  CONT	18	继续，与STOP相反，fg/bg命令
  STOP	19	暂停，效果等同CTRL+Z
  #杀死指定进程
  kill -9 12345
  ```

- TLDR

  ```SHELL
    kill
  
    Sends a signal to a process, usually related to stopping the process.
    All signals except for SIGKILL and SIGSTOP can be intercepted by the process to perform a clean exit.
    More information: https://manned.org/kill.
  
    - Terminate a program using the default SIGTERM (terminate) signal:
      kill process_id
  
    - List available signal names (to be used without the `SIG` prefix):
      kill -l
  
    - Terminate a background job:
      kill %job_id
  
    - Terminate a program using the SIGHUP (hang up) signal. Many daemons will reload instead of terminating:
      kill -1|HUP process_id
  
    - Terminate a program using the SIGINT (interrupt) signal. This is typically initiated by the user pressing `Ctrl + C`:
      kill -2|INT process_id
  
    - Signal the operating system to immediately terminate a program (which gets no chance to capture the signal):
      kill -9|KILL process_id
  
    - Signal the operating system to pause a program until a SIGCONT ("continue") signal is received:
      kill -17|STOP process_id
  
    - Send a `SIGUSR1` signal to all processes with the given GID (group id):
      kill -SIGUSR1 -group_id
  
  ```

  

## nohup 后台运行程序

- 实例

  ```shell
  #不做挂断操作，后台下载，终端操作无效
  nohup wget www.site.com/file.zip
  #挂断操作，后台下载，终端操作有效
  nohup wget www.site.com/file.zip &
  #下面的命令会在后台持续ping，输出的ping信息在/root/nohup.out文件中
  nohup ping www.baidu.com &
  #下面的命令指定了输出的信息位置
  nohup ping www.baidu.com > /root/ping.txt &
  nohup ping www.baidu.com > /root/ping.txt 2>&1 &
  ```

- TLDR

  ```shell
  
  ```



## screen 命令行后台切换

- 实例

  ```shell
  #新建一个名为robotinx的session
  screen -S robotinx
  #列出当前所有的session
  screen -ls
  #回到robotinx这个session
  screen -r robotinx
  #断开指定的session
  screen -d robotinx
  #断开当前的session并回到指定的session
  screen -dr robotinx
  ```

- TLDR

  ```shell
    screen
  
    Hold a session open on a remote server. Manage multiple windows with a single SSH connection.
    See also `tmux` and `zellij`.
    More information: https://manned.org/screen.
  
    - Start a new screen session:
      screen
  
    - Start a new named screen session:
      screen -S session_name
  
    - Start a new daemon and log the output to `screenlog.x`:
      screen -dmLS session_name command
  
    - Show open screen sessions:
      screen -ls
  
    - Reattach to an open screen:
      screen -r session_name
  
    - Detach from inside a screen:
      Ctrl + A, D
  
    - Kill the current screen session:
      Ctrl + A, K
  
    - Kill a detached screen:
      screen -X -S session_name quit
  ```



## 常用的日志记录

```shell
/var/log/messages
/var/log/dmesg
/var/log/secure
/var/log/cron
```



## service 服务管理工具

- 实例

  ```shell
  #旧版的服务管理工具
  #相关的配置都放在/etc/init.d文件夹下
  #可以通过chkconfig --list查询
  ```

- TLDR

  ```shell
    service
  
    Manage services by running init scripts.
    The full script path should be omitted (`/etc/init.d/` is assumed).
    More information: https://manned.org/service.
  
    - List the name and status of all services:
      service --status-all
  
    - Start/Stop/Restart/Reload service (start/stop should always be available):
      service service_name start|stop|restart|reload
  
    - Do a full restart (runs script twice with start and stop):
      service service_name --full-restart
  
    - Show the current status of a service:
      service service_name status
  ```



## chkconfig 设置系统服务

- 运行等级

  ```shell
  /etc/inittab
  0 halt 关机
  1 single user mode 单用户模式
  2 multiuser 多用户，无网络功能
  3 full multiuser 多用户 有网络功能
  4 unused 未定义
  5 x11 图形桌面坏境
  6 reboot 重启
  ```

- 如何增加一个服务

  ```shell
  #服务脚本必须存放在/etc/ini.d/目录下；
  #在chkconfig工具服务列表中增加此服务，此时服务会被在/etc/rc.d/rcN.d中赋予K/S入口
  chkconfig --add servicename
  #修改服务的默认启动等级
  chkconfig --level 35 mysqld on
  ```

- 运行级文件

  每个被chkconfig管理的服务需要在对应的init.d下的脚本加上两行或者更多行的注释。

  第一行告诉chkconfig缺省启动的运行级以及启动和停止的优先级。

  如果某服务缺省不在任何运行级启动，那么使用-代替运行级。第二行对服务进行描述，可以用\跨行注释。

  例如random.init包含三行：

  ```shell
  # chkconfig: 2345 20 80
  # description: Saves and restores system entropy pool for \
  # higher quality random number generation.
  ```

- 实例

  ```shell
  #列出所有的系统服务
  chkconfig --list
  #增加httpd服务
  chkconfig --add httpd
  #删除httpd服务
  chkconfig --del httpd
  #设置httpd在运行级别2345的情况下都是on
  chkconfig --level httpd 2345 on
  #列出httpd服务设置情况
  chkconfig --list httpd
  #设置httpd在各运行级别都为on
  chkconfig httpd on
  ```

- TLDR

  ```shell
    chkconfig
  
    Manage the runlevel of services on CentOS 6.
    More information: https://manned.org/chkconfig.
  
    - List services with runlevel:
      chkconfig --list
  
    - Show a service's runlevel:
      chkconfig --list ntpd
  
    - Enable service at boot:
      chkconfig sshd on
  
    - Enable service at boot for runlevels 2, 3, 4, and 5:
      chkconfig --level 2345 sshd on
  
    - Disable service at boot:
      chkconfig ntpd off
  
    - Disable service at boot for runlevel 3:
      chkconfig --level 3 ntpd off
  ```



## systemctl 服务管理工具

- systemctl实际上是service和chkconfig的功能结合到了一起

  | 任务                 | 旧指令                        | 新指令                              |
  | -------------------- | ----------------------------- | ----------------------------------- |
  | 使某项服务自动启动   | chkconfig --level 3 httpd on  | systemctl enable httpd.service      |
  | 使某项服务不自动启动 | chkconfig --level 3 httpd off | systemctl disable httpd.service     |
  | 检查服务状态         | service httpd status          | systemctl status httpd.service      |
  | 显示所有已启动的服务 | chkconfig --list              | systemctl list-units --type=service |
  | 启动服务             | service httpd start           | systemctl start httpd.service       |
  | 停止服务             | service httpd stop            | systemctl stop httpd.service        |
  | 重启服务             | service httpd restart         | systemctl restart httpd.service     |
  | 重载服务             | service httpd reload          | systemctl reload httpd.service      |

- 实例

  ```shell
  #启动nfs服务
  systemctl start nfs.service
  #设置开机自启动
  systemctl enable nfs.service
  #关闭开机自启动
  systemctl disable nfs.service
  #查看服务的当前状态
  sytemctl status nfs.service
  #重启启动某项服务
  systemctl restart nfs.service
  #查看所有已启动的服务
  systemctl list-units --type=service
  ```

- TLDR

  ```shell
    systemctl
  
    Control the systemd system and service manager.
    More information: https://www.freedesktop.org/software/systemd/man/systemctl.html.
  
    - Show all running services:
      systemctl status
  
    - List failed units:
      systemctl --failed
  
    - Start/Stop/Restart/Reload a service:
      systemctl start|stop|restart|reload unit
  
    - Show the status of a unit:
      systemctl status unit
  
    - Enable/Disable a unit to be started on bootup:
      systemctl enable|disable unit
  
    - Mask/Unmask a unit to prevent enablement and manual activation:
      systemctl mask|unmask unit
  
    - Reload systemd, scanning for new or changed units:
      systemctl daemon-reload
  
    - Check if a unit is enabled:
      systemctl is-enabled unit
  ```

## 服务所在文件夹

- 相关文件

  ```shell
  #两个旧版的网络相关的服务
  /etc/init.d/netconsole
  /etc/init.d/network
  #新版服务所在文件夹
  /usr/lib/sytemd/system
  ```

- 服务文件配置实例

  ```shell
  #打开sshd服务的配置文件
  vim /usr/lib/systemd/system/sshd.service
  
  [Unit]
  Description=OpenSSH server daemon
  Documentation=man:sshd(8) man:sshd_config(5)
  After=network.target sshd-keygen.service
  Wants=sshd-keygen.service
  [Service]
  Type=notify
  EnvironmentFile=/etc/sysconfig/sshd
  ExecStart=/usr/sbin/sshd -D $OPTIONS
  ExecReload=/bin/kill -HUP $MAINPID
  KillMode=process
  Restart=on-failure
  RestartSec=42s
  [Install]
  WantedBy=multi-user.target
  ```

- 服务运行级别映射

  ```shell
  #服务运行级别映射映射
  ls -l /usr/lib/systemd/system/runlevel*.target
  
  lrwxrwxrwx 1 root root 15 Mar 24 19:41 runlevel0.target -> poweroff.target
  lrwxrwxrwx 1 root root 13 Mar 24 19:41 runlevel1.target -> rescue.target
  lrwxrwxrwx 1 root root 17 Mar 24 19:41 runlevel2.target -> multi-user.target
  lrwxrwxrwx 1 root root 17 Mar 24 19:41 runlevel3.target -> multi-user.target
  lrwxrwxrwx 1 root root 17 Mar 24 19:41 runlevel4.target -> multi-user.target
  lrwxrwxrwx 1 root root 16 Mar 24 19:41 runlevel5.target -> graphical.target
  lrwxrwxrwx 1 root root 13 Mar 24 19:41 runlevel6.target -> reboot.target
  ```

  

## SELinux

```shell
#查看SELinux状态的命令
getenforce
/usr/sbin/sestatus
#临时关闭SELinux
setenforce 0
#SELinux配置文件
/etc/selinux/config
#配置中关闭SELinux
SELINUX=disabled
```



# 内存与磁盘管理

## free查看内存的使用情况

- 实例

  ```shell
  #以m为单位显示内存
  free -m
  #方便阅读地显示内存
  free -h
  #周期性查看内存使用信息
  free -s 10
  ```

- TLDR

  ```shell
    free
  
    Display amount of free and used memory in the system.
    More information: https://manned.org/free.
  
    - Display system memory:
      free
  
    - Display memory in Bytes/KB/MB/GB:
      free -b|k|m|g
  
    - Display memory in human-readable units:
      free -h
  
    - Refresh the output every 2 seconds:
      free -s 2
  ```

  

## fdisk 查看磁盘使用情况

- 实例

  ```shell
  #查看磁盘分区
  fdisk -l
  #磁盘分区位置
  /dev/sda
  /dev/vda
  ```

- TLDR

  ```shell
    fdisk
  
    A program for managing partition tables and partitions on a hard disk.
    See also: `partprobe`.
    More information: https://manned.org/fdisk.
  
    - List partitions:
      sudo fdisk -l
  
    - Start the partition manipulator:
      sudo fdisk /dev/sdX
  
    - Once partitioning a disk, create a partition:
      n
  
    - Once partitioning a disk, select a partition to delete:
      d
  
    - Once partitioning a disk, view the partition table:
      p
  
    - Once partitioning a disk, write the changes made:
      w
  
    - Once partitioning a disk, discard the changes made:
      q
  
    - Once partitioning a disk, open a help menu:
      m
  ```



## df 查看磁盘空闲情况

- 实例

  ```shell
  #以高可读性显示磁盘使用情况
  df -h
  #以m为单位显示磁盘使用情况
  df -m
  #查看全部系统文件
  df -a
  #查看指定文件或目录的空间使用情况
  df /root
  df /root/ping.txt
  ```

- TLDR

  ```shell
    df
  
    Gives an overview of the filesystem disk space usage.
    More information: https://www.gnu.org/software/coreutils/df.
  
    - Display all filesystems and their disk usage:
      df
  
    - Display all filesystems and their disk usage in human-readable form:
      df -h
  
    - Display the filesystem and its disk usage containing the given file or directory:
      df path/to/file_or_directory
  
    - Display statistics on the number of free inodes:
      df -i
  
    - Display filesystems but exclude the specified types:
      df -x squashfs -x tmpfs
  ```



## du 查看指定文件磁盘使用

- 实例

  ```shell
  #查看指定文件或目录的空间占用情况
  du -m /root/Desktop
  #以高可读性查看指定文件或目录的空间占用情况
  du -h /root/Desktop
  #仅统计文件夹的空间占用情况,高可读性
  du -sh /root
  #当前所在目录，按文件大小排序
  du -sh * | sort -h
  #查看指定文件占用的空间
  du -h /root/ping.txt
  ```

- du和ls的区别

  ```shell
  #dd命令可以用于测试内存的读写速度
  #生成一个块大小为4M，总计10块的文件，输入文件为/dev/zero,输出文件为afile
  dd if=/dev/zero bs=4M count=10 of=afile
  #生成一个块大小为4M，总计10块，头部跳过20块的文件，输入文件为/dev/zero,输出文件为bfile
  dd if=/dev/zero bs=4M count=10 seek=20 of=bfile
  ls -lh
  du -h
  #du查看的是文件的实际大小，不包括虚拟的占用空间
  #ls查看的是文件的逻辑大小，包括了虚拟的占用空间
  ```

- TLDR

  ```shell
    du
  
    Disk usage: estimate and summarize file and directory space usage.
    More information: https://www.gnu.org/software/coreutils/du.
  
    - List the sizes of a directory and any subdirectories, in the given unit (B/KiB/MiB):
      du -b|k|m path/to/directory
  
    - List the sizes of a directory and any subdirectories, in human-readable form (i.e. auto-selecting the appropriate unit for each size):
      du -h path/to/directory
  
    - Show the size of a single directory, in human-readable units:
      du -sh path/to/directory
  
    - List the human-readable sizes of a directory and of all the files and directories within it:
      du -ah path/to/directory
  
    - List the human-readable sizes of a directory and any subdirectories, up to N levels deep:
      du -h --max-depth=N path/to/directory
  
    - List the human-readable size of all `.jpg` files in subdirectories of the current directory, and show a cumulative total at the end:
      du -ch */*.jpg
  ```



## 系统文件格式

- 目前使用的格式说明

  ```shell
  ext4  早期版本
  xfs   现在主流
  NTFS  额外支持
  ```

- ext4文件格式说明

  ```shell
  ext4 ⽂件系统基本结构⽐较复杂
      超级块              记录整个文件系统包含的文件总数
      超级块副本          对超级块的备份
      i 节点(inode)       记录每一个文件的名称、文件大小、文件编号、文件权限
      数据块(datablock)   记录数据
  ```



## facl 设置文件访问控制列表

- 实例

  ```shell
  getfacl file    查看文件的访问权限信息
  setfacl -m u:user1:r file 指定某个用户对文件的某个权限
  setfacl -m u:user2:rw file
  setfacl -m g:group1:rw file
  setfacl -g u:user1:r file 收回某个用户对文件的某个权限
  ```

- TLDR

  ```shell
  ```

  

## fdisk 磁盘分区

- 实例

  ```shell
  #在虚拟机管理界面添加硬盘后，需要重启linux
  #查看所有磁盘状态
  fdisl -l
  #使用fdisk对新添加的磁盘设备进行分区
  fdisk /dev/sdb
  #m 列出可执行的命令
  #n 新建分区
  #p 主分区，只能建立四个
  #e 扩展分区
  #d 删除分区
  #p 查看当前分区状态
  #w 写入分区信息
  ```

- TLDR

  ```shell
    fdisk
  
    A program for managing partition tables and partitions on a hard disk.
    See also: `partprobe`.
    More information: https://manned.org/fdisk.
  
    - List partitions:
      sudo fdisk -l
  
    - Start the partition manipulator:
      sudo fdisk /dev/sdX
  
    - Once partitioning a disk, create a partition:
      n
  
    - Once partitioning a disk, select a partition to delete:
      d
  
    - Once partitioning a disk, view the partition table:
      p
  
    - Once partitioning a disk, write the changes made:
      w
  
    - Once partitioning a disk, discard the changes made:
      q
  
    - Once partitioning a disk, open a help menu:
      m
  ```



## mkfs 磁盘格式化

- 实例

  ```shell
  #mkfs不能对2T以上的磁盘进行格式化
  #可选分区格式：mkfs.ext4/mkfs.xfs
  #以ext4格式格式化/dev/sdb1
  mkfs.ext4 /dev/sdb1
  #t:挂载
  mount -t ect4 /dev/sdb1 /mnt/sdb1
  mount -t auto /dev/sdb1 /mnt/sdb1
  mount /dev/sdb1 /mnt/sdb1
  ```

- TLDR

  ```SHELL
    mkfs
  
    Build a Linux filesystem on a hard disk partition.
    This command is deprecated in favor of filesystem specific mkfs. utils.
    More information: https://manned.org/mkfs.
  
    - Build a Linux ext2 filesystem on a partition:
      mkfs path/to/partition
  
    - Build a filesystem of a specified type:
      mkfs -t ext4 path/to/partition
  
    - Build a filesystem of a specified type and check for bad blocks:
      mkfs -c -t ntfs path/to/partition
  ```



## parted 磁盘格式化

- 实例

- TLDR

  ```shell
    parted
  
    A partition manipulation program.
    See also: partprobe.
    More information: https://www.gnu.org/software/parted/parted.html.
  
    - List partitions on all block devices:
      sudo parted --list
  
    - Start interactive mode with the specified disk selected:
      sudo parted /dev/sdX
  
    - Create a new partition table of the specified label-type:
      sudo parted --script /dev/sdX mklabel aix|amiga|bsd|dvh|gpt|loop|mac|msdos|pc98|sun
  
    - Show partition information in interactive mode:
      print
  
    - Select a disk in interactive mode:
      select /dev/sdX
  
    - Create a 16 GB partition with the specified filesystem in interactive mode:
      mkpart primary|logical|extended btrfs|ext2|ext3|ext4|fat16|fat32|hfs|hfs+|linux-swap|ntfs|reiserfs|udf|xfs 0% 16G
  
    - Resize a partition in interactive mode:
      resizepart /dev/sdXN end_position_of_partition
  
    - Remove a partition in interactive mode:
      rm /dev/sdXN
  ```



## mount 磁盘挂载

- 实例

  ```shell
  #ext4：挂载的磁盘格式
  #defaults：挂载的操作权限
  #0 0：是否备份，开机是否自检
  /dev/sdb1 /mnt/sdb1 ext4 defaults 0 0
  #永久写入配置
  /etc/fstab
  #ext4：挂载的磁盘格式
  #defaults：挂载的操作权限
  #0 0：是否备份，开机是否自检
  /dev/sdb1 /mnt/sdb1 ext4 defaults 0 0
  ```

- TLDR

  ```shell
    mount
  
    Provides access to an entire filesystem in one directory.
    More information: https://manned.org/mount.8.
  
    - Show all mounted filesystems:
      mount
  
    - Mount a device to a directory:
      mount -t filesystem_type path/to/device_file path/to/target_directory
  
    - Mount a CD-ROM device (with the filetype ISO9660) to /cdrom (readonly):
      mount -t iso9660 -o ro /dev/cdrom /cdrom
  
    - Mount all the filesystem defined in /etc/fstab:
      mount -a
  
    - Mount a specific filesystem described in /etc/fstab (e.g. /dev/sda1 /my_drive ext2 defaults 0 2):
      mount /my_drive
  
    - Mount a directory to another directory:
      mount --bind path/to/old_dir path/to/new_dir
  ```



## 磁盘配额

### xfs ⽂件系统的磁盘配额

- 实例

  ```shell
  quota
  mkfs.xfs /dev/sdb1
  #磁盘如果有信息，需要-f强制格式化
  mkfs.xfs -f /dev/sdb1
  mkdir /mnt/disk1
  #-p：如果有这个文件夹，则不做操作
  mkdir -p /mnt/disk1
  #-o：需要支持磁盘配额
  #uquota：支持用户磁盘配额
  #gquota：支持组磁盘配额
  mount -o uquota,gquota /dev/sdb1 /mnt/disk1
  chmod 1777 /mnt/disk1
  #u:user
  #g:group
  #i:inodes
  #b:block
  #h:humanity
  xfs_quota -x -c 'report -ugibh' /mnt/disk1 
  #-u：限制用户磁盘配额
  #-g：限制组磁盘配额
  #isoft：inodes软限制
  #ihard：inodes硬限制
  #软限制不允许超过硬限制
  #限制user1用户
  xfs_quota -x -c 'limit -u isoft=5 ihard=10 user1' /mnt/disk1
  ```



### edquota 编辑磁盘配额

- 实例

  ```shell
  ```

- TLDR

  ```shell
  ```

  

## mkswap 虚拟内存

- 使用磁盘分区作为虚拟内存

  ```shell
  #指定虚拟内存设备
  mkswap /dev/sdd1
  #开关虚拟内存
  swapon /dev/sdd1
  swapoff /dev/sdd1
  ```

- 使用文件作为虚拟内存

  ```shell
  dd if=/dev/zero bs=4M count=1024 
  #写入文件
  /etc/fstab
  #如果是专用的分区
  #挂载位置，挂载类型，挂载格式，挂
  /dev/sdd1 swap swap defaults 0 0
  #如果是文件
  /swapfile swap swap defaults 0 0
  ```

  

## RAID技术

- RAID 的常⻅级别及含义

  >RAID 0 striping 条带⽅式，提⾼单盘吞吐率
  >RAID 1 mirroring 镜像⽅式，提⾼可靠性
  >RAID 5 有奇偶校验
  >RAID 10 是RAID 1 与 RAID 0 的结合

- 软RAID

  ```shell
  #创建软件RAID
  mdadm -C /dev/md0 -a yes -l1 -n2 /dev/sdb1 /dev/sdb2 /dev/sdb3
  mdadm -C /dev/md0 -a yes -l1 -n2 /dev/sdb[1,2,3]
  #查看使用状态
  mdadm -D /dev/md0
  #写入配置文件
  echo DEVICE /dev/sdb[1,2,3] >> /etc/madam.conf
  mdadm -Evs >> /etc/mdadm.conf
  #格式化分区
  mkfs.xfs /dev/md0
  #挂载到指定目录
  mkdir /mnt/md0
  mount /dev/md0 /mnt/md0
  #关闭软件RAID
  mdadm --stop /dev/md0
  #破坏超级块
  dd if=/dev/zero of=/dev/sdb1 bs=1M count=1
  dd if=/dev/zero of=/dev/sdb2 bs=1M count=1
  dd if=/dev/zero of=/dev/sdb3 bs=1M count=1
  ```

  

## 逻辑卷管理

- 实例

  ```shell
  #格式化之后创建物理卷
  pvcreate /dev/sd[b,c,d]1
  #查看物理卷
  pvs
  #建立卷组
  vgcreate vg1 /dev/sdb1 /dev/sdc1
  #查看卷组
  vgs
  #创建逻辑卷
  lvcreate -L 100M -n lv1 vg1
  #查看逻辑卷
  lvs
  #格式化和挂载
  mkdir /mnt/lvs1
  mkfs.xfs /dev/vg1/lv1
  mount /dev/vg1/lv1 /mnt/lvs1
  vgextend centos /dev/sdd1
  pvs
  vgs
  lvs
  lvextend -L +50G /dev/centos/root
  lvs
  df -h
  xfs_growfs /dev/centos/root
  df -h
  ```



## sar 系统状态查看

- 实例

  ```shell
  #查看CPU状态
  sar -u 1 10
  #查看内存状态
  sar -r 1 10
  #查看磁盘状态
  sar -b 1 10
  #查看每一块磁盘的读写
  sar -d 1 10
  #查看进程的状态
  sar -q 1 10
  
  #网络流量查看
  iftop
  ```

- TLDR

  ```shell
    sar
  
    Monitor performance of various Linux subsystems.
    More information: https://manned.org/sar.
  
    - Report I/O and transfer rate issued to physical devices, one per second (press CTRL+C to quit):
      sar -b 1
  
    - Report a total of 10 network device statistics, one per 2 seconds:
      sar -n DEV 2 10
  
    - Report CPU utilization, one per 2 seconds:
      sar -u ALL 2
  
    - Report a total of 20 memory utilization statistics, one per second:
      sar -r ALL 1 20
  
    - Report the run queue length and load averages, one per second:
      sar -q 1
  
    - Report paging statistics, one per 5 seconds:
      sar -B 5
  ```

  

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
#执行命令
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
  # we're not a login shell
  /etc/bashrc -> /etc/profile.d/*.sh -> /etc/profile.d/lang.sh -> /etc/sysconfig/i18n
  ```

- su - root和su root

  ```shell
  su - root
  # will expericene a login process
  # 改变用户的当前变量，重新读取root用户的环境变量配置
  su root
  # like you open an interactive shell in root name,
  # then only .bashrc will be sourced
  # 不改变用户的当前变量，只能获取权限
  ```

  

## 管道和重定向

### 管道符

### 重定向符号

- 输入重定向

  ```shell
  # <：将指定的文件作为输入
  wc -l < /etc/passwd
  read var < /root/var.txt
  ```

- 输出重定向

  ```shell
  # >：输出重定向，清空原文件的内容
  # >>：输出重定向，追加原文件的内容
  # 2>：错误输出重定向，脚本执行的错误信息重定向到文件中
  # &>：无论正确或错误的执行信息，都重定向输出到文件中
  ```

## 变量

- 几种赋值方法

  ```shell
  # 直接赋值
  a=123
  # let赋值，shell中尽量不要涉及计算
  let a=123+123
  # 将命令赋值
  l=ls
  # 将命令结果进行赋值
  let a=$(ls -l /root)
  let a=`ls -l /root`
  # 特殊字符赋值
  # ''无转义字符
  dir='/root'
  # ""有转义字符
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

  

# 文本操作

## 元字符

- 主要的元字符

  ```shell
  () #标记子表达式的开头和结尾
  {} #标记限定符表达式的开头和结尾
  . #除换行符以外的所有字符。
  ^ #字符串开头。
  $ #字符串结尾。
  \d,\w,\s #匹配数字、字符、空格。
  \D,\W,\S #匹配非数字、非字符、非空格。
  [abc] #匹配 a、b 或 c 中的一个字母。
  [a-z] #匹配 a 到 z 中的一个字母。
  [^abc] #匹配除了 a、b 或 c 中的其他字母。
  aa|bb #匹配 aa 或 bb。
  ? #0 次或 1 次匹配。
  * #匹配 0 次或多次。
  + #匹配 1 次或多次。
  {n} #匹配 n次。
  {n,} #匹配 n次以上。
  {m,n} #最少 m 次，最多 n 次匹配。
  (expr) #捕获 expr 子模式,以 \1 使用它。
  (?:expr) #忽略捕获的子模式。
  (?=expr) #正向预查模式 expr。
  (?!expr) #负向预查模式 expr。
  ```
  
- 简单示例

  ```shell
  #匹配以一个或多个数字开头，以abc结尾的字符串
  /^[0-9]+abc$/
  #匹配以小写字母、数字、-和_组成的长度为3-15的字符串
  /^[a-z0-9-_]{3,15}$/
  #匹配任意长度的正整数
  /^[1-9][0-9]*/
  #匹配1-99的正整数
  /^[1-9][0-9]?/
  /[1-9][0-9]{0,1}/
  #贪婪匹配<>
  /<.*>/
      <h1>runoob.com</h1>
  #最小匹配<>
  /<.*?>/
      <h1>
      </h1>
  #匹配以Chapter开头，两位数结尾的字符
  /^Chapter [1-9][0-9]$?/
  ```



## read 读取标准输入

- 实例

  ```shell
  #普通输入
  read var
  echo $var
  #带提示
  read -p "please enter a character:" var
  echo $var
  #-t 参数指定 read 命令等待输入的秒数，当计时满时，read命令返回一个非零退出状态
  read -t 5 -p "please enter a character in 5 seconds:" var
  echo $var
  ```

- TLDR

  ```shell
    read
  
    BASH builtin for retrieving data from standard input.
    More information: https://manned.org/read.1p.
  
    - Store data that you type from the keyboard:
      read variable
  
    - Store each of the next lines you enter as values of an array:
      read -a array
  
    - Specify the number of maximum characters to be read:
      read -n character_count variable
  
    - Use a specific character as a delimiter instead of a new line:
      read -d new_delimiter variable
  
    - Do not let backslash (\) act as an escape character:
      read -r variable
  
    - Display a prompt before the input:
      read -p "Enter your input here: " variable
  
    - Do not echo typed characters (silent mode):
      read -s variable
  
    - Read stdin and perform an action on every line:
      while read line; do echo "$line"; done
  ```



## find 文件搜索

- 一般用法

- TLDR

  ```shell
    find
  
    Find files or directories under the given directory tree, recursively.
    More information: https://manned.org/find.
  
    - Find files by extension:
      find root_path -name '*.ext'
  
    - Find files matching multiple path/name patterns:
      find root_path -path '**/path/**/*.ext' -or -name '*pattern*'
  
    - Find directories matching a given name, in case-insensitive mode:
      find root_path -type d -iname '*lib*'
  
    - Find files matching a given pattern, excluding specific paths:
      find root_path -name '*.py' -not -path '*/site-packages/*'
  
    - Find files matching a given size range:
      find root_path -size +500k -size -10M
  
    - Run a command for each file (use `{}` within the command to access the filename):
      find root_path -name '*.ext' -exec wc -l {} \;
  
    - Find files modified in the last 7 days and delete them:
      find root_path -daystart -mtime -7 -delete
  
    - Find empty (0 byte) files and delete them:
      find root_path -type f -empty -delete
  ```

  

## grep 文本搜索

- REGEXP

  ```shell
  ^    	# 锚定行的开始 如：'^grep'匹配所有以grep开头的行。    
  $    	# 锚定行的结束 如：'grep$' 匹配所有以grep结尾的行。
  .    	# 匹配非换行符的字符 如：'gr.p'匹配gr后接一个任意字符，然后是p。    
  *    	# 匹配零个或多个先前字符 如：'*grep'匹配所有一个或多个空格后紧跟grep的行。    
  .*   	# 一起用代表任意字符。   
  []   	# 匹配指定范围内的字符，如'[Gg]rep'匹配Grep和grep。    
  [^]  	# 匹配在指定范围内的字符，如：'[^A-FH-Z]rep'匹配不包含A-R和T-Z的字母开头，紧跟rep的行。 
  \(..\)  # 标记匹配字符，如'\(love\)'，love被标记为1。    
  \<      # 锚定单词的开始，如:'\<grep'匹配包含以grep开头的单词的行。    
  \>      # 锚定单词的结束，如'grep\>'匹配包含以grep结尾的单词的行。    
  x\{m\}  # 重复字符x，m次，如：'0\{5\}'匹配包含5个o的行。    
  x\{m,\} # 重复字符x,至少m次，如：'o\{5,\}'匹配至少有5个o的行。    
  x\{m,n\}# 重复字符x，至少m次，不多于n次，如：'o\{5,10\}'匹配5--10个o的行。   
  \w    	# 匹配文字和数字字符，如：'G\w*p'匹配以G后跟零个或多个文字或数字字符，然后是p。   
  \W    	# \w的反置形式，匹配一个或多个非单词字符，如点号句号等。   
  \b    	# 单词锁定符，如: '\bgrep\b'只匹配grep。 
  ```

- 常见用法

  ```shell
  #从文本中搜索root所在的行
  grep root passwd
  #从文本中搜索没有root的行
  grep -v root passwd
  #输出文本中有root的行数
  grep -c root passwd
  #带行标输出带有root的行
  grep -n root passwd
  #带坐标输出带有root的行
  grep -nb root passwd
  ```

- TLDR

  ```shell
    grep
  
    Find patterns in files using regular expressions.
    More information: https://www.gnu.org/software/grep/manual/grep.html.
  
    - Search for a pattern within a file:
      grep "search_pattern" path/to/file
  
    - Search for an exact string (disables regular expressions):
      grep --fixed-strings "exact_string" path/to/file
  
    - Search for a pattern in all files recursively in a directory, showing line numbers of matches, ignoring binary files:
      grep --recursive --line-number --binary-files=without-match "search_pattern" path/to/directory
  
    - Use extended regular expressions (supports `?`, `+`, `{}`, `()` and `|`), in case-insensitive mode:
      grep --extended-regexp --ignore-case "search_pattern" path/to/file
  
    - Print 3 lines of context around, before, or after each match:
      grep --context|before-context|after-context=3 "search_pattern" path/to/file
  
    - Print file name and line number for each match:
      grep --with-filename --line-number "search_pattern" path/to/file
  
    - Search for lines matching a pattern, printing only the matched text:
      grep --only-matching "search_pattern" path/to/file
  
    - Search stdin for lines that do not match a pattern:
      cat path/to/file | grep --invert-match "search_pattern"
  ```




## sort 排序

- 实例

  ```shell
  #普通排序
  sort /etc/passwd
  #忽略相同行排序
  sort -u /etc/passwd
  #忽略字母，单独按照数字排序
  sort -n /etc/passwd
  #倒序
  sort -r /etc/passwd
  #指定第三列为关键字
  sort -k3 /etc/passwd
  #指定分隔符
  sort -t: /etc/passwd
  #从用户名的第二个字母开始排列
  sort -t: -k1.2 /etc/passwd
  #从用户名的第二个字母开始排列，如果相同则按照用户ID数字开始排列
  sort
  #分隔符为 ，以第三列数字倒序排列，如果相同，则以第二轮升序排序
  sort -t' '  -nr -k3 -k2 facebook.txt
  ```

- TLDR

  ```shell
    sort
  
    Sort lines of text files.
    More information: https://www.gnu.org/software/coreutils/sort.
  
    - Sort a file in ascending order:
      sort path/to/file
  
    - Sort a file in descending order:
      sort --reverse path/to/file
  
    - Sort a file in case-insensitive way:
      sort --ignore-case path/to/file
  
    - Sort a file using numeric rather than alphabetic order:
      sort --numeric-sort path/to/file
  
    - Sort `/etc/passwd` by the 3rd field of each line numerically, using ":" as a field separator:
      sort --field-separator=: --key=3n /etc/passwd
  
    - Sort a file preserving only unique lines:
      sort --unique path/to/file
  
    - Sort a file, printing the output to the specified output file (can be used to sort a file in-place):
      sort --output=path/to/file path/to/file
  
    - Sort numbers with exponents:
      sort --general-numeric-sort path/to/file
  ```

## cut 文本过滤

- 用法说明

  ```shell
  N-		#从第N个字符到结尾
  N-M		#从第N个字符到第M个字符
  -M		#从开始到第M个字符
  -b		#处理的是字节
  -c		#处理的是字符
  -f		#处理的是字段
  ```

- 一般用法

  ```shell
  #输出文件中的第三列
  cut -f3 passwd
  #指定分隔符号
  cut -f3 -d: passwd
  #输出文件中的第一第三列
  cut -f1,3 -d: passwd
  #输出文件中的第三列到第五列
  cut -f1-3 -d: passwd
  #输出文件中除了第四五六列的内容
  cut -f1,3 -d: --complement passwd
  #输出文件中的前三列内容
  cut -f-3 -d: passwd
  
  #输出文件中从第三列开始到最后一列的内容
  cut -f3- -d: passwd
  #输出每行中的第三到第五个字符
  cut -c3-5 passwd
  #输出每行中的第三个和第五个字符
  cut -c3,5 passwd
  #输出每行中的前五个字符
  cut -c-5 passwd
  #输出每行中从第三个开始到最后一个字符
  cut -c3- passwd
  ```

- TLDR

  ```shell
    cut
  
    Cut out fields from stdin or files.
    More information: https://www.gnu.org/software/coreutils/cut.
  
    - Cut out the first sixteen characters of each line of stdin:
      cut -c 1-16
  
    - Cut out the first sixteen characters of each line of the given files:
      cut -c 1-16 file
  
    - Cut out everything from the 3rd character to the end of each line:
      cut -c 3-
  
    - Cut out the fifth field of each line, using a colon as a field delimiter (default delimiter is tab):
      cut -d':' -f5
  
    - Cut out the 2nd and 10th fields of each line, using a semicolon as a delimiter:
      cut -d';' -f2,10
  
    - Cut out the fields 3 through to the end of each line, using a space as a delimiter:
      cut -d' ' -f3-
  
  ```

  

## sed 文本替换

### sed元字符集

```shell
^ # 匹配行开始，如：/^sed/匹配所有以sed开头的行。
$ # 匹配行结束，如：/sed$/匹配所有以sed结尾的行。
. # 匹配一个非换行符的任意字符，如：/s.d/匹配s后接一个任意字符，最后是d。
* # 匹配0个或多个字符，等价于{0,}，如：/*sed/匹配所有模板是一个或多个空格后紧跟sed的行。
[] # 匹配一个指定范围内的字符，如/[sS]ed/匹配sed和Sed。  
[^] # 匹配一个不在指定范围内的字符，如：/[^A-RT-Z]ed/匹配不包含A-R和T-Z的一个字母开头，紧跟ed的行。
\(..\) # 匹配子串，保存匹配的字符，如s/\(love\)able/\1rs，loveable被替换成lovers。
& # 保存搜索字符用来替换其他字符，如s/love/ **&** /，love这成 **love** 。
\< # 匹配单词的开始，如:/\<love/匹配包含以love开头的单词的行。
\> # 匹配单词的结束，如/love\>/匹配包含以love结尾的单词的行。
x\{m\} # 重复字符x，m次，如：/0\{5\}/匹配包含5个0的行。
x\{m,\} # 重复字符x，至少m次，如：/0\{5,\}/匹配至少有5个0的行。
x\{m,n\} # 重复字符x，至少m次，不多于n次，如：/0\{5,10\}/匹配5~10个0的行。 
```

### 打印模式：p

```shell
#每一行输出两次
sed 'p' passwd
#每一行输出一次
sed n '1p' passwd
#输出第一到三行
sed n '1,3p' passwd
#打印Jason所在行
sed -n '/Jason/p' passwd
#打印Jason至Jane所在行
sed -n '/Jason/,/Jane/p' passwd
#打印103开头的行
sed -n '/^103/p' passwd
#打印以manager结尾的行
sed -n '/manager$/p' passwd
#以连续三个数字开头的行
sed -n '/[^0-9]\{3\}/p' passwd
#从第一行开始打印，步长2
sed -n '1~2p' passwd
#从第二行开始打印，步长3
sed -n '2~3p' passwd
#打印uid为0或1的行
sed -n '/x:[0|1]:/p' passwd
```

### 替换操作：s

```shell
sed '[address-range|pattern-range] s/originalstring/replacement-string/[substitute-flags]' inputfile

#把每一行的：替换成-
sed 's/:/-/' /etc/passwd
#把所有的：替换成-
sed 's/:/-/g' /etc/passwd
#把文件中所有的：替换成-，结果写入文件
sed -i 's/:/-/g' /etc/passwd
#把文件中带有root的行整行删除
sed '/root/d' /etc/passwd
#把文件中所有的root都替换成---------
sed '/root/ s/root/---------/g' passwd
#多次匹配，把：和x替换成-
sed -e 's/:/-/g' -e 's/x/-/g' passwd
#把分隔符换成#
sed 's#:#-#g' passwd
#从第三个匹配到的字符开始替换
sed 's/:/-/3g' passwd
#把第二到第五行的manager替换成guozi
sed '2,5 s/manager/guozi/' passwd
#把john所在字符串的行里的manager替换成guozi
sed '/john/ s/manager/guozi/' passwd
#把第四行且包含字符串ram的行中，把developer替换成user
sed '4,/ram/ s/developer/user/' passwd
#把带有john的行，给john替换成[john]
sed 's/john/[&]/' passwd
#把以三个小写字母开头的行，加上{}
sed 's/^[a-z]\{3,\}/{&}/' passwd
#删除所有行的第一个字符
sed 's/^[a-z0-9]//' passwd
sed 's/^.//' passwd
#删除所有行的第三个字符
sed 's/.//3' passwd
#匹配所有的注释行中带#号的内容，把，后面的内容都删掉
sed '/#/ s/,.*//' passwd
#在每行的结尾加上#
sed 's/&/#/' passwd
#在ifconfig的信息中，找到各网卡对应的ipv4地址，并用{}标记
ifconfig | sed 's/\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}/{&}/'
```

### 删除操作：d

```shell
#删除空白行
sed '/^$/d' passwd
#删除文件的第二行
sed '2d' passwd
#删除文件第二行到末尾所有行
sed '2,$d' passwd
#删除第二行到第四行之外的所有行
sed '2，4!d' passwd
#删除文件最后一行
sed '$d' passwd
#删除文件中所有test开头的行
sed '/^test/d' passwd
#删除所有的注释和空白行
sed -e '/^$/d' -e '/^#.*/d' passwd
#附加行号并且删除第二到第五行
nl passwd | sed '2,5d' passwd
#删除从adm到最后一行
sed '/adm/,$d' passwd
#删除adm及其后一行
sed '/adm/,+1d' passwd
#删除1-5行中匹配root的行
sed '1,5{/root/d}' passwd
```

### 附加操作：a

```shell
sed '[address] a the-line-to-append' input-file
#在文件的第二行后加多一行------------------
sed '2 a ----------------' passwd
#在文件的最后一行后加多一行-----------------
sed '$ a ----------------' passwd
#在root所在行后加一行--------------
sed '/root/ a -------------' passwd
```

### 插入操作：i

```shell
sed '[address] i the-line-to-insert' input-file
#在文件的第二行前加多一行------------------
sed '2 i ----------------' passwd
#在文件的最后一行前加多一行-----------------
sed '$ i ----------------' passwd
#在root所在行前加一行--------------
sed '/root/ i -------------' passwd
```

### TLDR

```shell
  sed

  Edit text in a scriptable manner.
  More information: https://www.gnu.org/software/sed/manual/sed.html.

  - Replace the first occurrence of a regular expression in each line of a file, and print the result:
    sed 's/regular_expression/replace/' filename

  - Replace all occurrences of an extended regular expression in a file, and print the result:
    sed -r 's/regular_expression/replace/g' filename

  - Replace all occurrences of a string in a file, overwriting the file (i.e. in-place):
    sed -i 's/find/replace/g' filename

  - Replace only on lines matching the line pattern:
    sed '/line_pattern/s/find/replace/' filename

  - Delete lines matching the line pattern:
    sed '/line_pattern/d' filename

  - Print the first 11 lines of a file:
    sed 11q filename

  - Apply multiple find-replace expressions to a file:
    sed -e 's/find/replace/' -e 's/find/replace/' filename

  - Replace separator `/` by any other character not used in the find or replace patterns, e.g. `#`:
    sed 's#find#replace#' filename
```



## awk 文本和数据处理

```shell
cut -d : -f 1 /etc/passwd
awk -F: '/wd$/{print $1}' /etc/passwd
#找到端口为22的所有pid
netstat -antup | grep :22 | awk '{print $7}' | sed 's|/.\{0,\}||'
```

### 内置变量

- 说明

  ```shell
  NR			总行数 number of rows
  NF			总列数 number of fields
  $0			整行
  $1			第一列的数据
  $2			第二列的数据
  $NF			最后一列
  $(NF-1)		倒数第二列
  ```

- 实例

  ```shell
  #输出每一行的行标
  ps | awk '{print NR}'
  #输出每一行的总列数
  ps | awk '{print NF}'
  #输出一整行
  ps | awk '{print $0}'
  ps | awk '{print}'
  #输出每行的第一列
  ps | awk '{print $1}'
  #在每一行的前面附加当前行号和当前行的列数
  ps | awk '{print NR "\t" NF "\t" $0}'
  #输出每一行的最后一列
  ps | awk '{print $NF}'
  #输出每一行的倒数第二列
  ps | awk '{print $(NF-1)}'
  #输出每一行的第三列和第四列
  ps | awk '{print $3,$4}'
  ```

### 外部变量

- 实例

  ```shell
  VAR=1000
  echo | awk -v VARIABLE=$VAR '{print VARIABLE}'
  
  var1="aaa"
  var2="bbb"
  echo | awk '{print v1,v2}' v1=$var1 v2=$var2
  ```

### 运算和判断

- 实例

  ```shell
  #所用非操作数在用算数运算符操作时，自动转换为0
  #算术运算符有+ - * / &求余 !逻辑非 ^求幂 ++ --
  #赋值运算符= += -= *= /= %= ^=
  awk 'BEGIN{a="b"; print a++, ++a}'
  #||逻辑或 &&逻辑与
  awk 'BEGIN{a=1;b=2;print (a>5 && b<2), (a>5 || b<=2);}'
  #正则运算符 ~匹配 !~不匹配
  awk 'BEGIN{a="100testa"; if(a ~ /^100*/){print "ok";}}'
  #关系运算符 < <= > >= != ==
  awk 'BEGIN{a=11;if(a >= 9){print "ok";}}'
  awk 'BEGIN{a="b";print a=="b"?"ok":"err";}'
  awk 'BEGIN{a="a";arr[0]="b";arr[1]="c";print (a in arr);}'
  ```

### 高级输入输出



### TLDR

```shell
  awk

  A versatile programming language for working on files.
  More information: https://github.com/onetrueawk/awk.

  - Print the fifth column (a.k.a. field) in a space-separated file:
    awk '{print $5}' filename

  - Print the second column of the lines containing "foo" in a space-separated file:
    awk '/foo/ {print $2}' filename

  - Print the last column of each line in a file, using a comma (instead of space) as a field separator:
    awk -F ',' '{print $NF}' filename

  - Sum the values in the first column of a file and print the total:
    awk '{s+=$1} END {print s}' filename

  - Print every third line starting from the first line:
    awk 'NR%3==1' filename

  - Print different values based on conditions:
    awk '{if ($1 == "foo") print "Exact match foo"; else if ($1 ~ "bar") print "Partial match bar"; else print "Baz"}' filename

  - Print all lines where the 10th column value equals the specified value:
    awk '($10 == value)'

  - Print all the lines which the 10th column value is between a min and a max:
    awk '($10 >= min_value && $10 <= max_value)'
```





# firewalld

## 命令对照表

| firewall-cmd命令                       | 说明                                                         |
| -------------------------------------- | ------------------------------------------------------------ |
| --get-default-zone                     | 查询当前默认区域                                             |
| --set-default-zone=                    | 设置默认区域，会更改运行时和永久配置                         |
| --get-zones                            | 列出所有可用区域                                             |
| --get-active-zones                     | 列出正在使用的所有区域（具有关联的接口或源）机器接口和源信息 |
| --add-source= [--zone=]                | 将来自IP地址或网络/子网掩码的所有流量路由到指定区域。        |
| --remove-source= [--zone=]             | 从指定区域中删除用于路由来自IP地址或网络/子网掩码的所有流量的规则 |
| --add-interface=[--zone=]              | 将来自的所有流量路由到指定区域                               |
| --change-interface=[--zone=]           | 将接口与而非其当前区域关联                                   |
| --list-all [--zone=]                   | 列出的所有已配置接口、源、服务和端口                         |
| --list-all-zones                       | 检索所有区域的所有信息（接口、源、端口、服务等）             |
| --add-service=[--zone=]                | 允许到的流量                                                 |
| --add-port=<PORT/PROTOCOL>[--zone=]    | 允许到<PORT/PROTOCOL>端口的流量                              |
| --remove-service=[--zone=]             | 从区域允许列表中删除                                         |
| --remove-port=<PORT/PROTOCOL>[--zone=] | 从区域允许列表中删除<PORT/PROTOCOL>端口                      |
| --reload                               | 丢弃运行时配置，并应用持久配置                               |



## 基本启动命令

```shell
    $ systemctl status firewalld                # 查看状态
    $ systemctl start firewalld                  # 启动
    $ systemctl stop firewalld                  #关闭
    $ systemctl enable firewalld              # 开机启动
    $ systemctl disable firewalld             # 取消开机启动
```

## 查看命令

```shell
   $ firewall-cmd --get-active-zones   # 查看激活的域
   $ firewall-cmd --zone=public --list-ports  # 查看开放的端口
   $ firewall-cmd --zone=public --list-rich-rules  # 查看添加的规则
```

## 添加和移除端口端口

```shell
# 开放单个端口
$ firewall-cmd --zone=public --add-port=80/tcp --permanent                     

# 开放端口范围
$ firewall-cmd --zone=public --add-port=8388-8389/tcp --permanent        

# 对 147.152.139.197 开放10000端口
$ firewall-cmd --permanent --zone=public --add-rich-rule='
        rule family="ipv4"
        source address="147.152.139.197/32"
        port protocol="tcp" port="10000" accept'       
        
# 拒绝端口：
$ firewall-cmd --permanent --zone=public --add-rich-rule='
              rule family="ipv4"
              source address="47.52.39.197/32"
              port protocol="tcp" port="10000" reject'  

# 开放全部端口给IP
$ firewall-cmd --permanent --zone=public --add-rich-rule='
              rule family="ipv4"
              source address="192.168.0.1/32" accept';
# 开放全部端口给网段
$ firewall-cmd --permanent --zone=public --add-rich-rule='
              rule family="ipv4"
              source address="192.168.0.0/16" accept';
# 移除添加的端口
$ firewall-cmd --zone=public --remove-port=80/tcp --permanent   
#对路由规则进行修改后，需要重新加载规则才能使规则生效
$ firewall-cmd --reload
```

## 添加服务

```shell
# 查看全部支持的服务
$ firewall-cmd --get-service
# 查看开放的服务
$ firewall-cmd --list-service
# 添加服务,添加https
$ firewall-cmd --add-service=https --permanent
```

## 配置文件

```shell
/etc/firewalld/zones/public.xml
/usr/lib/firewalld/zones/
参考博客:https://juejin.cn/post/6994679433470869511
```

