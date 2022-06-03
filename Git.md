# Git的工作原理

```shell
#参考资料
https://www.jianshu.com/p/7ba146fc720c
```



![git_workflow](D:\RobotINX\Desktop\linux\img\git_workflow.png)



# Git的配置文件

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



# 基础命令

## git init

> **在一个没有.git隐藏文件的文件夹中使用`git init`命令可以把该文件夹添加到git的工作目录中**

```shell
RobotINX@DESKTOP-TJ0973O MINGW64 /d/RobotINX/Desktop/git/gitinit
$ git init
Initialized empty Git repository in D:/RobotINX/Desktop/git/gitinit/.git/
```



## git clone

>在一个没有.git隐藏文件的文件夹中使用`git clone`命令可以把指定仓库中的文件辅助到当前文件夹中

```shell
RobotINX@DESKTOP-TJ0973O MINGW64 /d/RobotINX/Desktop/git/gitclone
$ git clone https://github.com/RobotINX/linux-tutorial.git
Cloning into 'linux-tutorial'...
remote: Enumerating objects: 3960, done.
remote: Counting objects: 100% (136/136), done.
remote: Compressing objects: 100% (59/59), done.
remote: Total 3960 (delta 88), reused 77 (delta 77), pack-reused 3824
Receiving objects: 100% (3960/3960), 4.41 MiB | 3.89 MiB/s, done.
Resolving deltas: 100% (2160/2160), done.
```



## git status

> 在git的工作文件夹中一般都会有一个.git文件，只要创建工作文件夹成功都会有这个文件
>
> 创建工作文件夹成功后就可以正常开始写代码
>
> 通过`git status`命令可以查看到文件夹内的文件是否已经同步到暂存区
>
> 在`git status`命令中可以很明显看到没有同步到暂存区的文件是鲜艳的红色

```shell
RobotINX@DESKTOP-TJ0973O MINGW64 /d/RobotINX/Desktop/git/gitinit (master)
$ git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        test.txt
        test1.txt
        test2.txt
```



## git add

> `git add`可以将没有同步到暂存区的文件同步到暂存区，可以单个添加，也可以多个添加，还可以全部添加

```shell
# 单个添加
RobotINX@DESKTOP-TJ0973O MINGW64 /d/RobotINX/Desktop/git/gitinit (master)
$ git add test.txt
# 可以看到对应的文件已经添加到了暂存区
RobotINX@DESKTOP-TJ0973O MINGW64 /d/RobotINX/Desktop/git/gitinit (master)
$ git status
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
        new file:   test.txt

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        test1.txt
        test2.txt
        test3.txt
        test4.txt
        
```

```shell
# 多个添加
RobotINX@DESKTOP-TJ0973O MINGW64 /d/RobotINX/Desktop/git/gitinit (master)
$ git add test1.txt test2.txt
warning: LF will be replaced by CRLF in test1.txt.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in test2.txt.
The file will have its original line endings in your working directory

RobotINX@DESKTOP-TJ0973O MINGW64 /d/RobotINX/Desktop/git/gitinit (master)
$ git status
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
        new file:   test.txt
        new file:   test1.txt
        new file:   test2.txt

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        test3.txt
        test4.txt
```

```shell
# 全部添加
RobotINX@DESKTOP-TJ0973O MINGW64 /d/RobotINX/Desktop/git/gitinit (master)
$ git add .
warning: LF will be replaced by CRLF in test3.txt.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in test4.txt.
The file will have its original line endings in your working directory

RobotINX@DESKTOP-TJ0973O MINGW64 /d/RobotINX/Desktop/git/gitinit (master)
$ git status
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
        new file:   test.txt
        new file:   test1.txt
        new file:   test2.txt
        new file:   test3.txt
        new file:   test4.txt
```



## git rm

> 通过`git add`添加到暂存区的文件可以通过`git rm`移除暂存区

