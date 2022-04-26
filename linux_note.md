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
- group p
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
  wget -O /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-vault-8.5.2111.repo
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
  #查看CPU装填
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



# mysql

## MySQL安装和配置

- 配置mysql的yum源

```shell
cd /etc/yum.repos.d/
wget -c https://dev.mysql.com/get/mysql80-community-release-el7-4.noarch.rpm
yum cleanall
yum makcecache
#搜索mysql的包，如果状态是enable说明没问题
yum list | grep mysql
```

- 卸载原有的mysql

```shell
#查找系统中安装的mysql
yum list installed | grep mysql
yum list installed | grep mariadb
rpm -qa | grep mysql
rpm -qa | grep mariadb
#如果有使用相应的卸载命令卸载
yum remove mariadb
#删除旧版本的配置文件
/etc/my.cnf
/etc/my.cnf.d
```

- 安装mysql

```shell
#创建mysql相关的用户和文件夹
groupadd mysql
useradd -g mysql mysql
passwd mysql
#创建安装目录
#一般安装在
mkdir /usr/local/mysql
#我选择安装在
mkdir /opt/software/mysql
#修改相应的权限
chown mysql /opt/software/mysql
chgrp mysql /opt/software/mysql
#安装，有可能会提示GPGkey校验错误，不检查GPGkey
yum install mysql-community-server.x86_64 --nogpgcheck
```

- 启动mysql

```shell
#启动mysql服务
systemctl start mysqld
#查看mysql服务状态
systemctl start mysqld
#设置mysql开机启动
systemctl enable mysqld
```

- 配置mysql密码

```shell
#查看初始密码
#mysql在安装后会创建一个root@localhost账户，初始密码保存在/var/log/mysqld.log文件中
grep "password" /var/log/mysqld.log
#使用初始密码登录后，修改密码
mysql -uroot -p
#初始密码策略要求比较复杂，可以登录后更改密码策略
ALTER USER 'root'@'localhost' IDENTIFIED BY 'Aa@123456'
#查看当前密码策略
SHOW VARIABLES LIKE 'validate_password%';
#设置密码策略
#要求密码长度最少为4，如果少于4，会自动改为4
#验证密码的复杂程度
set global validate_password.policy=0;
#验证密码的最小长度
set global validate_password.length=4;
#用户名检查，密码和用户名不能相同
set global validate_password.check_user_name=off;
#修改密码
ALTER USER 'root'@'localhost' IDENTIFIED BY 'Liang123'
#配置远程登录
create user 'root'@'%' identified by 'Liang123'
#刷新配置
flush privileges
```

- 外部链接mysql

```shell
#查看防火墙状态
systemctl status firewalld
#开启防火墙
systemctl start firewalld
#查看已开放端口
firewall-cmd --list-ports
#开放3306端口
firewall-cmd --zone=public --add-port=3306/tcp --permanent
#关闭指定端口
firewall-cmd --zone=public --remove-port=3306/tcp --permanent
#重启防火墙
firewall-cmd reload
```

- 修改加密规则

```shell
#一般还需要修改下mysql8登录用户的加密规则，因为mysql8之前的版本中加密规则是mysql_native_password，而在mysql8后，加密规则改为了caching_sha2_password。如果不更改，在用Navicat连接时会报错误
select host,user,plugin,authentication_string from mysql.user;
alter user 'root'@'%' identified with mysql_native_password by 'Liang123';
```

## 常用数据库命令

```sql
#查看数据库版本
select version();
#退出数据库
quit;
#显示数据库
show databases;
#使用数据库
use databases_name;
#显示数据库中的表
show tables;
#显示具体的表内容
descibe tables_name;
```

## MySQL忘记密码

```shell
#首先关闭mysql服务
systemctl stop mysqld
#查看服务状态是否关闭
systemctl status mysqld
#关闭后编辑MySQL的配置文件my.cnf
vim /etc/my.cnf
#找到MySQLd，在最下面添加一行skip-grant-tables
skip-grant-tables

#此时可以不需要密码登录MySQL，直接回车即可
mysql -uroot -p
#8.0版本以上刷新权限后可以直接修改用户密码
flush privileges;
alter user 'root'@'localhost' identified by 'Liang123@';
#8.0以下版本需要修改user表中的字段
use mysql
update user set authentication_string=password('Liang123@') where user='root' and host='localhost';
#修改完密码之后需要刷新权限
flush privileges;
#退出之后把配置文件的内容注释掉后，重新启动mysql服务，之后就可以使用新密码登录
vim /etc/my.cnf
skip-grant-tables
systemctl start mysqld
#使用新密码登录时后重新修改密码需要一个复杂的密码，这时候可以修改密码策略
SHOW VARIABLES LIKE 'validate_password%';
set global validate_password.policy=0;
flush privileges;
#重新修改密码即可
alter user 'root'@'localhost' identified by 'Liang123';
flush privileges;
```

## MySQL全量备份

- 参考链接

  ```shell
  https://juejin.cn/post/6844903670199353357
  ```

- 全量备份指令

  ```shell
  mysqldump -uroot -pLiang123 --lock-all-tables --flush-logs mysql > /root/mysql/mysql.sql
  #指令含义
  #--flush-logs:使用一个新的日志文件来记录接下来的日志
  #--lock-all-tables：锁定所有数据库
  ```

- 恢复全量备份指令

  ```shell
  mysql -h localhost -uroot -pLiang123 < /root/mysql/mysql.sql
  ```

- 全量备份脚本实例

  ```shell
  #!/bin/bash
  #数据库用户名、密码和数据库名
  username="root"
  password="Liang123"
  db_name="mysql"
  #获取当前时间
  date_now=$(date "+%Y%m%d-%H%M%S")
  #设置备份目标文件夹
  backupFolder=/root/mysql/
  #定义备份文件名
  filename="${db_name}_${date_now}.sql"
  #定义备份文件路径
  backupFilePath="${backupFolder}/${filename}"
  #输出提示
  echo "starting backup mysql ${db_name} at ${date_now}."
  #执行备份
  mysqldump -u${username} -p${password} --lock-all-tables --flush-logs ${db_name} > ${backupFilePath}
  #进入备份目录
  cd ${backupFolder}
  #压缩备份文件
  tar czf ${filename}.tar.gz ${filename}
  ```

## MySQL增量备份



## MySQL备份定时任务

```shell
#具体查看shell脚本中的计划任务
crontab -e
0 0 * * 7 sh /root/Documents/linux/shell/mysql_backup
crontab -l
```



## 菜鸟MySQL

```mysql
select distinct country from websites
select country from websites limit 2
select device_id as user_infos_example from user_profile limit 2
select device_id, gender, age, university from user_profile where age > 24
select * from websites where country = 'CN'
select * from websites where id = 1
select * from emp where comm is null
select * from emp where sal between 1500 and 3000
select * from websites where alexa between 1 and 20
select * from websites where alexa not between 1 and 20
select * from websites where (alexa between 1 and 20) and country not in ('USA' and 'IND')
select * from websites where name between 'A' and 'H'
select * from websites where name not between 'A' and 'H'
select * from access_log where date between '2016-05-10' and '2016-05-14'
select * from emp where sal in (5000,3000,1500)
select * from websites where name in ('Google', '菜鸟教程')
select * from emp where ename like 'M%'
select * from emp where ename like 'M_'
select * from emp where enmae like '%M%'
select * from emp where ename like '%M_'
select * from websites where country = 'USA' or country = 'CN'
select * from websites where alexa > 15 and (country = 'CN' or country = 'USA')
select * from websites order by alexa
select * from websites order by alexa desc
select * from websites order by country, alexa
insert into websites (name, url ,alexa, country) values ('百度', 'https://www.baidu.com/', 'CN')
insert into websites values ('百度', 'https://www.baidu.com/',  '4', 'CN')
update websites set alexa = '5000', country = 'USA' where name = '菜鸟教程'
delete from websites where name = 'facebook' and country = 'USA'
delete * from websites
select * from persons limit 5
select top 50 percent * from websites
select top 50 percent * from websites order by id desc
select * from websites where name like '%k'
select * from websites where name like 'G%'
select * from websites where name like '%oo%'
select * from websites where name not like '%oo%'
select * from websites where url like 'https%'
select * from websites where name like '_o%'
select * from websites where name like 'G_o_le'
select * from websites where name regexp '^[GFs]'
select * from websites where name regexp '^[A-H]'
select * from websites where name regexp '^[^A-H]'
select name as n, country as c from websites
select name, concat(url, ',', alexa, ',', country) as site_info from websites
select * into websitesBackup from websites
select name, url into websitesBackup from websites
select * into websitesBackup from websites where country = 'CN'

select w.name, w.url, a.count, a.date from websites as w, access_log as a 
where a.site_id = w.id and w.name = '菜鸟教程'

SELECT Websites.name, Websites.url, access_log.count, access_log.date
FROM Websites, access_log
WHERE Websites.id=access_log.site_id and Websites.name="菜鸟教程";

select websites.id, websites.name, access_log.count, access_log.date
from websites 
inner join access_log 
on websites.id = access_log.site_id

select websites.name, access_log.count, access_log.date
from websites
inner join access_log
on websites.id = access_log.site_id
order by access_log.count

select websites.name, access_log.count, access_log.date
from websites
left join access_log
on websites.id = access_log.site_id
order by access_log.count desc

select websites.name, access_log.count, access_log.date
from websites
right join access_log
on access_log.site_id = websites.id
order by access_log.count desc

select websites.name, access_log.count, access_log.date
from websites
full outer join access_log
on websites.id = access_log.site_id
order by access_log.count desc

--union可以合并两个或多个select语句的结果，这个结果必须是相同性质的
select country from websites
union
select country from apps
order by country

select country fron websites
union all
select country from apps
order by country

select country, name from websites where country = 'CN'
union all
select country, app_name from apps where country = 'CN'
order by country

select websites.name, access_log.count, access_log.date
into websitesBackup
from websites
left join access_log
on websites.id = access_log.site_id

insert into websites (name, country)
select app_name, country from apps

insert into websites (name, country)
select app_name, country from apps
where id = 1

create database my_db

create table persons
(
    personID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255),
)

create table persons
(
    personID int not null,
    LastName varchar(255) not null,
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255),
    primary key (personID)
)

create table persons
(
    personID int not null primary key,
    LastName varchar(255) not null,
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
)

create table if not exists persons
(
    id bigint auto_increment comment '主键',
    name varchar(20) not null comment '人员姓名',
    work_id bigint not null comment '工作id',
    create_time date default '2021-08-24',
    primary key(id),
    foreign key(work_id) references work(id)
)

create table if not exists work
(
    id bigint auto_increment comment '主键',
    name varchar(20) not null comment '工作名称',
    create_time date default '2021-08-24',
    primary key(id)
)

create table persons
(
    id int not null,
    name varchar(255) not null,
    age int
)

alter table persons
modify age int not null

alter table persons
modify age int null

create table persons
(
    id int not null,
    LastName varchar(255) not null,
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255),
    unique(id)
)

create table persons
(
    id int not null unique,
    LastName varchar(255) not null,
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
)

alter table persons
add unique id

alter table persons
drop index id

create table persons
(
    id int not null primary key,
    LastName varchar(255) not null,
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
)

create table persons
(
    id int not null,
    LastName varchar(255) not null,
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255),
    primary key(id)
)

create table persons
(
    id int not null,
    LastName varchar(255) not null,
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255),
    constraint pk_personid primary key (id, LastName)
)

alter table persons
add primary key(id)

alter table persons
add constraint pk_personid primary key(id, LastName)

alter table persons
drop primary key

alter table persons
drop constraint pk_personid

create table orders
(
    O_id int not null,
    orderNo int not null,
    P_id int,
    primary key(O_id)
    foreign key(P_id) references persons(P_id)
)

create table orders
(
    O_id int not null primary key,
    orderNo int not null,
    P_id int foreign key references persons(P_id)
)

alter table orders
drop foreign key fk_PerOrders

create table persons
(
    P_id int not null,
    LastName varchar(255) not null,
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255),
    check (P_id > 0)
)

create table persons
(
    P_id int not null check (P_id > 0),
    LastName varchar(255) not null,
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
)

create table persons
(
    P_id int not null,
    LastName varchar(255) not null,
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
    constraint chk_person check (P_id > 0 and City = 'Sandnes')
)

alter table persons
add check (P_id > 0)

alter table persons
add constraint chk_person check check (P_id > 0 and City = 'Sandnes')

alter table persons
drop constraint chk_person

alter table persons
drop check chk_person

create table persons
(
    P_id int not null,
    LastName varchar(255) not null,
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255) default 'Sandnes'
)

create table orders
(
    O_id int not null,
    orderNo int not null,
    P_id int,
    orderDate date default getdate()
)

alter table persons
alter City set default 'sandnes'

alter table persons
alter city drop default

create index PIndex
on persons (LastName)

create index PIndex
on persons (LastName, FirstName)

drop index index_name on table_name
drop index table_name.index_name

drop table table_name

drop database database_name

truncate table table_name

alter table persons
add dateOfBirth date

alter table persons
alter column dateOfBirth year

alter table persons
drop column dateOfBirth

create table persons
(
    id int not null auto_increment,
    LastName varchar(255) not null,
    FirstName varchar(255),
    Address varchar(255),
    city varchar(255),
    primary key(id)
)

alter table persons auto_increment = 100

insert into persons (FirstName, LastName)
values ('Lars', 'Monsen')


create table persons
(
    id int identity(1,1) primary key,
    LastName varchar(255) not null,
    FirstName varchar(255),
    Address varchar(255),
    city varchar(255)
)

create view [Current Product List] as
select ProductID, ProductName
from Products
where Discontinued = No

select * from [Current Product List]

create view[Products Above Average Price] as
select ProductName, UnitPrice
from Products
where UnitPrice > (select avg(UnitPrice) from Products)

select * from [Products Above Average Price]

create view [Category Sales For 1997] as
select distinct CategoryName, Sum(ProductSales) as CategorySales
from [Product Sales for 1997]
group by CategoryName

select * from [Category Sales For 1997]

select * from [Category Sales For 1997]
where CategoryName = 'Beverages'

create view [Current Product List] as
select ProductID, ProductName, Category
from Products
where Discontinued = No

drop view view_name

NOW()	返回当前的日期和时间
CURDATE()	返回当前的日期
CURTIME()	返回当前的时间
DATE()	提取日期或日期/时间表达式的日期部分
EXTRACT()	返回日期/时间的单独部分
DATE_ADD()	向日期添加指定的时间间隔
DATE_SUB()	从日期减去指定的时间间隔
DATEDIFF()	返回两个日期之间的天数
DATE_FORMAT()	用不同的格式显示日期/时间

AVG() - 返回平均值
COUNT() - 返回行数
FIRST() - 返回第一个记录的值
LAST() - 返回最后一个记录的值
MAX() - 返回最大值
MIN() - 返回最小值
SUM() - 返回总和

UCASE() - 将某个字段转换为大写
LCASE() - 将某个字段转换为小写
MID() - 从某个文本字段提取字符，MySql 中使用
SubString(字段，1，end) - 从某个文本字段提取字符
LEN() - 返回某个文本字段的长度
ROUND() - 对某个数值字段进行指定小数位数的四舍五入
NOW() - 返回当前的系统日期和时间
FORMAT() - 格式化某个字段的显示方式

```



