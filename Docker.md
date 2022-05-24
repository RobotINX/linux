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
  >               "Subnet": "172.18.0.0/16",
  >               "Gateway": "172.18.0.1"
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