```shell
RobotINX@DESKTOP-TJ0973O MINGW64 /d/RobotINX/Desktop/git/gitinit (master)
$ git rm -f test.txt
rm 'test.txt'

RobotINX@DESKTOP-TJ0973O MINGW64 /d/RobotINX/Desktop/git/gitinit (master)
$ git status
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
        new file:   test1.txt
        new file:   test2.txt
        new file:   test3.txt
        new file:   test4.txt
```



## git commit

> 添加到暂存区的文件可以通过`git commit`命令添加到本地仓库
>
> 输入命令后会弹出一个窗口确认那些文件需要提交
>
> 默认所有文件都不提交，将需要提交的文件前面的`#`去掉就是确认提交该文件
>
> 空消息为不提交

```shell
RobotINX@DESKTOP-TJ0973O MINGW64 /d/RobotINX/Desktop/git/gitinit (master)
$ git commit
hint: Waiting for your editor to close the file...
[main 2022-04-27T11:01:45.244Z] window#load: attempt to load window (id: 1)
[main 2022-04-27T11:01:45.265Z] update#setState idle
[main 2022-04-27T11:01:45.323Z] ExtensionHostStarterWorker created
[57104:0427/190146.216:ERROR:jump_list.cc(301)] Failed to append custom category '最近使用的文件夹' to Jump List due to system privacy settings.
[main 2022-04-27T11:01:46.875Z] window#load: window reported ready (id: 1)
[main 2022-04-27T11:01:47.518Z] Starting extension host with pid 39464 (fork() took 37 ms).
[main 2022-04-27T11:01:47.518Z] ExtensionHostStarterWorker.start() took 38 ms.
```

```shell

# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
#
# On branch master
#
# Initial commit
#
# Changes to be committed:
#	new file:   test1.txt
#	new file:   test2.txt
#	new file:   test3.txt
#	new file:   test4.txt
#
```

```shell
# 可以看到所有文件都已经提交到了本地仓库
RobotINX@DESKTOP-TJ0973O MINGW64 /d/RobotINX/Desktop/git/gitinit (master)
$ git status
On branch master
nothing to commit, working tree clean
```



## git reflog

> 查看版本变更的简略信息

```shell
RobotINX@DESKTOP-TJ0973O MINGW64 /d/RobotINX/Desktop/linux (master)
$ git reflog
91705ad (HEAD -> master) HEAD@{0}: commit (initial): master
```



## git log

> 查看版本变更的详细信息

```shell
RobotINX@DESKTOP-TJ0973O MINGW64 /d/RobotINX/Desktop/linux (master)
$ git log
commit 91705ad3d846d6338bf030fd95a60e2d37d8952c (HEAD -> master)
Author: RobotINX <2507697169@qq.com>
Date:   Thu Nov 11 11:24:50 2021 +0800

    master
```



## git reset

> 调整当前版本



# 分支命令

## git branch

```shell
git branch [--color[=<when>] | --no-color] [--show-current]
        [-v [--abbrev=<n> | --no-abbrev]]
        [--column[=<options>] | --no-column] [--sort=<key>]
        [--merged [<commit>]] [--no-merged [<commit>]]
        [--contains [<commit>]] [--no-contains [<commit>]]
        [--points-at <object>] [--format=<format>]
        [(-r | --remotes) | (-a | --all)]
        [--list] [<pattern>…​]
git branch [--track | --no-track] [-f] <branchname> [<start-point>]
git branch (--set-upstream-to=<upstream> | -u <upstream>) [<branchname>]
git branch --unset-upstream [<branchname>]
git branch (-m | -M) [<oldbranch>] <newbranch>
git branch (-c | -C) [<oldbranch>] <newbranch>
git branch (-d | -D) [-r] <branchname>…​
git branch --edit-description [<branchname>]
```



```shell
# 使用git branch命令可以列出所有本地分支
# 带星号和绿色的是当前所在分支
RobotINX@DESKTOP-TJ0973O MINGW64 /d/RobotINX/Desktop/git/gitclone/linux-tutorial (master)
$ git branch
* master
```



## git branch -r