## 牛客MySQL

```mysql
select device_id, gender, age, university from user_profile
select * from user_profile
select distinct university from user_profile

SELECT device_id 
from user_profile 
limit 2

select device_id as user_infos_example 
from user_profile 
limit 2

select device_id, university 
from user_profile 
where university = '北京大学'

select device_id, gender, age, university 
from user_profile 
where age > 24

select device_id, gender, age 
from user_profile 
where age between 20 and 23

SELECT device_id, gender, age, university 
from user_profile 
where university not like '复旦大学'

select device_id, gender, age, university 
from user_profile 
where age is not null

SELECT device_id, gender, age, university, gpa 
from user_profile 
where gpa > 3.5 and gender = 'male'

SELECT device_id, gender, age, university, gpa 
from user_profile 
where university = '北京大学' or gpa > 3.7

select device_id, gender, age, university, gpa 
from user_profile 
where university in ('北京大学', '复旦大学', '山东大学')

select device_id, gender, age, university, gpa 
from user_profile 
where (gpa > 3.5 and university = '山东大学') 
or (gpa > 3.8 and university = '复旦大学')

select device_id, age, university from user_profile where university like '%北京%'

select max(gpa) as gpa
from user_profile
where university='复旦大学';

select gpa
from user_profile
where university='复旦大学'
order by gpa desc limit 1

select 
  count(gender) as male_num,
  round(avg(gpa), 1) as avg_gpa
from user_profile where gender="male";

select 
    gender, university,
    count(device_id) as user_num,
    avg(active_days_within_30) as avg_active_days,
    avg(question_cnt) as avg_question_cnt
from user_profile
group by gender, university

select
    university,
    avg(question_cnt) as avg_question_cnt,
    avg(answer_cnt) as avg_answer_cnt
from user_profile
group by university
having avg_question_cnt<5 or avg_answer_cnt<20

select university,
    avg(question_cnt) as avg_question_cnt
from user_profile
group by university
order by avg_question_cnt

select qpd.device_id, qpd.question_id, qpd.result
from question_practice_detail as qpd
inner join user_profile as up
on up.device_id=qpd.device_id and up.university='浙江大学'

SELECT up.university,
    COUNT(qpd.question_id) / COUNT(DISTINCT(qpd.device_id)) as avg_answer_cnt
FROM user_profile AS up
inner join question_practice_detail AS qpd
ON up.device_id = qpd.device_id
GROUP BY university

SELECT up.university, qd.difficult_level,
    COUNT(qpd.question_id) / COUNT(DISTINCT(qpd.device_id)) AS avg_answer_cnt
FROM user_profile AS up
JOIN question_practice_detail AS qpd
ON up.device_id = qpd.device_id
JOIN question_detail AS qd
on qpd.question_id = qd.question_id
GROUP BY up.university, qd.difficult_level

SELECT up.university, qd.difficult_level, 
    COUNT(qpd.question_id) / COUNT(DISTINCT up.device_id) AS avg_answer_cnt
FROM user_profile AS up
INNER JOIN question_practice_detail AS qpd
    ON up.device_id = qpd.device_id
INNER JOIN question_detail AS qd
    ON qpd.question_id = qd.question_id
WHERE university = '山东大学'
GROUP BY qd.difficult_level



SELECT device_id,gender,age,gpa
FROM user_profile
WHERE university = '山东大学'
UNION ALL
SELECT device_id,gender,age,gpa
FROM user_profile
WHERE gender = 'male'

SELECT
    CASE
    WHEN age < 25 OR age IS NULL THEN '25岁以下'
    WHEN age >= 25 THEN '25岁及以上'
    END AS age_cut,
    COUNT(device_id) AS number
FROM user_profile
GROUP BY age_cut

SELECT device_id, gender,
    CASE
        when age >= 25 then '25岁及以上'
        when age >= 20 then '20-24岁'
        when age < 20 then '20岁以下'
        ELSE '其他'
    END AS age_cut
FROM user_profile

select
    DAY(qpd.date) AS day,
    COUNT(question_id) AS question_cnt
FROM question_practice_detail AS qpd
WHERE YEAR(qpd.date) = 2021 and MONTH(qpd.date) = 8
GROUP BY day

#将给定的表格数据分成三份来看，默认qpd1中的数据为第一天，qpd2中为第二天
#如果qpd1中的日期和qpd2中的日期接得上，说明是连续刷题,前提是同一台设备
#留存率的计算首先要确保是单独、不重复的计数
#每台设备每天来一次可以算起来做分母
#每台设备连续两天都刷题可以算计一次分子
select 
    COUNT(DISTINCT qpd1.device_id, qpd2.device_id, qpd1.date, qpd2.date) 
    / COUNT(DISTINCT qpd3.device_id, qpd3.date)
    AS avg_ret
FROM
    question_practice_detail AS qpd1,
    question_practice_detail AS qpd2,
    question_practice_detail AS qpd3
WHERE
    qpd1.device_id = qpd2.device_id
    and DATE_ADD(qpd1.date, INTERVAL 1 DAY) = qpd2.date

SELECT
    case
        when us.profile like '%,male' then 'male'
        when us.profile like '%,female' then 'female'
    end gender, count(device_id) AS number
from user_submit AS us
GROUP BY gender

SELECT 
    SUBSTRING_INDEX(profile,",",-1) gender,
    COUNT(device_id) AS number
FROM user_submit 
GROUP BY gender;

SELECT
    device_id,
    SUBSTRING_INDEX(blog_url, '/', -1) AS user_name
FROM user_submit

select 
-- 替换法 replace(string, '被替换部分','替换后的结果')
-- device_id, replace(blog_url,'http:/url/','') as user_name
-- 截取法 substr(string, start_point, length*可选参数*)
-- device_id, substr(blog_url,11,length(blog_url)-10) as user_nam
-- 删除法 trim('被删除字段' from 列名)
-- device_id, trim('http:/url/' from blog_url) as user_name
-- 字段切割法 substring_index(string, '切割标志', 位置数（负号：从后面开始）)
device_id, substring_index(blog_url,'/',-1) as user_name
from user_submit;

SELECT a.device_id, a.university, a.gpa
FROM(
    SELECT *,
    RANK() over(PARTITION BY university ORDER BY gpa) AS ranking1,
    DENSE_RANK() over(PARTITION BY university ORDER BY gpa) AS ranking2,
    ROW_NUMBER() over(PARTITION BY university ORDER BY gpa) AS ranking3
    FROM user_profile
) AS a
WHERE a.ranking1=1

select up.device_id, '复旦大学',
    count(question_id) as question_cnt,
    sum(if(qpd.result='right', 1, 0)) as right_question_cnt
from user_profile as up
left join question_practice_detail as qpd
    on qpd.device_id = up.device_id and month(qpd.date) = 8
where up.university = '复旦大学'
group by up.device_id

SELECT difficult_level,
    AVG(if(result = 'right', 1, 0)) AS correct_rate1,
    SUM(if(result = 'right', 1, 0)) / COUNT(qpd.question_id) AS correct_rate2,
    COUNT(if(result = 'right', 1, null)) / COUNT(qpd.question_id) AS correct_rate3
FROM
    user_profile AS up
    INNER JOIN question_practice_detail AS qpd
    ON up.device_id = qpd.device_id
    INNER JOIN question_detail AS qd
    ON qpd.question_id = qd.question_id
WHERE university = '浙江大学'
GROUP BY difficult_level
ORDER BY correct_rate1


SELECT device_id, gpa, age
FROM user_profile
ORDER BY gpa, age

SELECT device_id, gpa, age
FROM user_profile
ORDER BY gpa DESC, age DESC

SELECT
    COUNT(DISTINCT alias.device_id) AS did_cnt,
    COUNT(alias.question_id) AS question_cnt
FROM(
    SELECT device_id, question_id, date
    FROM question_practice_detail
    WHERE MONTH(date) = 8 and YEAR(date) = 2021
) AS alias

SELECT
    COUNT(DISTINCT device_id) AS did_cnt,
    COUNT(question_id) AS question_cnt
FROM question_practice_detail
WHERE date LIKE '2021-08%'

insert into exam_record
VALUES 
(null,1001,9001,'2021-09-01 22:11:12','2021-09-01 22:11:12' +INTERVAL 50 minute,90),
(null,1002,9002,'2021-09-04 07:01:02',null,NULL);

INSERT INTO exam_record_before_2021(uid, exam_id, start_time, submit_time, score)
SELECT uid, exam_id, start_time, submit_time, score
FROM exam_record
WHERE YEAR(submit_time) < '2021';

REPLACE INTO examination_info
VALUES(NULL,9003,'SQL','hard',90,'2021-01-01 00:00:00');

DELETE FROM examination_info
WHERE exam_id=9003;
INSERT INTO examination_info
VALUES(NULL,9003, 'SQL','hard', 90, '2021-01-01 00:00:00')

UPDATE examination_info
SET tag = "Python"
WHERE tag = "PYTHON";

UPDATE examination_info
SET tag = REPLACE(tag, "PYTHON", "Python")
WHERE tag = "PYTHON";

UPDATE exam_record
SET submit_time='2099-01-01 00:00:00', score=0
WHERE start_time < '2021-09-01 00:00:00' AND score IS NULL;

SELECT er.uid, ei.exam_id, ei.tag, ei.difficulty, er.score,
    RANK() OVER(
        PARTITION BY er.exam_id
        ORDER BY er.score
    ) AS ranking
FROM exam_record AS er
LEFT JOIN examination_info AS ei
    ON ei.exam_id = er.exam_id
WHERE ei.tag = 'SQL'
    AND ei.difficulty = 'hard'
    AND er.score IS NOT NULL

SELECT tag, difficulty, 
    ROUND((SUM(er.score) - MAX(er.score) - MIN(er.score)) / (COUNT(*) - 2), 1) AS clip_avg_score
FROM exam_record AS er
LEFT JOIN examination_info AS ei
    ON ei.exam_id = er.exam_id
WHERE ei.tag = 'SQL'
    AND ei.difficulty = 'hard'
    AND er.score IS NOT NULL

SELECT
    COUNT(exam_id) AS total_pv,
    COUNT(if(score IS NOT NULL, 1, NULL)) AS complete_pv,
    COUNT(DISTINCT if(score IS NOT NULL, exam_id, NULL)) AS complete_exam_cnt
FROM exam_record

SELECT 
    DATE_FORMAT(submit_time, '%Y%m') AS month,
    ROUND((COUNT(DISTINCT uid, DATE_FORMAT(submit_time, '%d')) / COUNT(DISTINCT uid)), 2) AS avg_active_days,
    COUNT(DISTINCT uid) AS mau
FROM exam_record
WHERE DATE_FORMAT(submit_time, '%Y') = 2021
GROUP BY month

SELECT 
    IFNULL(DATE_FORMAT(submit_time, '%Y%m'), '2021汇总') AS submit_month,
    COUNT(question_id) AS month_q_cnt,
    ROUND((COUNT(question_id) / MAX(DAY(LAST_DAY(submit_time)))), 3) AS avg_day_q_cnt
FROM practice_record
WHERE DATE_FORMAT(submit_time, '%Y') = '2021'
GROUP BY submit_month
WITH ROLLUP
```





# nginx



## 参考资料

```html
https://nginx.org/en/docs/
https://juejin.cn/post/6844904144235413512
https://xuexb.github.io/learn-nginx/guide/
```

## nginx 配置语法

### nginx.conf结构图

```html
main        # 全局配置，对全局生效
├── events  # 配置影响 Nginx 服务器或与用户的网络连接
├── http    # 配置代理，缓存，日志定义等绝大多数功能和第三方模块的配置
│   ├── upstream # 配置后端服务器具体地址，负载均衡配置不可或缺的部分
│   ├── server   # 配置虚拟主机的相关参数，一个 http 块中可以有多个 server 块
│   ├── server
│   │   ├── location  # server 块可以包含多个 location 块，location 指令用于匹配 uri
│   │   ├── location
│   │   └── ...
│   └── ...
└── ...
```

### 语法规则

一个 Nginx 配置文件的结构就像 `nginx.conf` 显示的那样，配置文件的语法规则：

1. 配置文件由指令与指令块构成；
2. 每条指令以 `;` 分号结尾，指令与参数间以空格符号分隔；
3. 指令块以 `{}` 大括号将多条指令组织在一起；
4. `include` 语句允许组合多个配置文件以提升可维护性；
5. 使用 `#` 符号添加注释，提高可读性；
6. 使用 `$` 符号使用变量；
7. 部分指令的参数支持正则表达式；

### 典型配置

```shell
user  nginx;                        # 运行用户，默认即是nginx，可以不进行设置
worker_processes  1;                # Nginx 进程数，一般设置为和 CPU 核数一样
error_log  /var/log/nginx/error.log warn;   # Nginx 的错误日志存放目录
pid        /var/run/nginx.pid;      # Nginx 服务启动时的 pid 存放位置

events {
    use epoll;     # 使用epoll的I/O模型(如果你不知道Nginx该使用哪种轮询方法，会自动选择一个最适合你操作系统的)
    worker_connections 1024;   # 每个进程允许最大并发数
}

http {   # 配置使用最频繁的部分，代理、缓存、日志定义等绝大多数功能和第三方模块的配置都在这里设置
    # 设置日志模式
    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;   # Nginx访问日志存放位置

    sendfile            on;   # 开启高效传输模式
    tcp_nopush          on;   # 减少网络报文段的数量
    tcp_nodelay         on;
    keepalive_timeout   65;   # 保持连接的时间，也叫超时时间，单位秒
    types_hash_max_size 2048;

    include             /etc/nginx/mime.types;      # 文件扩展名与类型映射表
    default_type        application/octet-stream;   # 默认文件类型

    include /etc/nginx/conf.d/*.conf;   # 加载子配置项
    
    server {
    	listen       80;       # 配置监听的端口
    	server_name  localhost;    # 配置的域名
    	
    	location / {
    		root   /usr/share/nginx/html;  # 网站根目录
    		index  index.html index.htm;   # 默认首页文件
    		deny 172.168.22.11;   # 禁止访问的ip地址，可以为all
    		allow 172.168.33.44； # 允许访问的ip地址，可以为all
    	}
    	
    	error_page 500 502 503 504 /50x.html;  # 默认50x对应的访问页面
    	error_page 400 404 error.html;   # 同上
    }
}
```

