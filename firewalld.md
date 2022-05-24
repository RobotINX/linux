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