```shell
# 使用git branch -r命令可以列出所有远程分支
RobotINX@DESKTOP-TJ0973O MINGW64 /d/RobotINX/Desktop/git/gitclone/linux-tutorial (master)
$ git branch -r
  origin/HEAD -> origin/master
  origin/gh-pages
  origin/master
```



## git branch -a

```shell
# 使用git branch -a命令可以列出所有分支，包括远程和本地分支
RobotINX@DESKTOP-TJ0973O MINGW64 /d/RobotINX/Desktop/git/gitclone/linux-tutorial (master)
$ git branch -a
* master
  remotes/origin/HEAD -> origin/master
  remotes/origin/gh-pages
  remotes/origin/master
```



## git branch [branch_name]

```shell
# 新建一个分支，但是仍然留在当前分支
RobotINX@DESKTOP-TJ0973O MINGW64 /d/RobotINX/Desktop/git/gitclone/linux-tutorial (master)
$ git branch newbranch

RobotINX@DESKTOP-TJ0973O MINGW64 /d/RobotINX/Desktop/git/gitclone/linux-tutorial (master)
$ git branch
* master
  newbranch
```



## git checkout -b [branch]

```shell
# 新建一个分支，并且切换到该分支
RobotINX@DESKTOP-TJ0973O MINGW64 /d/RobotINX/Desktop/git/gitclone/linux-tutorial (master)
$ git checkout -b newbranch2
Switched to a new branch 'newbranch2'

RobotINX@DESKTOP-TJ0973O MINGW64 /d/RobotINX/Desktop/git/gitclone/linux-tutorial (newbranch2)
$ git branch
  master
  newbranch
* newbranch2
```



## git merge [branch]

```shell
# 合并指定分支到当前分支
RobotINX@DESKTOP-TJ0973O MINGW64 /d/RobotINX/Desktop/git/gitclone/linux-tutorial (newbranch2)
$ git merge newbranch
Already up to date.

RobotINX@DESKTOP-TJ0973O MINGW64 /d/RobotINX/Desktop/git/gitclone/linux-tutorial (newbranch2)
$ git branch
  master
  newbranch
* newbranch2

```



## git branch -d [branch_name]

```shell
# 删除指定分支
RobotINX@DESKTOP-TJ0973O MINGW64 /d/RobotINX/Desktop/git/gitclone/linux-tutorial (newbranch2)
$ git branch -d newbranch
Deleted branch newbranch (was 326ebb2).

RobotINX@DESKTOP-TJ0973O MINGW64 /d/RobotINX/Desktop/git/gitclone/linux-tutorial (newbranch2)
$ git branch
  master
* newbranch2
```



## 删除远程分支

```shell
RobotINX@DESKTOP-TJ0973O MINGW64 /d/RobotINX/Desktop/git/gitclone/linux-tutorial (newbranch2)
$ git push origin --delete origin/master
error: unable to delete 'origin/master': remote ref does not exist
error: failed to push some refs to 'https://github.com/RobotINX/linux-tutorial.git'

RobotINX@DESKTOP-TJ0973O MINGW64 /d/RobotINX/Desktop/git/gitclone/linux-tutorial (newbranch2)
$ git branch -dr origin/master
Deleted remote-tracking branch origin/master (was 326ebb2).

RobotINX@DESKTOP-TJ0973O MINGW64 /d/RobotINX/Desktop/git/gitclone/linux-tutorial (newbranch2)
$ git branch -r
warning: ignoring broken ref refs/remotes/origin/HEAD
  origin/gh-pages
```





# .gitignore

> 有些时候我们不想把某些文件纳入版本控制中，比如数据库文件，临时文件，设计文件等
>
> 可以在主目录下面建立一个`.gitignore`文件，这个文件的有对应的规则

## .gitignore规则

1. 忽略文件中的空行或以`#`开始的行将被忽略
2. 可以使用Linux通配符
   - `*` 代表任意多个字符
   - `?` 代表一个字符
   - `[abc]` 代表可选字符范围
   - `{string1, string2, string3}` 代表可选的字符串