### 关于URI语法

server 块可以包含多个 location 块，location 指令用于匹配 uri，语法：

```shell
location [ = | ~ | ~* | ^~] uri {
	...
}
```

指令后面：

1. `=` 精确匹配路径，用于不含正则表达式的 uri 前，如果匹配成功，不再进行后续的查找；
2. `^~` 用于不含正则表达式的 uri； 前，表示如果该符号后面的字符是最佳匹配，采用该规则，不再进行后续的查找；
3. `~` 表示用该符号后面的正则去匹配路径，区分大小写；
4. `~*` 表示用该符号后面的正则去匹配路径，不区分大小写。跟 `~` 优先级都比较低，如有多个location的正则能匹配的话，则使用正则表达式最长的那个；

如果 uri 包含正则表达式，则必须要有 `~` 或 `~*` 标志。

## nginx内置变量

```shell
    # argument name in the request line. 
    # 请求URL中的参数名称。
    $arg_name 
    
    # arguments in the request line. 
    # 请求URL中包含的参数。
    $args 

    # 二进制形式的客户端地址，ipv4通常是4比特长度，ipv6通常为16比特长度。
    $binary_remote_addr 
    
    # 发送给客户端的不包含响应头的字节数；这个变量兼容Apache的mod_log_config模块的“%B”参数。
    $body_bytes_sent 
    
    # number of bytes sent to a client(1.3.8,1.2.5). 
    # 发送给客户端的字节数。
    $bytes_sent 

    # connection serial number(1.3.8,1.2.5). 
    # 连接序列号。
    $connection 
    
    # current number of requests made through a connection(1.3.8,1.2.5). 
    # 当前通过连接发出的请求数。
    $connection_requests 
    
    # “Content-Length” request header field. 
    # 请求头中的Content-Length字段。
    $content_length 
    
    # “Content-Type” request header field. 
    # 请求头中的Content-Type字段。
    $content_type 
    
    # the name cookie. 
    # cookie的名称。
    $cookie_name 
    
    # root or alias directive’s value for the current request. 
    # 当前请求的根目录或别名的值。
    $document_root 
   
    # same as $uri. 
    # 与$uri全局变量相同。
    $document_uri 
    
    # in this order of precedence:host name from the request line, or host name from the “Host” request header field, or the server name matching a request. 
    # 请求URL中的主机名字段，或请求头中的Host字段，或匹配请求的server_name（nginx配置）。
    $host 
    
    # host name. 
    # 主机名称。
    $hostname 
    
    # arbitrary request header field; the last part of a variable name is the field name converted to lower case with dashes replaced by underscores. 
    # 任意请求头字段；变量名的最后一部份是转换为小写的字段名，通过下划线相连。
    $http_name 
    
    # “on” if connection operates in ssl mode, or an empty string otherwise. 
    # 如果是https请求方式则值为on，否则为空字符串。
    $https 
    
    # http请求信息里的HEADER字段。
    $http_HEADER 
    
    # 与$host相同，但如果请求信息中没有Host行，则可能不同。
    $http_host 
    
    # 客户端的cookie信息。
    $http_cookie 
    
    # 引用地址。
    $http_referer 
    
    # 客户端代理信息。
    $http_user_agent 
    
    # 最后一个访问服务器的IP地址。
    $http_via 
    
    # 相当于网络访问路径。
    $http_x_forwarded_for 
    
    # “?” if a request line has arguments, or an empty string otherwise. 
    # 如果URL包含参数则为？，否则为空字符串。
    $is_args 
    
    # setting this variable enables response rate limiting. 
    # nginx配置中的limit_rate配置项的值，影响响应速度限制。
    $limit_rate 
    
    # current time in seconds with the milliseconds resolution(1.3.9,1.2.6) 
    # 当前时间，单位为毫秒。
    $msec 
    
    # nginx version.
    $nginx_version 
    
    # PID of the worker process. 
    # 工作进程的PID。
    $pid 
    
    # “p” if request was pipelined, “.” otherwise(1.3.12,1.2.7).
    $pipe 
    
    # 来自代理协议头的客户端地址，否则为空字符串。 
    # proxy_protocol在nginx配置listen参数时设定。
    $proxy_protocol_addr 
    
    # client port from the PROXY protocol header, or an empty string otherwise(1.11.0). 
    # 来自代理协议头的客户端端口，其它与$proxy_protocol_addr相同。
    $proxy_protocol_port 
    
    #  same as $args.
    $query_string 
   
    # 对应于当前请求的根目录或别名值的绝对路径名，所有符号连接都解析为真实路径。
    $realpath_root 
    
    # client address. 
    # 客户端地址。
    $remote_addr 
    
    # client port. 
    # 客户端端口。
    $remote_port 
    
    # user name supplied with the Basic authentication. 
    # 用于基本验证的用户名。
    $remote_user 
    
    # full original request line. 
    # 完整的原始请求URL。
    $request 
    
    # request body. 
    # 请求体，当proxy_pass,fastcgi_pass,uwsgi_pass和scgi_pass指令将请求体读入缓存中时此变量值可用。
    $request_body 
    
    # name of a temporary file with the request body. 
    # 请求主体的临时文件的名称。
    $request_body_file 
    
    # “OK” if a request has completed, or an empty string otherwise. 
    # 如果请求完成则值为OK，否则为空字符串。
    $request_completion 
    
    # file path for the current request, based on the root or alias directives, and the request URI. 
    # 当前请求的文件路径，基于根目录或别名指令，以及请求URI。
    $request_filename 
    
    # unique request identifier generated from 16 random bytes, in hexadecimal(1.11.0). 
    # 16位随机字节生成的唯一标识符。
    $request_id 
    
    # request length (including request line, header, and request body)(1.3.12,1.2.7). 
    # 请求长度，包含请求行，请求头，以及请求的消息体。
    $request_length 
    
    # request method, usually “GET” or “POST”. 
    # 请求方法，通常为GET或POST。
    $request_method 
    
    # 以毫秒为单位的请求处理时间；从客户端读取第1个字节之后的时间。
    $request_time 
   
    # full original request URI (with arguments). 
    # 完整的原始请求URI（带有参数）。
    $request_uri 
    
    # request scheme, “http” or “https”. 
    # 请求方案，http或https。
    $scheme 
    
    # 任意的响应头字段；变量名的最后一部份是转换为小写的字段名，通过下划线相连。
    $sent_http_name 
    
    # 响应结束时发送的任意字段；变量名的最后一部份是转换为小写的字段名，通过下划线相连。
    $send_trailer_name 
    
    # 响应请求的服务器地址。
    $server_addr 
    
    # 响应请求的服务器名称。
    $server_name 
    
    # 响应请求的服务器端口。
    $server_port 
    
    $server_protocol 
    
    # response status(1.3.2,1.2.2) 
    # 响应状态。
    $status 
    
    # 客户端TCP连接的相关信息，在支持TCP_INFO套接字选项的系统上可用。
    $tcpinfo_rtt 
    $tcpinfo_rttvar 
    $tcpinfo_snd_cwnd 
    $tcpinfo_rcv_space 
    
    # local time in the ISO 8601 standard format(1.3.12,1.2.7). 
    # ISO 8601标准格式下的本地时间。
    $time_iso8601 
    
    # local time in the Common Log Format(1.3.12,1.2.7). 
    # 通用日志格式的本地时间。
    $time_local 
    
    # 当前请求的URI。
    $uri 
```

## 配置实例

```html
https://xuexb.github.io/learn-nginx/example/
```



# Docker

## 参考资料

```shell
https://docs.docker.com/
https://www.runoob.com/docker/docker-tutorial.html
https://blog.csdn.net/huangjhai/article/details/118854733

http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
```

## docker安装

- 参考文档

  ```shell
  https://docs.docker.com/engine/install/rhel/
  ```

- 卸载旧版本

  Uninstall old versions

  Older versions of Docker were called `docker` or `docker-engine`. If these are installed, uninstall them, along with associated dependencies. Also uninstall `Podman` and the associated dependencies if installed already.

  ```shell
  sudo yum remove docker \
                    docker-client \
                    docker-client-latest \
                    docker-common \
                    docker-latest \
                    docker-latest-logrotate \
                    docker-logrotate \
                    docker-engine \
                    podman \
                    runc
  ```

  It’s OK if yum reports that none of these packages are installed.

  The contents of /var/lib/docker/, including images, containers, volumes, and networks, are preserved. The Docker Engine package is now called docker-ce.

- 安装镜像地址

  Install the `yum-utils` package (which provides the `yum-config-manager` utility) and set up the **stable** repository.

  ```shell
  yum install -y yum-utils
  yum-config-manager \
      --add-repo \
      #https://download.docker.com/linux/rhel/docker-ce.repo
      #推荐使用国内的镜像地址
      http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
  yum makecache
  ```

  ```shell
  #也可以直接下载对应的镜像仓库到yum文件夹内
  cd /etc/yum.repos.d
  wget -c http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
  yum makecache
  ```

- 安装docker

  Install the *latest version* of Docker Engine and containerd, or go to the next step to install a specific version:

  ```shell
  #ce 社区版
  yum install docker-ce docker-ce-cli containerd.io
  ```

  To install a *specific version* of Docker Engine, list the available versions in the repo, then select and install:

  a. List and sort the versions available in your repo. This example sorts results by version number, highest to lowest, and is truncated:

  The list returned depends on which repositories are enabled, and is specific to your version of RHEL (indicated by the `.el8` suffix in this example).

  ```shell
  yum list docker-ce --showduplicates | sort -r
  ```

  b. Install a specific version by its fully qualified package name, which is the package name (`docker-ce`) plus the version string (2nd column) starting at the first colon (`:`), up to the first hyphen, separated by a hyphen (`-`). For example, `docker-ce-20.10.7`.

  This command installs Docker, but it doesn’t start Docker. It also creates a `docker` group, however, it doesn’t add any users to the group by default.

  ```shell
  yum install docker-ce-<VERSION_STRING> docker-ce-cli-<VERSION_STRING> containerd.io
  ```

- 运行docker

  ```shell
  docker --version
  systemctl start docker
  docker version
  docker run hello-world
  ```

- 查看已下载的镜像

  ```shell
  docker images
  ```

- 卸载docker

  Uninstall the Docker Engine, CLI, and Containerd packages:

  ```shell
  yum remove docker-ce docker-ce-cli containerd.io
  ```
  

Images, containers, volumes, or customized configuration files on your host are not automatically removed. To delete all images, containers, and volumes:

```shell
   sudo rm -rf /var/lib/docker
   sudo rm -rf /var/lib/containerd
```

You must delete any edited configuration files manually.



## docker基础命令

### 图解

![docker_command](D:\RobotINX\Desktop\linux\img\docker_command.png)

### 参考文档

```shell
https://docs.docker.com/engine/reference/run/
```

### 版本和帮助

```shell
#显示docker的版本信息
docker version
docker --version
#显示docker的系统信息，包括镜像和容器的数量
docker info
#显现具体指令的帮助
docker command --help
```



### docker images

```shell
#查看本地主机的所有镜像
docker images

[root@VM-0-13-centos ~]# docker images
REPOSITORY    TAG       IMAGE ID       CREATED        SIZE
ubuntu        latest    825d55fb6340   2 weeks ago    72.8MB
hello-world   latest    feb5d9fea6a5   7 months ago   13.3kB
```

| Name, shorthand   | Default | Description                                         |
| ----------------- | ------- | --------------------------------------------------- |
| `--all` , `-a`    |         | Show all images (default hides intermediate images) |
| `--digests`       |         | Show digests                                        |
| `--filter` , `-f` |         | Filter output based on conditions provided          |
| `--format`        |         | Pretty-print images using a Go template             |
| `--no-trunc`      |         | Don't truncate output                               |
| `--quiet` , `-q`  |         | Only show image IDs                                 |



### docker search

```shell
#docker search云仓库中的镜像
docker search mysql
#可选项，通过stars过滤，搜索stars数3000以上的镜像
docker search mysql -f=stars=3000
```



### docker pull

```shell
#docker pull下载镜像
docker pull mysql

[root@VM-0-13-centos ~]# docker pull mysql
#默认下载最新的镜像
Using default tag: latest
latest: Pulling from library/mysql
#分层下载
4be315f6562f: Pull complete 
96e2eb237a1b: Pull complete 
8aa3ac85066b: Pull complete 
ac7e524f6c89: Pull complete 
f6a88631064f: Pull complete 
15bb3ec3ff50: Pull complete 
ae65dc337dcb: Pull complete 
654aa78d12d6: Pull complete 
6dd1a07a253d: Pull complete 
a32905dc9e58: Pull complete 
152d41026e44: Pull complete 
42e0f73ebe32: Pull complete 
Digest: sha256:fc77d54cacef90ad3d75964837fad0f2a9a368b69e7d799665a3f4e90e600c2d
Status: Downloaded newer image for mysql:latest
#真实地址
#以下两个命令等价
#docker pull mysql
#docker pull docker.io/library/mysql:latest
docker.io/library/mysql:latest
```

```shell
#指定版本下载
docker pull mysql:5.7

[root@VM-0-13-centos ~]# docker pull mysql:5.7
5.7: Pulling from library/mysql
#通过分层下载大大减少了下载量和文件复用率
4be315f6562f: Already exists 
96e2eb237a1b: Already exists 
8aa3ac85066b: Already exists 
ac7e524f6c89: Already exists 
f6a88631064f: Already exists 
15bb3ec3ff50: Already exists 
ae65dc337dcb: Already exists 
291c7612f7a8: Pull complete 
ffdc84226e0b: Pull complete 
81340df4a52c: Pull complete 
f3ec63f52b87: Pull complete 
Digest: sha256:151ecb87a07404f2c2588464e86381bdf74795c6d24090f9c50bc8e947a57797
Status: Downloaded newer image for mysql:5.7
docker.io/library/mysql:5.7
```



### docker rmi

```shell
#通过镜像ID删除镜像
docker rmi 82d2d47667cf

[root@VM-0-13-centos ~]# docker rmi -f 82d2d47667cf
Untagged: mysql:5.7
Untagged: mysql@sha256:151ecb87a07404f2c2588464e86381bdf74795c6d24090f9c50bc8e947a57797
Deleted: sha256:82d2d47667cf062cc9e70c31b9322fafc527ed61806f32f48d8797a0e1488ac6
Deleted: sha256:738c94167bcba88b380640dcf3cd3f2b346d31aa45fd252ef7b3a133022097b7
Deleted: sha256:7daea859ebdee4608b42b29967a2e579219b506102a60dac4f3d09a88e004a24
Deleted: sha256:9769b9ac6c804c2741f620e368ac101a96058f983aad95eea2ea247ce8199181
Deleted: sha256:5225e8e0c4b170bb30d22a63f320ffb5eb580e6d4f293c76860e2be9c677232c

[root@VM-0-13-centos ~]# docker images
REPOSITORY    TAG       IMAGE ID       CREATED        SIZE
mysql         latest    f2ad9f23df82   2 days ago     521MB
ubuntu        latest    825d55fb6340   2 weeks ago    72.8MB
hello-world   latest    feb5d9fea6a5   7 months ago   13.3kB
```

```shell
#可以通过多个ID一次性删除多个镜像
docker rmi -f f2ad9f23df82 825d55fb6340
```

```shell
#通过变量删除所有镜像
docker rmi -f $(docker images -qa)
```



### docker run

```shell
docker run {options} image

#参数说明
--name="Name"                    容器名字，如tomcat01  tomcat02，用来区分容器
-d                               后台方式运行，同linux中的nohup
-it                              使用交互方式运行，进入容器查看内容
-p                               指定容器的端口
	-p ip：port：container_port  绑定指定IP主机的端口号和容器端口号绑定
	-p port:container_port		指定主机端口号与容器端口号绑定
	-p containcer_port		    指定容器端口号
	container_port               指定容器端口号
-P                               随机指定端口
```



```shell
#后台启动容器
docker run -d centos
#这种方式启动的centos会自杀
#docker容器使用后台运行，必须要有一个前台进程，否则会自动停止
#nginx容器启动后，会发现自己没有提供服务，就会立刻停止
```



```shell
#创建并进入容器
docker run -it centos /bin/bash
```



### docker ps

```shell
#列出正在运行的容器
docker ps
#列出运行过的容器
docker ps -a
#显示最近创建的容器
docker ps
#n后面可以加数字表示最近创建的n个容器
#显示最近创建的四个容器
docker ps -n=4
#显示最近创建的容器，只显示编号
docker ps -q
```



### docker logs

```shell
#docker logs -f -t -tail count 7825a42fea77
#首先用容器运行命令
docker run -d centos /bin/sh -c "while true; do echo hello world; sleep 1; done"
#默认查看容器的所有日志，t：timestap，f：format
docker ps 
docker logs -tf 977cb92394d3
#查看容器的前十条日志
docker logs -tfn 10 977cb92394d3
```



### docker  top

```shell
#查看docker运行的状态
#docker top container_id
docker top 977cb92394d3
```



### docker inspect

```shell
docker inspect

[root@VM-0-13-centos ~]# docker inspect 977cb92394d3
[
    {
        "Id": "977cb92394d3d2084c5f2a413530614363d48fa7edf7214ebc16cb240701b7d4",
        "Created": "2022-04-23T03:50:52.688989592Z",
        "Path": "/bin/sh",
        "Args": [
            "-c",
            "while true; do echo hello world; sleep 1; done"
        ],
        "State": {
            "Status": "running",
            "Running": true,
            "Paused": false,
            "Restarting": false,
            "OOMKilled": false,
            "Dead": false,
            "Pid": 20918,
            "ExitCode": 0,
            "Error": "",
            "StartedAt": "2022-04-23T03:50:53.013592399Z",
            "FinishedAt": "0001-01-01T00:00:00Z"
        },
        "Image": "sha256:5d0da3dc976460b72c77d94c8a1ad043720b0416bfc16c52c45d4847e53fadb6",
        "ResolvConfPath": "/var/lib/docker/containers/977cb92394d3d2084c5f2a413530614363d48fa7edf7214ebc16cb240701b7d4/resolv.conf",
        "HostnamePath": "/var/lib/docker/containers/977cb92394d3d2084c5f2a413530614363d48fa7edf7214ebc16cb240701b7d4/hostname",
        "HostsPath": "/var/lib/docker/containers/977cb92394d3d2084c5f2a413530614363d48fa7edf7214ebc16cb240701b7d4/hosts",
        "LogPath": "/var/lib/docker/containers/977cb92394d3d2084c5f2a413530614363d48fa7edf7214ebc16cb240701b7d4/977cb92394d3d2084c5f2a413530614363d48fa7edf7214ebc16cb240701b7d4-json.log",
        "Name": "/determined_volhard",
        "RestartCount": 0,
        "Driver": "overlay2",
        "Platform": "linux",
        "MountLabel": "",
        "ProcessLabel": "",
        "AppArmorProfile": "",
        "ExecIDs": null,
        "HostConfig": {
            "Binds": null,
            "ContainerIDFile": "",
            "LogConfig": {
                "Type": "json-file",
                "Config": {}
            },
            "NetworkMode": "default",
            "PortBindings": {},
            "RestartPolicy": {
                "Name": "no",
                "MaximumRetryCount": 0
            },
            "AutoRemove": false,
            "VolumeDriver": "",
            "VolumesFrom": null,
            "CapAdd": null,
            "CapDrop": null,
            "CgroupnsMode": "host",
            "Dns": [],
            "DnsOptions": [],
            "DnsSearch": [],
            "ExtraHosts": null,
            "GroupAdd": null,
            "IpcMode": "private",
            "Cgroup": "",
            "Links": null,
            "OomScoreAdj": 0,
            "PidMode": "",
            "Privileged": false,
            "PublishAllPorts": false,
            "ReadonlyRootfs": false,
            "SecurityOpt": null,
            "UTSMode": "",
            "UsernsMode": "",
            "ShmSize": 67108864,
            "Runtime": "runc",
            "ConsoleSize": [
                0,
                0
            ],
            "Isolation": "",
            "CpuShares": 0,
            "Memory": 0,
            "NanoCpus": 0,
            "CgroupParent": "",
            "BlkioWeight": 0,
            "BlkioWeightDevice": [],
            "BlkioDeviceReadBps": null,
            "BlkioDeviceWriteBps": null,
            "BlkioDeviceReadIOps": null,
            "BlkioDeviceWriteIOps": null,
            "CpuPeriod": 0,
            "CpuQuota": 0,
            "CpuRealtimePeriod": 0,
            "CpuRealtimeRuntime": 0,
            "CpusetCpus": "",
            "CpusetMems": "",
            "Devices": [],
            "DeviceCgroupRules": null,
            "DeviceRequests": null,
            "KernelMemory": 0,
            "KernelMemoryTCP": 0,
            "MemoryReservation": 0,
            "MemorySwap": 0,
            "MemorySwappiness": null,
            "OomKillDisable": false,
            "PidsLimit": null,
            "Ulimits": null,
            "CpuCount": 0,
            "CpuPercent": 0,
            "IOMaximumIOps": 0,
            "IOMaximumBandwidth": 0,
            "MaskedPaths": [
                "/proc/asound",
                "/proc/acpi",
                "/proc/kcore",
                "/proc/keys",
                "/proc/latency_stats",
                "/proc/timer_list",
                "/proc/timer_stats",
                "/proc/sched_debug",
                "/proc/scsi",
                "/sys/firmware"
            ],
            "ReadonlyPaths": [
                "/proc/bus",
                "/proc/fs",
                "/proc/irq",
                "/proc/sys",
                "/proc/sysrq-trigger"
            ]
        },
        "GraphDriver": {
            "Data": {
                "LowerDir": "/var/lib/docker/overlay2/a1eccd6df24e9e3bb3940684d7f23bb56b3cac1aab2dc7733fc741d2f08bb7c6-init/diff:/var/lib/docker/overlay2/eed6607f3ba3cf5470bed74dfb9a246be0f81948e468a0e1a6298b7d3a7d34a6/diff",
                "MergedDir": "/var/lib/docker/overlay2/a1eccd6df24e9e3bb3940684d7f23bb56b3cac1aab2dc7733fc741d2f08bb7c6/merged",
                "UpperDir": "/var/lib/docker/overlay2/a1eccd6df24e9e3bb3940684d7f23bb56b3cac1aab2dc7733fc741d2f08bb7c6/diff",
                "WorkDir": "/var/lib/docker/overlay2/a1eccd6df24e9e3bb3940684d7f23bb56b3cac1aab2dc7733fc741d2f08bb7c6/work"
            },
            "Name": "overlay2"
        },
        "Mounts": [],
        "Config": {
            "Hostname": "977cb92394d3",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "/bin/sh",
                "-c",
                "while true; do echo hello world; sleep 1; done"
            ],
            "Image": "centos",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": {
                "org.label-schema.build-date": "20210915",
                "org.label-schema.license": "GPLv2",
                "org.label-schema.name": "CentOS Base Image",
                "org.label-schema.schema-version": "1.0",
                "org.label-schema.vendor": "CentOS"
            }
        },
        "NetworkSettings": {
            "Bridge": "",
            "SandboxID": "0fe71300ae26d4cf9cec19ebc2718b2846adcdfe448d089a93d9c6ca0fb1bee1",
            "HairpinMode": false,
            "LinkLocalIPv6Address": "",
            "LinkLocalIPv6PrefixLen": 0,
            "Ports": {},
            "SandboxKey": "/var/run/docker/netns/0fe71300ae26",
            "SecondaryIPAddresses": null,
            "SecondaryIPv6Addresses": null,
            "EndpointID": "99aaf132f4e7e8b657eb719f415cad31a391eaded9c1f35ffd64b34fe7b72a66",
            "Gateway": "172.18.0.1",
            "GlobalIPv6Address": "",
            "GlobalIPv6PrefixLen": 0,
            "IPAddress": "172.18.0.3",
            "IPPrefixLen": 16,
            "IPv6Gateway": "",
            "MacAddress": "02:42:ac:12:00:03",
            "Networks": {
                "bridge": {
                    "IPAMConfig": null,
                    "Links": null,
                    "Aliases": null,
                    "NetworkID": "736b3357a7cceaca5af2169c24487c5a8042f1fef63c3518cf3f619fb800f40a",
                    "EndpointID": "99aaf132f4e7e8b657eb719f415cad31a391eaded9c1f35ffd64b34fe7b72a66",
                    "Gateway": "172.18.0.1",
                    "IPAddress": "172.18.0.3",
                    "IPPrefixLen": 16,
                    "IPv6Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
                    "MacAddress": "02:42:ac:12:00:03",
                    "DriverOpts": null
                }
            }
        }
    }
]
```



### docker exec

```shell
#容器执行某条命令
docker exec -it 3247f7599fea ls
#可以通过前台执行bash进入容器中的centos
docker exec -it 3247f7599fea /bin/bash
```



### docker attach

```shell
#进入某个正在运行的容器
docker attach 3247f7599fea
```



### docker cp

```shell
#容器和主机之间的文件复制
docker cp 3247f7599fea:/home/test /home
#这是手动复制，后面可以使用 -v 卷技术实现文件同步，可以自动同步文件改动
```





### 容器的启动和停止

```shell
docker start container_id
docker stop container_id
docker restart container_id
docker kill container_id
```



### 退出容器

```shell
#退出并关闭容器
exit
#退出但不关闭容器：escape sequence
CTRL +  Q + P
```



### docker rm

```shell
#删除指定容器，不能删除正在运行的容器
docker rm container_id
#可以通过-f强行删除正在运行的容器
docker rm -f 01904bac7216
#强行删除所有容器
docker rm -f $(docker ps -qa)
docker ps -qa | xargs docker rm -f 
```



### docker staus

```shell
#查看docker运行的状态
docker stats
```



### docker commit

```shell
#由于原版的tomcat是没有webapps的，我们可以将修改之后的tomcat重新打包
#首先正常部署一个tomcat容器
docker run -d -p 4040:8080 --name tomcat01 tomcat
#然后将tomcat里面webapps.dist的内容复制到webapps
docker exec -it tomcat01 /bin/bash
cp -r webapps.dist/* webapps/
#退出之后关闭容器之后就可以打包
docker commit -a="Robotinx" -m="add webapps" tomcat01 tomcat_add_webapps
```

```shell
[root@VM-0-13-centos tomcat_docker]# docker commit --help

Usage:  docker commit [OPTIONS] CONTAINER [REPOSITORY[:TAG]]

Create a new image from a container's changes

Options:
  -a, --author string    Author (e.g., "John Hannibal Smith <hannibal@a-team.com>")
  -c, --change list      Apply Dockerfile instruction to the created image
  -m, --message string   Commit message
  -p, --pause            Pause container during commit (default true)
```



### docker save/load

```shell
#通过docker save 可以将现有的镜像输出成文件进行备份
#备份的镜像文件可以通过docker load 读取出来
```

```shell
docker save -o mytomcat  mytomcat
[root@VM-0-13-centos tomcat_docker]# docker save --help

Usage:  docker save [OPTIONS] IMAGE [IMAGE...]

Save one or more images to a tar archive (streamed to STDOUT by default)

Options:
  -o, --output string   Write to a file, instead of STDOUT
```

```shell
docker load -i mytomcat
[root@VM-0-13-centos tomcat_docker]# docker load --help

Usage:  docker load [OPTIONS]

Load an image from a tar archive or STDIN

Options:
  -i, --input string   Read from tar archive file, instead of STDIN
  -q, --quiet          Suppress the load output

```



### 部署nginx

```shell
#搜索nginx镜像
docker search nginx
#下载nginx镜像
docker pull nginx
#后台启动nginx镜像，绑定端口号3344，指定容器名nginx01
docker run -d --name nginx01 -p 3344:80 nginx
#进入容器
docker exec -it nginx01 /bin/bash

#使用容器卷技术，将网页文件夹和配置文件夹双向同步到docker镜像中
#/usr/share/nginx/html/
#/etc/nginx/
docker run -it -p 9998:80 \
	-v /usr/share/nginx/html/:/usr/share/nginx/html/ -v /etc/nginx/:/etc/nginx/ nginx
```



### 部署tomcat

```shell
#直接创建tomcat容器，tomcat版本用9.0版本，端口映射3366:8080，容器名tomcat04
docker run -it -p 3366:8080 --name tomcat04 tomcat:9.0
#因为官方镜像默认是保证最小可运行的镜像，Linux命令不全，也没有webapps，所有不必要的功能都剔除掉了
#所以部署成功之后访问的网页是报错的
#但是在相关的网页在webapps.disk中还是有备份的
#我们把webapps.dist里的内容都复制一份到webapps中
cp -r webapps.dist/* webapps/
```



### 部署es+kabana

```shell
#es:elastic search
#es暴露的端口很多
#es十分耗内存
#es的数据一般需要放置到安全目录，挂载

#--net somnetwork 网络配置
#-e 环境配置修改

#首先启动elasticsearch容器
docker run  -d --name elaticsearch01 -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" elasticsearch:7.6.2
#查看当前占用资源状态
docker stats container_id
#限制elastic search 的内存使用
docker run -d --name elaticsearch02 -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" -e ES_JAVA_OPTS="-Xms64m -Xmx512m" elasticsearch:7.6.2
```