3. 如果名称的最前面有一个感叹号`!` ，表示例外规则，将不会被忽略
4. 如果名称的最前面是一个路径分隔符`/` ，表示要忽略的文件在此目录下，而子目录中的文件不被忽略
5. 如果名称的最后面是一个路径分隔符`/` ，表示要忽略的是此目录下该名称的子目录，而非文件（默认文件或目录都会忽略）

```shell
*.txt                # 忽略所有.txt结尾的文件
!lib.txt             # 但是lib.txt例外，所以lib.txt文件会被纳入到版本控制中
/temp                # 仅忽略项目根目录下的temp文件，不包括其他目录下的temp
build/               # 忽略build/目录下的所有文件
doc/*.txt            # 会忽略  doc/notes.txt，但不包括   doc/server/arch.txt
```



## 示例文件

```shell
# 忽略文件示例
*.class
*.log
*.lock

# Package Files
*.jar
*.war
*.ear
target/

# idea
.idea/
*.iml

*verlocity.log*

### STS ###
.APT_generated
.factorypath
.springBeans

### IntelliJ IDEA ###
*.iml
*.ipr
*.iws
.idea
.classpath
.project
.settings/
bin/

*.log
tmp/

# rebel
*rebel.xml*
```



# 生成SSH密钥

```shell
RobotINX@DESKTOP-TJ0973O MINGW64 ~/.ssh
$ pwd
/c/Users/RobotINX/.ssh

RobotINX@DESKTOP-TJ0973O MINGW64 ~/.ssh
$ ssh-keygen.exe
Generating public/private rsa key pair.
Enter file in which to save the key (/c/Users/RobotINX/.ssh/id_rsa): gitee
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in gitee
Your public key has been saved in gitee.pub
The key fingerprint is:
SHA256:apCH/wPdeQ0nQj7SPEqRh/pGm1U0CHBRV1YhRmVPU5o RobotINX@DESKTOP-TJ0973O
The key's randomart image is:
+---[RSA 3072]----+
|      ..+*.o==+**|
|       .+ +.ooo+o|
|       . B .  E .|
|     o. + O o .  |
|    + .=SB = =   |
|     +..B o . .  |
|      +o   .     |
|     . ..        |
|        ..       |
+----[SHA256]-----+

RobotINX@DESKTOP-TJ0973O MINGW64 ~/.ssh
$ cat gitee.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDLP4KtAQ4onu7De11tsPErVMOUfLizCU0678L16stG/RrjXwDB+advWMnOvl/m9Pjefa8b/8VaLr/oL1ZG36PniZWD73Ho77VGoiF9QTw2Jt9Uy2b9e/NQAayf/R5v79BjfY6aJp0PVIEXO9RR4SHAiBtlzoNKyTB8zfVnnr8Fe3Kr0bTbeWiFD6jwxa+fhU3rdEL8A8lnXO1vTqoZAq48M2ht6FcvYlWhf+3k2VPtl4/FXe8l7e9to2WoAonIR8GdHs5vTv/237idc77rUqBZip65WQ15bXajqOTFUNuejO1UCI2Byj8hK5JBvH4kEsqjPE0OEeF/LiOTvv2OXDtirdKCERfIsmSyfgyAYMoNWU11UDc5wLJ0z5jMsXZuErZPDeiYZBhjwoDmzlAzQBCmysQG6Xe45RRfZShvUztXc/x9jGOeY8CNMqqGvMHtil/3aT/by2RMMgfGGCvAQweNTgBw0GMTqATpEhKEzAxE1Ab68fVm0zNTXdPEBUDQDQM= RobotINX@DESKTOP-TJ0973O
```



# GIT BASH代理设置

## socks代理

```shell
git config --global http.proxy 'socks5://127.0.0.1:1080'
git config --global https.proxy 'socks5://127.0.0.1:1080'
```

## http/https代理

```shell
git config --global http.proxy http://127.0.0.1:8080
git config --global https.proxy https://127.0.0.1:8080
```