### 部署MySQL

```shell
#部署时需要将数据文件双向同步
docker run -d -p 3310:3306 \
	-v /home/mysql/conf:/etc/mysql/conf.d \
	-v /home/mysql/data:/var/lib/mysql \
	-e MYSQL_ROOT_PASSWORD=Liang123 \
	--name=mysql01 mysql
```



## 可视化

### portainer

```shell
#安装
#-v 挂载
#--privileged 授权

docker run -d -p 8088:9000 \
	--restart=always -v /var/run/docker.sock:/var/run/docker.sock --privileged=true portainer/portainer
```



### Rancher





## 容器数据卷

### 描述

> 容器之间的数据共享技术，使得Docker容器中产生的数据可以同步到本地
>
> 其实就是目录的挂载，将容器内的目录，挂载到 linux中的
>
> 目的是完成容器的持久化和同步操作
>
> 同时容器之间也是可以数据共享的

### 使用数据卷

- 方式1：直接使用命令挂载 -v

  ```shell
  docker run -it --names=centos01 -v /home:/home centos
  #这种方式挂载的文件目录，会双向同步
  #通过inspect命令可以查看mounts部分会有相应的挂载信息
  docker inspect centos01
  
          "Mounts": [
              {
                  "Type": "bind",
                  #主机内的地址
                  "Source": "/home",
                  #docker容器内的地址
                  "Destination": "/home",
                  "Mode": "",
                  "RW": true,
                  "Propagation": "rprivate"
              }
  ```

  

  ```shell
  #引用实战部署nginx的内容
  #/usr/share/nginx/html/
  #/etc/nginx/
  docker run -it -p 9998:80 \
  	-v /usr/share/nginx/html/:/usr/share/nginx/html/ -v /etc/nginx/:/etc/nginx/ nginx
  ```

  

  ```shell
  #引用实战部署MySQL的内容
  #部署时需要将数据文件双向同步
  #/home/mysql/conf:/etc/mysql/conf.d
  #/home/mysql/data:/var/lib/mysql
  docker run -d -p 3310:3306 \
  	-v /home/mysql/conf:/etc/mysql/conf.d \
  	-v /home/mysql/data:/var/lib/mysql \
  	-e MYSQL_ROOT_PASSWORD=Liang123 \
  	--name=mysql01 mysql
  ```

  

  

### 具名挂载和匿名挂载

- 匿名挂载

  ```shell
  #匿名挂载
  #将容器内指定的文件挂载到本地的docker文件夹内
  #cd /var/lib/docker
  #-v container_path
  #这种挂载生成的挂载名字是随机的
  #不推荐挂载方式
  docker run -d -P --name=nginx01 -v /etc/nginx nginx
  [root@VM-0-13-centos volumes]# ll /var/lib/docker/volumes/
  total 36
  drwx-----x 3 root root   4096 Apr 23 14:54 10783f0d4d85577e140d5626c3adfad6dddfc9322ada3df3ddbee478e3e9c06b
  drwx-----x 3 root root   4096 Apr 23 15:03 80868c3985566ebd1017fcc1249a704b8e0421f0fd12dd34d8cd8db09cc690a5
  brw------- 1 root root 253, 1 Apr 21 23:20 backingFsBlockDev
  drwx-----x 3 root root   4096 Apr 23 14:51 f13cc3d8a03358c21b3b41f7ea24ae2e03559da3121fc353b5297d7519b4c16d
  -rw------- 1 root root  32768 Apr 23 15:03 metadata.db
  ```

- 具名挂载

  ```shell
  #具名挂载
  #将容器内指定的文件挂载到本地的docker文件夹内
  #cd /var/lib/docker
  #-v volums_name:/etc/nginx
  #这种挂载生成的挂载名字是指定的
  #推荐挂载方式
  docker run -d --name juming_nginx -v juming_nginx:/etc/nginx/ nginx
  [root@VM-0-13-centos volumes]# ll /var/lib/docker/volumes/
  total 40
  drwx-----x 3 root root   4096 Apr 23 14:54 10783f0d4d85577e140d5626c3adfad6dddfc9322ada3df3ddbee478e3e9c06b
  drwx-----x 3 root root   4096 Apr 23 15:03 80868c3985566ebd1017fcc1249a704b8e0421f0fd12dd34d8cd8db09cc690a5
  brw------- 1 root root 253, 1 Apr 21 23:20 backingFsBlockDev
  drwx-----x 3 root root   4096 Apr 23 14:51 f13cc3d8a03358c21b3b41f7ea24ae2e03559da3121fc353b5297d7519b4c16d
  drwx-----x 3 root root   4096 Apr 23 19:32 juming_nginx
  -rw------- 1 root root  32768 Apr 23 19:32 metadata.db
  ```

- 指定路径挂载

  ```shell
  #指定路径挂载
  #将本地的指定文件夹与docker镜像内的指定文件夹关联起来
  #两边修改的文件都会互相同步
  ```

- 挂载内容

  ```shell
  #挂载内容
  #可以看到指定的文件夹内部的内容都已经挂载到了容器的_data文件夹里了
  [root@VM-0-13-centos _data]# ll /var/lib/docker/volumes/juming_nginx/_data
  total 28
  drwxr-xr-x 2 root root 4096 Apr 23 19:32 conf.d
  -rw-r--r-- 1 root root 1007 Jan 25 23:03 fastcgi_params
  -rw-r--r-- 1 root root 5349 Jan 25 23:03 mime.types
  lrwxrwxrwx 1 root root   22 Jan 25 23:13 modules -> /usr/lib/nginx/modules
  -rw-r--r-- 1 root root  648 Jan 25 23:13 nginx.conf
  -rw-r--r-- 1 root root  636 Jan 25 23:03 scgi_params
  -rw-r--r-- 1 root root  664 Jan 25 23:03 uwsgi_params
  ```

- docker volums

  ```shell
  [root@VM-0-13-centos _data]# docker volume --help
  
  Usage:  docker volume COMMAND
  
  Manage volumes
  
  Commands:
    create      Create a volume
    inspect     Display detailed information on one or more volumes
    ls          List volumes
    prune       Remove all unused local volumes
    rm          Remove one or more volumes
  
  Run 'docker volume COMMAND --help' for more information on a command.
  ```

  ```shell
  #查看指定的具名挂载的卷信息
  [root@VM-0-13-centos _data]# docker volume inspect juming_nginx 
  [
      {
          "CreatedAt": "2022-04-23T19:32:50+08:00",
          "Driver": "local",
          "Labels": null,
          "Mountpoint": "/var/lib/docker/volumes/juming_nginx/_data",
          "Name": "juming_nginx",
          "Options": null,
          "Scope": "local"
      }
  ]
  ```

- 拓展

  ```shell
  #通过 -v 容器内路径：ro rw 改变读写权限
  #ro		readonly只读权限，这个路径的内容是容器内部无法修改的，只能通过本地修改
  #rw		readwrite读写权限，默认权限
  
  #一旦设置了这个容器权限，容器对我们挂载出来的内容就有限定权限了
  docker run -d -P --name nginx_ro -v juming_nginx_ro:/etc/nginx:ro nginx
  docker run -d -P --name nginx_rw -v juming_nginx_rw:/etc/nginx:rw nginx
  ```

### 使用DockerFile进行挂载

- 方式二

  ```shell
  #通过DockerFile文件生成镜像时，自动生成匿名挂载
  #首先编写一个DockerFile
  mkdir -p /home/docker/DockerFile
  #DockerFile的文件名，推荐使用DockerFile即可
  vim /home/docker/DockerFile/DockerFile01
  
  #DockerFile中的指令都是大写的
  #DockerFile中每一条就是镜像中的一层
  FROM centos
  
  #这里生成两个匿名挂载
  VOLUME ["volume01", "volume02"]
  
  CMD echo "-----end-----"
  
  CMD /bin/bash
  ```

  ```shell
  #通过DockerFile构建镜像
  docker build -f /home/docker/DockerFile/DockerFile01 -t Robotinx/centos:1.0 .
  #查看生成的镜像
  [root@VM-0-13-centos DockerFile]# docker images
  REPOSITORY            TAG       IMAGE ID       CREATED         SIZE
  robotinx/centos       latest    fbb58c90821a   6 seconds ago   231MB
  
  ```

  ```shell
  #使用生成的镜像创建容器
  docker run -it --name robotinx_centos robotinx/centos
  #查看根目录可以看到生成的两个挂载文件夹
  [root@9dcf6b653c2d /]# ls /
  bin  dev  etc  home  lib  lib64  lost+found  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var  volume01	volume02
  #往目录内随便写一个文件
  echo hello centos in docker >> /volume01/test
  
  #返回本地，查看容器的相关信息
  docker inspect robotinx_centos
          "Mounts": [
              {
                  "Type": "volume",
                  "Name": "d97f297124a4f6cb4407fb1c456ae4dbb0e07070034c7b0ef151500f47675968",
                  "Source": "/var/lib/docker/volumes/d97f297124a4f6cb4407fb1c456ae4dbb0e07070034c7b0ef151500f47675968/_data",
                  "Destination": "volume01",
                  "Driver": "local",
                  "Mode": "",
                  "RW": true,
                  "Propagation": ""
              },
              {
                  "Type": "volume",
                  "Name": "ab1813ef96d990f2b92000da7edb18e9e9d6d45ef34f1f777b79d1b871b61bb5",
                  "Source": "/var/lib/docker/volumes/ab1813ef96d990f2b92000da7edb18e9e9d6d45ef34f1f777b79d1b871b61bb5/_data",
                  "Destination": "volume02",
                  "Driver": "local",
                  "Mode": "",
                  "RW": true,
                  "Propagation": ""
              }
          ],
  
  #可以看到指定的两个文件夹都已经匿名挂载到相应的随机目录中
  cd /var/lib/docker/volumes/d97f297124a4f6cb4407fb1c456ae4dbb0e07070034c7b0ef151500f47675968/_data
  cat hello
  ```

  这种方式我们经常使用，因为通常我们会自己构建镜像

  如果构建镜像时没有挂载卷，构建容器时就要时手动用 -v 卷名:容器内路径 来进行挂载



### 数据卷容器

- 多容器共用数据卷

  ```shell
  #首先通过镜像创建几个容器
  docker run -it --name centos01 robotinx/centos
  docekr run -it --name centos02 --volumes-from centos01 robotinx/centos
  docker run -it --nmae centos03 --volumes-from centos01 robotinx/centos
  
  #可以发现在三个容器之中的volumes01、volumes02的两个文件夹的内容是互相同步修改的
  #同时，如果我们删除掉centos01，可以发现另外两个容器中的数据卷并不会被删除
  ```

  通过数据卷容器可以实现多个容器之间的配置传递和文件修改传递

  数据卷容器的生命周期一直持续到没有容器使用该数据卷为止

  但是如果数据卷容器是挂载本地指定的文件夹的话

  哪怕所有使用该数据卷容器的容器都删掉了

  文件依然还是不会被删除

- 多个mysql实现数据共享

  ```shell
  #docker run -d -p 3310:3306 \
  #	-v /home/mysql/conf:/etc/mysql/conf.d \
  #	-v /home/mysql/data:/var/lib/mysql \
  #	-e MYSQL_ROOT_PASSWORD=Liang123 \
  #	--name=mysql01 mysql
  
  #生成第一个容器
  docker run -d -p 3310:3306 \
  	-v /home/mysql/conf:/etc/mysql/conf.d \
  	-v /home/mysql/data:/var/lib/mysql \
  	-e MYSQL_ROOT_PASSWORD=Liang123 \
  	--name mysql01
  
  #生成与第一个容器数据共享的第二个容器
  docer run -d -p 3311:3306 \
  	--volumes-from mysql01 \
  	-e MYSQL_ROOT_PASSWORD=Liang123 \
  	--name mysql02
  ```

  







## DockerFile

### 镜像搭建流程

>1、编写DockerFile文件
>
>2、docker build 构建镜像
>
>3、docker run 运行镜像
>
>4、docker push 发布镜像

### DockerFile文件实例

- Centos官方镜像实例

  ```dockerfile
  #由此可以看出Centos官方的镜像都很基础
  #并没有其他的附加命令和功能
  FROM scratch
  ADD centos-7-x86_64-docker.tar.xz /
  
  LABEL \
      org.label-schema.schema-version="1.0" \
      org.label-schema.name="CentOS Base Image" \
      org.label-schema.vendor="CentOS" \
      org.label-schema.license="GPLv2" \
      org.label-schema.build-date="20201113" \
      org.opencontainers.image.title="CentOS Base Image" \
      org.opencontainers.image.vendor="CentOS" \
      org.opencontainers.image.licenses="GPL-2.0-only" \
      org.opencontainers.image.created="2020-11-13 00:00:00+00:00"
  
  CMD ["/bin/bash"]
  ```

- nginx官方镜像实例

  ```dockerfile
  #NGINX官方镜像的DockerFile
  
  #
  # NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
  #
  # PLEASE DO NOT EDIT IT DIRECTLY.
  #
  FROM debian:bullseye-slim
  
  LABEL maintainer="NGINX Docker Maintainers <docker-maint@nginx.com>"
  
  ENV NGINX_VERSION   1.21.6
  ENV NJS_VERSION     0.7.2
  ENV PKG_RELEASE     1~bullseye
  
  RUN set -x \
  # create nginx user/group first, to be consistent throughout docker variants
      && addgroup --system --gid 101 nginx \
      && adduser --system --disabled-login --ingroup nginx --no-create-home --home /nonexistent --gecos "nginx user" --shell /bin/false --uid 101 nginx \
      && apt-get update \
      && apt-get install --no-install-recommends --no-install-suggests -y gnupg1 ca-certificates \
      && \
      NGINX_GPGKEY=573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62; \
      found=''; \
      for server in \
          hkp://keyserver.ubuntu.com:80 \
          pgp.mit.edu \
      ; do \
          echo "Fetching GPG key $NGINX_GPGKEY from $server"; \
          apt-key adv --keyserver "$server" --keyserver-options timeout=10 --recv-keys "$NGINX_GPGKEY" && found=yes && break; \
      done; \
      test -z "$found" && echo >&2 "error: failed to fetch GPG key $NGINX_GPGKEY" && exit 1; \
      apt-get remove --purge --auto-remove -y gnupg1 && rm -rf /var/lib/apt/lists/* \
      && dpkgArch="$(dpkg --print-architecture)" \
      && nginxPackages=" \
          nginx=${NGINX_VERSION}-${PKG_RELEASE} \
          nginx-module-xslt=${NGINX_VERSION}-${PKG_RELEASE} \
          nginx-module-geoip=${NGINX_VERSION}-${PKG_RELEASE} \
          nginx-module-image-filter=${NGINX_VERSION}-${PKG_RELEASE} \
          nginx-module-njs=${NGINX_VERSION}+${NJS_VERSION}-${PKG_RELEASE} \
      " \
      && case "$dpkgArch" in \
          amd64|arm64) \
  # arches officialy built by upstream
              echo "deb https://nginx.org/packages/mainline/debian/ bullseye nginx" >> /etc/apt/sources.list.d/nginx.list \
              && apt-get update \
              ;; \
          *) \
  # we're on an architecture upstream doesn't officially build for
  # let's build binaries from the published source packages
              echo "deb-src https://nginx.org/packages/mainline/debian/ bullseye nginx" >> /etc/apt/sources.list.d/nginx.list \
              \
  # new directory for storing sources and .deb files
              && tempDir="$(mktemp -d)" \
              && chmod 777 "$tempDir" \
  # (777 to ensure APT's "_apt" user can access it too)
              \
  # save list of currently-installed packages so build dependencies can be cleanly removed later
              && savedAptMark="$(apt-mark showmanual)" \
              \
  # build .deb files from upstream's source packages (which are verified by apt-get)
              && apt-get update \
              && apt-get build-dep -y $nginxPackages \
              && ( \
                  cd "$tempDir" \
                  && DEB_BUILD_OPTIONS="nocheck parallel=$(nproc)" \
                      apt-get source --compile $nginxPackages \
              ) \
  # we don't remove APT lists here because they get re-downloaded and removed later
              \
  # reset apt-mark's "manual" list so that "purge --auto-remove" will remove all build dependencies
  # (which is done after we install the built packages so we don't have to redownload any overlapping dependencies)
              && apt-mark showmanual | xargs apt-mark auto > /dev/null \
              && { [ -z "$savedAptMark" ] || apt-mark manual $savedAptMark; } \
              \
  # create a temporary local APT repo to install from (so that dependency resolution can be handled by APT, as it should be)
              && ls -lAFh "$tempDir" \
              && ( cd "$tempDir" && dpkg-scanpackages . > Packages ) \
              && grep '^Package: ' "$tempDir/Packages" \
              && echo "deb [ trusted=yes ] file://$tempDir ./" > /etc/apt/sources.list.d/temp.list \
  # work around the following APT issue by using "Acquire::GzipIndexes=false" (overriding "/etc/apt/apt.conf.d/docker-gzip-indexes")
  #   Could not open file /var/lib/apt/lists/partial/_tmp_tmp.ODWljpQfkE_._Packages - open (13: Permission denied)
  #   ...
  #   E: Failed to fetch store:/var/lib/apt/lists/partial/_tmp_tmp.ODWljpQfkE_._Packages  Could not open file /var/lib/apt/lists/partial/_tmp_tmp.ODWljpQfkE_._Packages - open (13: Permission denied)
              && apt-get -o Acquire::GzipIndexes=false update \
              ;; \
      esac \
      \
      && apt-get install --no-install-recommends --no-install-suggests -y \
                          $nginxPackages \
                          gettext-base \
                          curl \
      && apt-get remove --purge --auto-remove -y && rm -rf /var/lib/apt/lists/* /etc/apt/sources.list.d/nginx.list \
      \
  # if we have leftovers from building, let's purge them (including extra, unnecessary build deps)
      && if [ -n "$tempDir" ]; then \
          apt-get purge -y --auto-remove \
          && rm -rf "$tempDir" /etc/apt/sources.list.d/temp.list; \
      fi \
  # forward request and error logs to docker log collector
      && ln -sf /dev/stdout /var/log/nginx/access.log \
      && ln -sf /dev/stderr /var/log/nginx/error.log \
  # create a docker-entrypoint.d directory
      && mkdir /docker-entrypoint.d
  
  COPY docker-entrypoint.sh /
  COPY 10-listen-on-ipv6-by-default.sh /docker-entrypoint.d
  COPY 20-envsubst-on-templates.sh /docker-entrypoint.d
  COPY 30-tune-worker-processes.sh /docker-entrypoint.d
  ENTRYPOINT ["/docker-entrypoint.sh"]
  
  EXPOSE 80
  
  STOPSIGNAL SIGQUIT
  
  CMD ["nginx", "-g", "daemon off;"]
  ```



### DockerFile构建过程

- 基础知识

>1、每个保留关键字（命令）都是大写
>
>2、命令从上到下顺序执行
>
>3、# 表示注释
>
>4、每一个指令都会创建提交一个新的镜像层并提交

 ![docker_image1](D:\RobotINX\Desktop\linux\img\docker_image1.png)



### DockerFile命令

- 命令讲解

  ```shell
  FROM              # 基础镜像，当前新镜像是基于哪个镜像构建的
  MAINTAINER        # 镜像维护者的姓名和邮箱地址
  RUN               # 镜像构建的时候需要运行的命令
  EXPOSE            # 当前镜像对外暴露的端口，效果同docker run后的-p
  WORKDIR           # 指定在创建容器后，终端默认登录的工作目录位置
  ENV               # 用来构建镜像过程中设置环境变量，效果同docker run后的-e
  ADD               # 将本地目录下的文件拷贝到镜像，且ADD命令会自动处理URL和解压tar压缩包
  COPY              # 类似于ADD，拷贝文件和目录到镜像中
                    # 将从构建上下文目录中<src_dir>的文件或目录复制到新的一层的镜像内的<dst_dir>位置
  VOLUME            # 容器数据卷，挂载的目录，用于数据保存和持久化工作，效果同docker run后的-v
  CMD               # 指定容器启动时要运行的命令
                    # DockerFile 中可以有多个CMD命令，但只有最后一个生效，CMD会被docker run之后的参数替换
  ENTRYPOINT        # 指定容器启动时要运行的命令
                    # ENTRYPOINT 的目的和CMD一样，都是指定容器启动程序和参数，但是ENTRYPOINT不会被替换
  ONBUILD           # 当构建一个被继承的DockerFile时运行命令，父镜像在被子镜像继承后父镜像的onbuild会触发
  ```

### 构建Centos镜像

- 编写DockerFile

  ```dockerfile
  # 基础镜像
  FROM centos
  
  #作者
  MAINTAINER Robotinx<robotinx@qq.com>
  
  ENV MYPATH /usr/local
  
  WORKDIR $MYPATH
  
  RUN yum -y install vim 
  RUN yum -y install net-tools
  
  EXPOSE 80
  
  CMD echo $MYPATH
  CMD /bin/bash
  ```

- 构建镜像

  ```shell
  [root@VM-0-13-centos DockerFile]# docker build -f myCentos.dockerfile -t mycentos .
  ```

- 查看镜像构建层次

  ```shell
  [root@VM-0-13-centos DockerFile]# docker history nginx
  IMAGE          CREATED      CREATED BY                                      SIZE      COMMENT
  fa5269854a5e   4 days ago   /bin/sh -c #(nop)  CMD ["nginx" "-g" "daemon…   0B        
  <missing>      4 days ago   /bin/sh -c #(nop)  STOPSIGNAL SIGQUIT           0B        
  <missing>      4 days ago   /bin/sh -c #(nop)  EXPOSE 80                    0B        
  <missing>      4 days ago   /bin/sh -c #(nop)  ENTRYPOINT ["/docker-entr…   0B        
  <missing>      4 days ago   /bin/sh -c #(nop) COPY file:09a214a3e07c919a…   4.61kB    
  <missing>      4 days ago   /bin/sh -c #(nop) COPY file:0fd5fca330dcd6a7…   1.04kB    
  <missing>      4 days ago   /bin/sh -c #(nop) COPY file:0b866ff3fc1ef5b0…   1.96kB    
  <missing>      4 days ago   /bin/sh -c #(nop) COPY file:65504f71f5855ca0…   1.2kB     
  <missing>      4 days ago   /bin/sh -c set -x     && addgroup --system -…   61.1MB    
  <missing>      4 days ago   /bin/sh -c #(nop)  ENV PKG_RELEASE=1~bullseye   0B        
  <missing>      4 days ago   /bin/sh -c #(nop)  ENV NJS_VERSION=0.7.2        0B        
  <missing>      4 days ago   /bin/sh -c #(nop)  ENV NGINX_VERSION=1.21.6     0B        
  <missing>      4 days ago   /bin/sh -c #(nop)  LABEL maintainer=NGINX Do…   0B        
  <missing>      5 days ago   /bin/sh -c #(nop)  CMD ["bash"]                 0B        
  <missing>      5 days ago   /bin/sh -c #(nop) ADD file:8b1e79f91081eb527…   80.4MB 
  ```

  

### 构建tomcat镜像

- 相关环境变量

  ```shell
  export JAVA_HOME=/usr/local/jdk1.8.0_311
  export CLASSPATH=$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
  export CATALINA_HOME=/usr/local/apache-tomcat-10.0.20
  export CATALINA_BASH=/usr/local/apache-tomcat-10.0.20
  export PATH=$PATH:$JAVA_HOME/bin:CATALINA_HOME/lib:CATALINA_HOME/bin
  ```

- 手动搭建tomcat容器的步骤

  ```shell
  #首先下载tomcat和jdk的安装包，并解压
  tar -zxf jdk-8u311-linux-x64.tar.gz
  tar -zxf apache-tomcat-10.0.20
  ls /root/tomcat_docker/
  apache-tomcat-10.0.20         jdk1.8.0_311
  apache-tomcat-10.0.20.tar.gz  jdk-8u311-linux-x64.tar.gz
  ```

  ```shell
  #创建一个新的centos7.9镜像，做好端口映射和容器卷挂载
  docker run  -it --name tomcat_test \
  	-v /root/tomcat_docker/:/usr/local \
  	-p 3344:8080 centos:7.9.2009
  ```

  ```shell
  #编辑环境变量
  vi /etc/profile
  
  export JAVA_HOME=/usr/local/jdk1.8.0_311
  export CLASSPATH=$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
  export CATALINA_HOME=/usr/local/apache-tomcat-10.0.20
  export CATALINA_BASH=/usr/local/apache-tomcat-10.0.20
  export PATH=$PATH:$JAVA_HOME/bin:CATALINA_HOME/lib:CATALINA_HOME/bin
  
  source /etc/profile
  ```

  ```shell
  #现在已经可以运行tomcat了
  cd /usr/local/apache-tomcat-10.0.20/bin
  ./startup.sh
  #也可以在运行的同时输出运行的日志
  ./startup.sh && tail -F /usr/local/apache-tomcat-10.0.20/logs/catalina.out
  ```

- Dockerfile自动构建tomcat镜像

  ```dockerfile
  #文件名为默认的Dockerfile
  #指定工作路径
  WORKDIR /usr/local
  
  #将需要的包添加到镜像中
  ADD jdk-8u311-linux-x64.tar.gz /usr/local/
  ADD apache-tomcat-10.0.20.tar.gz /usr/local/
  
  
  #暴露端口
  EXPOSE 8080
  
  #设置环境变量
  ENV JAVA_HOME=/usr/local/jdk1.8.0_311
  ENV CLASSPATH=$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
  ENV CATALINA_HOME=/usr/local/apache-tomcat-10.0.20
  ENV CATALINA_BASH=/usr/local/apache-tomcat-10.0.20
  ENV PATH=$PATH:$JAVA_HOME/bin:CATALINA_HOME/lib:CATALINA_HOME/bin
  
  #启动tomcat，并打印日志
  #这里不推荐添加这一条命令
  #添加之后可以自动启动tomcat，但是会一直卡在tomcat的日志打印命令
  #官方镜像是添加了这一条命令的
  #CMD ${CATALINA_HOME}/bin/startup.sh && tail -F ${CATALINA_HOME}/logs/catalina.out
  #如果希望镜像自动启动tomcat，可以添加下面这一条命令
  CMD ${CATALINA_HOME}/bin/startup.sh
  ```

  ```shell
  #这时候通过编写好的Dockerfile构建镜像就可以了
  docker build -t mytomcat .
  ```

### 发布docker镜像

- 发布到docker hub

  ```shell
  #首先登录docker hub
  docker login -u robot1nx
  #需要先将镜像的名字修改成符合要求的格式
  docker tag mytomcat:lastest robot1nx/mytomcat
  docker push robot1inx/mytomcat
  ```

- 发布到腾讯云

  ```shell
  #同样先登录腾讯云
  docker login ccr.ccs.tencentyun.com --username=2507697169
  #在腾讯云中建立命名空间和mytomcat镜像仓库之后，会有一个仓库地址，给镜像添加一个地址tag
  docker tag mytomcat:latest ccr.ccs.tencentyun.com/docker_test_robotinx/mytomcat
  #之后就可以直接推送到对应的仓库
  docker push ccr.ccs.tencentyun.com/docker_test_robotinx/mytomcat
  
  #同样的，从仓库中拉取镜像也是使用相应的仓库地址
  docker pull ccr.ccs.tencentyun.com/docker_test_robotinx/mytomcat
  ```

  

### dockers镜像管理

![docker_image2](D:\RobotINX\Desktop\linux\img\docker_image2.png)

>
>
>1、首先编写dockerfile文件
>
>2、编写完成后可以通过build命令来构建镜像
>
>3、构建完成后可以通过tag命令来修改镜像的标签
>
>4、也可以通过push将镜像推送到镜像仓库
>
>5、后续可以通过pull将镜像拉去到其他设备中
>
>6、可以通过run使用现有的镜像构建容器
>
>7、容器的启停命令有start/stop/restart
>
>8、还可以使用commit命令打包现有的镜像来构建新的镜像
>
>9、也可以通过save/load来对镜像进行备份



## Docker网络

### 关于docker0

![docker_net1](D:\RobotINX\Desktop\linux\img\docker_net1.png)

- 在没有容器的情况下查看本机ip地址，会发现有一个docker0的网卡

  ```shell
  3: docker0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
      link/ether 02:42:2c:67:e8:27 brd ff:ff:ff:ff:ff:ff
      inet 172.18.0.1/16 brd 172.18.255.255 scope global docker0
         valid_lft forever preferred_lft forever
      inet6 fe80::42:2cff:fe67:e827/64 scope link 
         valid_lft forever preferred_lft forever
  ```

- 首先创建一个centos01，并查看他的IP地址

  ```shell
  [root@VM-0-13-centos ~]# docker run -it -P --name centos01 centos
  [root@daac89144d42 /]# ip addr
  1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
      link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
      inet 127.0.0.1/8 scope host lo
         valid_lft forever preferred_lft forever
  327: veth70d770c@if326: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master docker0 state UP group default 
      link/ether 92:6a:4f:b7:1b:a7 brd ff:ff:ff:ff:ff:ff link-netnsid 0
      inet6 fe80::906a:4fff:feb7:1ba7/64 scope link 
         valid_lft forever preferred_lft forever
  ```

- 这时候在本地查看ip地址会发现除了docker0还会多一个网卡

  ```shell
  3: docker0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
      link/ether 02:42:2c:67:e8:27 brd ff:ff:ff:ff:ff:ff
      inet 172.18.0.1/16 brd 172.18.255.255 scope global docker0
         valid_lft forever preferred_lft forever
      inet6 fe80::42:2cff:fe67:e827/64 scope link 
         valid_lft forever preferred_lft forever
  327: veth70d770c@if326: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master docker0 state UP group default 
      link/ether 92:6a:4f:b7:1b:a7 brd ff:ff:ff:ff:ff:ff link-netnsid 0
      inet6 fe80::906a:4fff:feb7:1ba7/64 scope link 
         valid_lft forever preferred_lft forever
  ```

- 再创建一个centos02

  ```shell
  [root@VM-0-13-centos ~]# docker run --name centos02 -P -it centos
  [root@2e1080262248 /]# ip addr
  1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
      link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
      inet 127.0.0.1/8 scope host lo
         valid_lft forever preferred_lft forever
  328: eth0@if329: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
      link/ether 02:42:ac:12:00:03 brd ff:ff:ff:ff:ff:ff link-netnsid 0
      inet 172.18.0.3/16 brd 172.18.255.255 scope global eth0
         valid_lft forever preferred_lft forever
  ```

- 再次查看网卡，发现又多了一个网卡

  ```shell
  3: docker0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
      link/ether 02:42:2c:67:e8:27 brd ff:ff:ff:ff:ff:ff
      inet 172.18.0.1/16 brd 172.18.255.255 scope global docker0
         valid_lft forever preferred_lft forever
      inet6 fe80::42:2cff:fe67:e827/64 scope link 
         valid_lft forever preferred_lft forever
  327: veth70d770c@if326: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master docker0 state UP group default 
      link/ether 92:6a:4f:b7:1b:a7 brd ff:ff:ff:ff:ff:ff link-netnsid 0
      inet6 fe80::906a:4fff:feb7:1ba7/64 scope link 
         valid_lft forever preferred_lft forever
  329: veth46507ae@if328: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master docker0 state UP group default 
      link/ether 8a:7a:7d:ca:e2:99 brd ff:ff:ff:ff:ff:ff link-netnsid 1
      inet6 fe80::887a:7dff:feca:e299/64 scope link 
         valid_lft forever preferred_lft forever
  ```

- 仔细查看会发现除了docker0，其他的两个本地网卡分别和容器内部的网卡是一一对应的

  ```shell
  #在centos01中的网卡和本地的网卡的对应关系
  322: eth0@if323: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
      link/ether 02:42:ac:12:00:02 brd ff:ff:ff:ff:ff:ff link-netnsid 0
      inet 172.18.0.2/16 brd 172.18.255.255 scope global eth0
         valid_lft forever preferred_lft forever
  
  323: veth5a3b2d1@if322: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master docker0 state UP group default 
      link/ether 7a:5b:bd:54:64:88 brd ff:ff:ff:ff:ff:ff link-netnsid 0
      inet6 fe80::785b:bdff:fe54:6488/64 scope link 
         valid_lft forever preferred_lft forever
  ```

  ```shell
  #在centos02中的网卡和本地的网卡的对应关系
  324: eth0@if325: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
      link/ether 02:42:ac:12:00:03 brd ff:ff:ff:ff:ff:ff link-netnsid 0
      inet 172.18.0.3/16 brd 172.18.255.255 scope global eth0
         valid_lft forever preferred_lft forever
         
  325: vethaf7b3bf@if324: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master docker0 state UP group default 
      link/ether ae:a0:d1:95:67:ed brd ff:ff:ff:ff:ff:ff link-netnsid 1
      inet6 fe80::aca0:d1ff:fe95:67ed/64 scope link 
         valid_lft forever preferred_lft forever       
  ```

- 原理

  >
  >
  >docker0 使用了veth-pair技术，是成对出现的虚拟设备接口
  >
  >1、只要我们安装了docker，就会有一个虚拟的网卡docker0
  >
  >2、docker0 相当与一个网关
  >
  >3、我们每启动一个容器，docker就会给容器分配一个ip
  >
  >4、每一次容器重新启动，这个IP都会变动
  >
  >5、容器删除或关闭之后，对应的网卡都会消失
  >
  >6、启动中的容器和主机之间都是能互通

![docker_net1](D:\RobotINX\Desktop\linux\img\docker_net1.png)

### docker network 查看网络配置

- 通过docker network 可以查看网络的相关配置

  ```shell
  docker network --help
  
  Usage:  docker network COMMAND
  
  Manage networks
  
  Commands:
    connect     Connect a container to a network
    create      Create a network
    disconnect  Disconnect a container from a network
    inspect     Display detailed information on one or more networks
    ls          List networks
    prune       Remove all unused networks
    rm          Remove one or more networks
  
  Run 'docker network COMMAND --help' for more information on a command.
  ```

- 我们看一下docker0的网络配置

  ```shell
  [root@VM-0-13-centos ~]# docker network ls
  NETWORK ID     NAME      DRIVER    SCOPE
  9b4873778c95   bridge    bridge    local
  59fdb2170ace   host      host      local
  760f93db25b8   none      null      local
  
  [root@VM-0-13-centos ~]# docker network inspect 9b4873778c95
  [
      {
          "Name": "bridge",
          "Id": "9b4873778c95a5796209b1d4acafa5d4563cdfd2413a26aa0d06497bde906204",
          "Created": "2022-04-25T16:02:08.636683876+08:00",
          "Scope": "local",
          "Driver": "bridge",
          "EnableIPv6": false,
          "IPAM": {
              "Driver": "default",
              "Options": null,
              "Config": [
                  {
                      "Subnet": "172.18.0.0/16",
                      "Gateway": "172.18.0.1"
                  }
              ]
          },
          "Internal": false,
          "Attachable": false,
          "Ingress": false,
          "ConfigFrom": {
              "Network": ""
          },
          "ConfigOnly": false,
          "Containers": {
              "2f41dd2a4bd6a1c2ba690c7170a7d3c7df1cdcc975e8fcfdc7e0d0d21b5c3663": {
                  "Name": "centos01",
                  "EndpointID": "033e850175059e856af3afd8db54d33d6a0ecf0a5716d7acc220fd32f248ba7c",
                  "MacAddress": "02:42:ac:12:00:02",
                  "IPv4Address": "172.18.0.2/16",
                  "IPv6Address": ""
              },
              "807d74ee030159e9064155e95c7ea98ce0e1cd15b476603b550fab7c69e9fe53": {
                  "Name": "centos02",
                  "EndpointID": "c6c23fa80e3691cc8e647bc65136d3aa4256b579f59e9c5c513167a2f6f27cde",
                  "MacAddress": "02:42:ac:12:00:03",
                  "IPv4Address": "172.18.0.3/16",
                  "IPv6Address": ""
              },
              "b71f2bd1e484dfc926fc608df09d282814b4334a3c5b770be0c1a4627724ffc9": {
                  "Name": "centos03",
                  "EndpointID": "32b7b310229e7b327a652cc0c740bdb867001bd544d964a0fcfc6c94e54274c1",
                  "MacAddress": "02:42:ac:12:00:04",
                  "IPv4Address": "172.18.0.4/16",
                  "IPv6Address": ""
              }
          },
          "Options": {
              "com.docker.network.bridge.default_bridge": "true",
              "com.docker.network.bridge.enable_icc": "true",
              "com.docker.network.bridge.enable_ip_masquerade": "true",
              "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
              "com.docker.network.bridge.name": "docker0",
              "com.docker.network.driver.mtu": "1500"
          },
          "Labels": {}
      }
  ]
  ```

  >
  >
  >可以看到docker0这个网卡被定义成了一个类似网桥/网关的设备
  >
  >同时还创建了一个子网，并且网关就是docker0
  >
  >                    "Subnet": "172.18.0.0/16",
  >                    "Gateway": "172.18.0.1"
  >
  >其他创建的容器都在这个子网内有分配的ip地址



### --link 通过容器名访问

- 由于docker容器每一次重启都会导致IP变动，通过固定IP访问的服务就需要换一种访问方式

  ```shell
  #通过--link创建的容器可以直接用容器名访问指定的容器
  #创建一个与centos01相连的centos03
  docker run -it -P --name centos03 --link centos01 centos
  #这时候centos03就可以通过容器名ping通centos01了
  [root@VM-0-13-centos ~]# docker exec centos03 ping centos01
  PING centos01 (172.18.0.2) 56(84) bytes of data.
  64 bytes from centos01 (172.18.0.2): icmp_seq=1 ttl=64 time=0.120 ms
  64 bytes from centos01 (172.18.0.2): icmp_seq=2 ttl=64 time=0.067 ms
  #但是centos01因为不是指定与centos03相连的，所以还是无法通过容器名ping通centos03
  [root@VM-0-13-centos ~]# docker exec centos01 ping centos03
  ping: centos03: Name or service not known
  ```

- 实际上是通过往hosts文件中添加了相应的dns

  ```shell
  [root@VM-0-13-centos ~]# docker exec centos03 cat /etc/hosts
  127.0.0.1	localhost
  ::1	localhost ip6-localhost ip6-loopback
  fe00::0	ip6-localnet
  ff00::0	ip6-mcastprefix
  ff02::1	ip6-allnodes
  ff02::2	ip6-allrouters
  #添加了一条指定host名为centos01和centos01 的容器ID的记录
  172.18.0.2	centos01 2f41dd2a4bd6
  #这条记录添加了centos03 自己的容器ID记录
  172.18.0.4	b71f2bd1e484
  ```

- 同时我们还可以通过 docker inspect centos03来查看相关的记录

  ```shell
  #多了一条这样的记录
              "Links": [
                  "/centos01:/centos03/centos01"
              ],
  ```

### 自定义网络

- 网络模式

  ```shell
  #查看所有的网络
  [root@VM-0-13-centos ~]# docker network ls
  NETWORK ID     NAME      DRIVER    SCOPE
  9b4873778c95   bridge    bridge    local
  59fdb2170ace   host      host      local
  760f93db25b8   none      null      local
  ```

  >
  >
  >这里有三种网络连接模式，还有一种额外的模式
  >
  >1、bridge 桥接模式（默认网络连接）
  >
  >2、host 主机模式（一般自定义配置）
  >
  >3、null 不配置网络（不推荐，自己固定IP）
  >
  >4、container 容器网络连通（用得少，局限大）

- 测试

  ```shell
  #实际上下面两条指令是等价的
  docker run -it -P --name centos01 cnetos:7.9.2009
  docker run -it p_ --name centos01 --net bridge centos:7.9.2009
  
  #docker0特点：默认，域名默认无法访问，可以通过--link连通
  ```

  ```shell
  #首先创建一个子网
  docker network create --gateway 192.168.1.1 --subnet 192.168.1.0/24 mynet
  #这时候可以查看子网的相关信息
  docker network inspect mynet
  #也可以通过子网创建新的虚拟机
  docker run -P -it --name cnetos01 --net mynet centos:7.9.2009
  docker run -P -it --name cnetos02 --net mynet centos:7.9.2009
  #这时候我们再查看子网的相关信息会发现多了一些信息
  docker network inspect mynet
          "Containers": {
              "15e46ecd488292c3025f525ff7cff7b7e6dada6d4c3c2309bcbdbf2439e3c3a8": {
                  "Name": "centos02",
                  "EndpointID": "f48b22be77085d2fbbd8aa32e5a4b164176ea642b3e0bc9efacd4d87c2caf69e",
                  "MacAddress": "02:42:c0:a8:01:03",
                  "IPv4Address": "192.168.1.3/24",
                  "IPv6Address": ""
              },
              "a0df9d10a1fe611b487d23acaf5faaf5324eabdbe8ade44e4f9f6ee7e1c385ae": {
                  "Name": "centos01",
                  "EndpointID": "ddf917c17f51d8b163902d470e07101afec1b83add0094310cbd8e4748bf01b0",
                  "MacAddress": "02:42:c0:a8:01:02",
                  "IPv4Address": "192.168.1.2/24",
                  "IPv6Address": ""
              }
          },
  #同时，通过域名来ping彼此也是互通的
  [root@VM-0-13-centos ~]# docker exec centos01 ping centos02
  PING centos02 (192.168.1.3) 56(84) bytes of data.
  64 bytes from centos02.mynet (192.168.1.3): icmp_seq=1 ttl=64 time=0.058 ms
  64 bytes from centos02.mynet (192.168.1.3): icmp_seq=2 ttl=64 time=0.067 ms
  64 bytes from centos02.mynet (192.168.1.3): icmp_seq=3 ttl=64 time=0.070 ms
  #这时候我们再查看本地的ip信息，可以发现又多了三个网络
  332: br-752dae1ac4fc: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
      link/ether 02:42:64:98:88:85 brd ff:ff:ff:ff:ff:ff
      inet 192.168.1.1/24 brd 192.168.1.255 scope global br-752dae1ac4fc
         valid_lft forever preferred_lft forever
      inet6 fe80::42:64ff:fe98:8885/64 scope link 
         valid_lft forever preferred_lft forever
  342: veth8a21fcf@if341: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-752dae1ac4fc state UP group default 
      link/ether c6:83:50:26:ed:77 brd ff:ff:ff:ff:ff:ff link-netnsid 0
      inet6 fe80::c483:50ff:fe26:ed77/64 scope link 
         valid_lft forever preferred_lft forever
  344: veth02489a4@if343: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master br-752dae1ac4fc state UP group default 
      link/ether 22:b1:8d:22:2e:ac brd ff:ff:ff:ff:ff:ff link-netnsid 1
      inet6 fe80::20b1:8dff:fe22:2eac/64 scope link 
         valid_lft forever preferred_lft forever
  ```

  >
  >
  >这种做法的好处是不同的集群使用不同的网络，保证了集群之间是互通的
  >
  >但是有一点需要注意的是，通过这种方法分配的容器的IP，也是会变动的
  >
  >容器关闭之后再重启，IP就会改变



### 网络互通

```shell
#这个时候我们有四个不同容器
[root@VM-0-13-centos ~]# docker ps
CONTAINER ID   IMAGE             COMMAND       CREATED              STATUS              PORTS     NAMES
ab318d8cc387   centos:7.9.2009   "/bin/bash"   9 seconds ago        Up 8 seconds                  centos02
3c672037d852   centos:7.9.2009   "/bin/bash"   27 seconds ago       Up 26 seconds                 centos01
1c94f9565448   centos:7.9.2009   "/bin/bash"   49 seconds ago       Up 48 seconds                 centos_mynet_02
350ccd043887   centos:7.9.2009   "/bin/bash"   About a minute ago   Up About a minute             centos_mynet_01

#他们分别属于两个不同的子网
#我们可以把其中一个添加到另一个的子网中去
docker network connect mynet centos01
#之后centos01就可以与mynet子网下的所有容器互通
[root@VM-0-13-centos ~]# docker exec centos01 ping centos_mynet_01
PING centos_mynet_01 (192.168.1.2) 56(84) bytes of data.
64 bytes from centos_mynet_01.mynet (192.168.1.2): icmp_seq=1 ttl=64 time=0.076 ms
64 bytes from centos_mynet_01.mynet (192.168.1.2): icmp_seq=2 ttl=64 time=0.071 ms

[root@VM-0-13-centos ~]# docker exec centos01 ping centos_mynet_02
PING centos_mynet_02 (192.168.1.3) 56(84) bytes of data.
64 bytes from centos_mynet_02.mynet (192.168.1.3): icmp_seq=1 ttl=64 time=0.139 ms
64 bytes from centos_mynet_02.mynet (192.168.1.3): icmp_seq=2 ttl=64 time=0.077 ms
```

```shell
#查看centos01 的配置信息之后发现是把centos01也加到了mynet的网络中，并且分配了一个专属的IP
#所以本质就是给指定的容器加多了一个网卡，并且连接到了指定的子网当中
docker inspect centos01
            "Networks": {
                "bridge": {
                    "IPAMConfig": null,
                    "Links": null,
                    "Aliases": null,
                    "NetworkID": "9b4873778c95a5796209b1d4acafa5d4563cdfd2413a26aa0d06497bde906204",
                    "EndpointID": "4affaca7f787a1c50e3165e1fae54531ea201c9efe78efc83dd7d6d2cf7fc9d0",
                    "Gateway": "172.18.0.1",
                    "IPAddress": "172.18.0.2",
                    "IPPrefixLen": 16,
                    "IPv6Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
                    "MacAddress": "02:42:ac:12:00:02",
                    "DriverOpts": null
                },
                "mynet": {
                    "IPAMConfig": {},
                    "Links": null,
                    "Aliases": [
                        "3c672037d852"
                    ],
                    "NetworkID": "752dae1ac4fc9e2e53154d183f954dd715de6445c9aa85aadb732f48298ac345",
                    "EndpointID": "2e22a1628533846cae6eddef37045fae93233f3f1cc73891bab6f6f06f370f34",
                    "Gateway": "192.168.1.1",
                    "IPAddress": "192.168.1.4",
                    "IPPrefixLen": 24,
                    "IPv6Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
                    "MacAddress": "02:42:c0:a8:01:04",
                    "DriverOpts": {}
                }
            }
```



### 部署redis集群

- 编写redis配置生成脚本

  ```shell
  #!/bin/bash
  
  for num in {1..6};do
          #echo $num
          mkdir -p /root/redis/node-${num}/conf
          touch /root/redis/node-${num}/conf/redis.conf
          # 批量输入文本内容，> 为覆盖重定向到文本，>> 为追加重定向到文本
          # <<EOF 标识符，当遇到EOF时停止输入内容到文本
          cat > /root/redis/node-${num}/conf/redis.conf <<EOF
  #redis的配置
  port 6379
  bind 0.0.0.0
  cluster-enabled yes
  cluster-config-file nodes.conf
  cluster-node-timeout 5000
  cluster-announce-ip 192.168.1.1${num}
  cluster-announce-port 6379
  cluster-announce-bus-port 16379
  appendonly yes
  #重定向结束
  EOF
  done
  ```

  ```shell
  # 生成后的文件夹
  [root@VM-0-13-centos ~]# tree /root/redis/
  /root/redis/
  |-- docker.sh
  |-- node-1
  |   |-- conf
  |   |   `-- redis.conf
  |   `-- data
  |       |-- appendonly.aof
  |       |-- dump.rdb
  |       `-- nodes.conf
  |-- node-2
  |   |-- conf
  |   |   `-- redis.conf
  |   `-- data
  |       |-- appendonly.aof
  |       |-- dump.rdb
  |       `-- nodes.conf
  |-- node-3
  |   |-- conf
  |   |   `-- redis.conf
  |   `-- data
  |       |-- appendonly.aof
  |       |-- dump.rdb
  |       `-- nodes.conf
  |-- node-4
  |   |-- conf
  |   |   `-- redis.conf
  |   `-- data
  |       |-- appendonly.aof
  |       |-- dump.rdb
  |       `-- nodes.conf
  |-- node-5
  |   |-- conf
  |   |   `-- redis.conf
  |   `-- data
  |       |-- appendonly.aof
  |       |-- dump.rdb
  |       `-- nodes.conf
  |-- node-6
  |   |-- conf
  |   |   `-- redis.conf
  |   `-- data
  |       |-- appendonly.aof
  |       |-- dump.rdb
  |       `-- nodes.conf
  `-- redis.sh
  ```

  

- 编写生成docker容器的脚本

  ```shell
  #!/bin/bash
  
  for num in {1..6};do
  docker run -p 637${num}:6379 -p 1637${num}:16379 --name redis-${num} \
  	-v /root/redis/node-${num}/data:/data \
  	-v /root/redis/node-${num}/conf/redis.conf:/etc/redis/redis.conf \
  	-d --net redis --ip 192.168.1.1${num} redis redis-server /etc/redis/redis.conf
  done
  
  # 以下是redis-1节点的容器生成指令
  # 块注释
  :<<EOF
  docker run -p 6371:6379 -p 16371:16379 --name redis-1 \
  -v /root/redis/node-1/data:/data \
  -v /root/redis/node-1/conf/redis.conf:/etc/redis/redis.conf \
  -d --net redis --ip 192.168.1.11 redis redis-server /etc/redis/redis.conf
  EOF
  ```

  ```shell
  #创建后的容器列表
  [root@VM-0-13-centos ~]# docker ps
  CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS                                                                                      NAMES
  adf634167caf   redis     "docker-entrypoint.s…"   12 minutes ago   Up 12 minutes   0.0.0.0:6376->6379/tcp, :::6376->6379/tcp, 0.0.0.0:16376->16379/tcp, :::16376->16379/tcp   redis-6
  54ea1500d23c   redis     "docker-entrypoint.s…"   12 minutes ago   Up 12 minutes   0.0.0.0:6375->6379/tcp, :::6375->6379/tcp, 0.0.0.0:16375->16379/tcp, :::16375->16379/tcp   redis-5
  fcd42b8fbd49   redis     "docker-entrypoint.s…"   12 minutes ago   Up 12 minutes   0.0.0.0:6374->6379/tcp, :::6374->6379/tcp, 0.0.0.0:16374->16379/tcp, :::16374->16379/tcp   redis-4
  7088e74db436   redis     "docker-entrypoint.s…"   12 minutes ago   Up 12 minutes   0.0.0.0:6373->6379/tcp, :::6373->6379/tcp, 0.0.0.0:16373->16379/tcp, :::16373->16379/tcp   redis-3
  854f3b9645b1   redis     "docker-entrypoint.s…"   12 minutes ago   Up 12 minutes   0.0.0.0:6372->6379/tcp, :::6372->6379/tcp, 0.0.0.0:16372->16379/tcp, :::16372->16379/tcp   redis-2
  1f2d1b2540f9   redis     "docker-entrypoint.s…"   12 minutes ago   Up 12 minutes   0.0.0.0:6371->6379/tcp, :::6371->6379/tcp, 0.0.0.0:16371->16379/tcp, :::16371->16379/tcp   redis-1
  ```

  

- 进入redis中连接节点创建集群

  ```shell
  docker exec -it redis-1 /bin/sh
  
  redis-cli --cluster create 192.168.1.11:6379 192.168.1.12:6379 192.168.1.13:6379 \
  							192.168.1.14:6379 192.168.1.15:6379 192.168.1.16:6379 \
  							--cluster-replicas 1
  ```

  ```shell
  # 创建集群成功后的集群信息
  127.0.0.1:6379> cluster info
  cluster_state:ok
  cluster_slots_assigned:16384
  cluster_slots_ok:16384
  cluster_slots_pfail:0
  cluster_slots_fail:0
  cluster_known_nodes:6
  cluster_size:3
  cluster_current_epoch:6
  cluster_my_epoch:1
  cluster_stats_messages_ping_sent:391
  cluster_stats_messages_pong_sent:388
  cluster_stats_messages_sent:779
  cluster_stats_messages_ping_received:383
  cluster_stats_messages_pong_received:391
  cluster_stats_messages_meet_received:5
  cluster_stats_messages_received:779
  ```

  ```shell
  # 创建集群成功后的节点状态
  127.0.0.1:6379> cluster nodes
  d7ebd111f110244092dafb348d2092593c84ee2a 192.168.1.14:6379@16379 slave 0cad009726d17ca7ef53a0d12eb4a2da95a28b58 0 1650914152525 3 connected
  46a41b647fdd54796aada765a869bfe281af1da1 192.168.1.12:6379@16379 master - 0 1650914153127 2 connected 5461-10922
  5a0626ee8e705a1c147fbb0be98a2f0cbbcf14bd 192.168.1.16:6379@16379 slave 46a41b647fdd54796aada765a869bfe281af1da1 0 1650914152124 2 connected
  7124136c94464fe121a7b217dfdbd91c44b0970c 192.168.1.11:6379@16379 myself,master - 0 1650914151000 1 connected 0-5460
  67d402fdf403a700a369ff52e7f60ddd5966a58d 192.168.1.15:6379@16379 slave 7124136c94464fe121a7b217dfdbd91c44b0970c 0 1650914153629 1 connected
  0cad009726d17ca7ef53a0d12eb4a2da95a28b58 192.168.1.13:6379@16379 master - 0 1650914153027 3 connected 10923-16383
  ```



- 检查是否部署成功

  ```shell
  # 往集群中保存一个值
  # redis-cli -c
  127.0.0.1:6379> set x y
  # 值被保存到了ip为14的节点上，这个节点是redis-4的容器
  -> Redirected to slot [16287] located at 192.168.1.14:6379
  OK
  ```

  ```shell
  # 把redis-4容器停掉
  docker stop redis-4
  # 查询x的值看是否还能查询到
  # redis-cli -c
  127.0.0.1:6379> get x
  -> Redirected to slot [16287] located at 192.168.1.13:6379
  "y"
  #可以看到x仍然是可以查询到的
  #但是是从备机13也就是redis-3中查询到的
  #这说明在主机down掉之后，启用了备机
  ```



- 再次查看集群的节点状态

  ```shell
  #可以看到节点14也就是redis-4是连接失败了的
  127.0.0.1:6379> cluster nodes
  d7ebd111f110244092dafb348d2092593c84ee2a 192.168.1.14:6379@16379 master,fail - 1650914787784 1650914785273 7 connected
  46a41b647fdd54796aada765a869bfe281af1da1 192.168.1.12:6379@16379 master - 0 1650914997003 2 connected 5461-10922
  5a0626ee8e705a1c147fbb0be98a2f0cbbcf14bd 192.168.1.16:6379@16379 slave 46a41b647fdd54796aada765a869bfe281af1da1 0 1650914998006 2 connected
  7124136c94464fe121a7b217dfdbd91c44b0970c 192.168.1.11:6379@16379 myself,master - 0 1650914997000 1 connected 0-5460
  67d402fdf403a700a369ff52e7f60ddd5966a58d 192.168.1.15:6379@16379 slave 7124136c94464fe121a7b217dfdbd91c44b0970c 0 1650914998509 1 connected
  0cad009726d17ca7ef53a0d12eb4a2da95a28b58 192.168.1.13:6379@16379 master - 0 1650914998000 8 connected 10923-16383
  ```



- 重启redis-4，并查看状态

  ```shell
  docker start redis-4
  
  #这时候可以看到，redis-4又重新连接上来了
  #不过这次redis-4是作为redis-3的备机
  127.0.0.1:6379> cluster nodes
  d7ebd111f110244092dafb348d2092593c84ee2a 192.168.1.14:6379@16379 slave 0cad009726d17ca7ef53a0d12eb4a2da95a28b58 0 1650915071160 8 connected
  46a41b647fdd54796aada765a869bfe281af1da1 192.168.1.12:6379@16379 master - 0 1650915071261 2 connected 5461-10922
  5a0626ee8e705a1c147fbb0be98a2f0cbbcf14bd 192.168.1.16:6379@16379 slave 46a41b647fdd54796aada765a869bfe281af1da1 0 1650915072264 2 connected
  7124136c94464fe121a7b217dfdbd91c44b0970c 192.168.1.11:6379@16379 myself,master - 0 1650915071000 1 connected 0-5460
  67d402fdf403a700a369ff52e7f60ddd5966a58d 192.168.1.15:6379@16379 slave 7124136c94464fe121a7b217dfdbd91c44b0970c 0 1650915073267 1 connected
  0cad009726d17ca7ef53a0d12eb4a2da95a28b58 192.168.1.13:6379@16379 master - 0 1650915071000 8 connected 10923-16383
  
  ```

  



## Docker compose



## Docker Swarm



## CI/CD Jenkins流水线







# Git

## Git的工作原理

```shell
#参考资料
https://www.jianshu.com/p/7ba146fc720c
```



![git_workflow](D:\RobotINX\Desktop\linux\img\git_workflow.png)



## Git的配置文件

- Windows

  >
  >
  >用户配置
  >
  >C:\Users\RobotINX\\.gitconfig
  >
  >```shell
  >[core]
  >	editor = \"D:\\software\\Microsoft VS Code\\Code.exe\" --wait
  >[user]
  >	name = 2507697169@qq.com
  >	email = 2507697169@qq.com
  >[credential]
  >	helper = store
  >[http]
  >	sslVerify = false
  >	postBuffer = 524288000
  >	proxy = http://127.0.0.1:1080/pac?auth=Q0iz7Hq99ebBLyKmyDAB
  >
  >```
  >
  >系统配置
  >
  >D:\software\Git\etc\gitconfig
  >
  >```shell
  >[diff "astextplain"]
  >	textconv = astextplain
  >[filter "lfs"]
  >	clean = git-lfs clean -- %f
  >	smudge = git-lfs smudge -- %f
  >	process = git-lfs filter-process
  >	required = true
  >[http]
  >	sslBackend = openssl
  >	sslCAInfo = D:/software/Git/mingw64/ssl/certs/ca-bundle.crt
  >[core]
  >	autocrlf = true
  >	fscache = true
  >	symlinks = false
  >[pull]
  >	rebase = false
  >[credential]
  >	helper = manager-core
  >[credential "https://dev.azure.com"]
  >	useHttpPath = true
  >[init]
  >	defaultBranch = master
  >
  >```

  

- Linux

  ```shell
  # 暂时没发现配置文件的位置
  # 可以通过相应的命令和配置值来配置
  git config --global user.name robotinx@qq.com
  git config --global user.email robotinx@qq.com
  ```

  





























