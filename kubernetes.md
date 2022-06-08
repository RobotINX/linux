# kubernetes介绍

## kubernetes组件

一个kubernetes集群主要是由**控制节点（master）**、**工作节点（node）**构成，每个节点上都会安装不同的组件。

**master：集群的控制平面，负责集群的决策和管理**

> APIserver：资源操作的唯一入口，接受用户输入的命令，提供认证、授权、API注册和发现等机制
>
> Scheduler：负责集群资源调度，按照预定的调度策略，将POD调度到相应的node节点上
>
> Controler-Manager：负责维护集群的状态，比如程序部署安排、故障检测、自动扩展、滚动更新等
>
> Etcd：负责存储集群中各种资源对象的信息

**node：集群的数据平面，负责为容器提供运行环境**

> Kubelet：负责维护容器的生命周期，即通过控制docker，来创建、更新、销毁容器
>
> KuberProxy：负责提供集群内部的服务发现和负载均衡
>
> Docker：负责节点上容器的各种操作



## kubernetes组件调用关系

下面，以部署一个nginx服务来说明kubernetes系统各个组件的调用关系

1、首先要明确，一旦kubernetes环境启动之后，master和node都会将自身的信息存储到etcd数据库中

2、一个nginx服务的安装请求会首先被发送到master节点的apiserver组件

3、apiserver组件会调用scheduler组件来决定到底应该把这个服务安装到哪个node节点上

​	  在此时，它会从etcd中读取各个node节点信息，然后按照一定的算法进行选择，并将结果返回apiserver

4、apiserver调用controler-manager去调度node节点安装nginx服务

5、kubelet接收到指令后，会通知docker，然后由docker来启动一个nginx的pod

​	  pod是kubernetes的最小操作单元，容器必须泡在pod中

6、由此，一个nginx服务就运行了，如果需要访问nginx，还需要通过kube-proxy来对pod产生访问的代理

​	  这样，外界用户就可以访问集群中的nginx服务了



## kubernetes概念

**master**：集群的控制节点，每个集群需要至少一个master节点负责集群的管控

**node**：工作负载节点，由master分配容器到这些node工作节点上，然后node节点上的docker负责容器的运行

**pod**：kubernetes的最小控制单元，容器都是运行在pod中的，一个pod中可以有一个或者多个容器

**controler**：控制器，通过它来实现对pod的管理，比如启动pod、停止pod、伸缩pod的数量等等

**service**：pod对外服务的统一入口，虾米那可以维护着同一类的多个pod

**label**：标签，用于对pod的进行分类管理，同一类的pod会拥有相同的标签

**namespace**：命名空间，用来隔离pod的运行环境



# kubernetes集群环境搭建

## 更新内核

- 查看当前系统的版本

  ```shell
  cat /etc/redhat-release
  ```

- 查看当前系统的内核

  ```shell
  uname -sr
  ```

- 在CentOS 7.x 上启用ELRepo仓库

  ```shell
  rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
  rpm -Uvh https://www.elrepo.org/elrepo-release-7.0-4.el7.elrepo.noarch.rpm
  ```

- 查看可用的系统内核相关包

  ```shell
  yum --disablerepo="*" --enablerepo="elrepo-kernel" list available
  ```

- 安装最新主线内核版本

  ```shell
  yum -y enablerepo=elrepo-kernel install kernel-ml
  ```

- 设置默认的内核版本

  ```shell
  vim /etc/default/grub
  ```

  ```shell
  GRUB_TIMEOUT=5
  GRUB_DISTRIBUTOR="$(sed 's, release .*$,,g' /etc/system-release)"
  GRUB_DEFAULT=0 # 修改此处，原来是 saved
  GRUB_DISABLE_SUBMENU=true
  GRUB_TERMINAL_OUTPUT="console"
  GRUB_CMDLINE_LINUX="crashkernel=auto rd.lvm.lv=centos/root rd.lvm.lv=centos/swap rhgb quiet"
  GRUB_DISABLE_RECOVERY="true"
  ```

- 重新创建内核配置

  ```shell
  grub2-mkconfig -o /boot/grub2/grub.cfg
  ```

- 重启并查看内核版本即可



## 环境要求

在开始之前，部署Kubernetes集群机器需要满足以下几个条件：

- 一台或多台机器，操作系统 CentOS7.x-86_x64
- 硬件配置：2GB或更多RAM，2个CPU或更多CPU，硬盘30GB或更多
- 可以访问外网，需要拉取镜像，如果服务器不能上网，需要提前下载镜像并导入节点
- 关闭防火墙
- 关闭SELinux
- 修改主机名
- 添加hosts
- 禁止swap分区
- 流量桥接
- IP设置
- 时间同步



| 角色   | IP              |
| ------ | --------------- |
| master | 192.168.100.100 |
| node1  | 192.168.100.101 |
| node2  | 192.168.100.102 |



```shell
# 关闭防火墙
systemctl stop firewalld
systemctl disable firewalld

# 关闭selinux
sed -i 's/enforcing/disabled/' /etc/selinux/config  # 永久
setenforce 0  # 临时

#查看SELinux状态的命令
getenforce
/usr/sbin/sestatus
#临时关闭SELinux
setenforce 0
#SELinux配置文件
/etc/selinux/config
#配置中关闭SELinux
SELINUX=disabled


# 关闭swap
swapoff -a  # 临时
sed -ri 's/.*swap.*/#&/' /etc/fstab    # 永久

# 根据规划设置主机名
hostnamectl set-hostname <hostname>

# 在master添加hosts
cat >> /etc/hosts << EOF
192.168.44.146 k8smaster
192.168.44.145 k8snode1
192.168.44.144 k8snode2
EOF

# 时间同步
yum install ntpdate -y
ntpdate time.windows.com
```



## 流量桥接

- 文件配置

  ```shell
  # 将桥接的IPv4流量传递到iptables的链
  echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
  echo "net.bridge.bridge-nf-call-ip6tables = 1" >> /etc/sysctl.conf
  echo "net.bridge.bridge-nf-call-iptables = 1" >> /etc/sysctl.conf
  echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
  echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
  echo "net.ipv6.conf.lo.disable_ipv6 = 1" >> /etc/sysctl.conf
  echo "net.ipv6.conf.all.forwarding = 1"  >> /etc/sysctl.conf
  sysctl --system  # 生效
  ```

- 加载br_netfilter模块

  ```shell
  modprobe br_netfilter
  ```

- 持久化

  ```shell
  sysctl --system
  sysctl -p
  ```

  

## 开启ipvs

- 安装ipset和ipvsadm

  ```shell
  yum install -y ipset ipvsadm
  ```

- 模块脚本

  ```shell
  cat > /etc/sysconfig/modules/ipvs.modules <<EOF
  #!/bin/bash
  modprobe -- ip_vs
  modprobe -- ip_vs_rr
  modprobe -- ip_vs_wrr
  modprobe -- ip_vs_sh
  modprobe -- nf_conntrack
  EOF
  ```

- 授权并运行脚本

  ```shell
  chmod +x ipvs.modules
  bash ipvs.modules
  ```

- 查看插件

  ```shell
  lsmod | grep -e ip_vs -e nf_conntrack
  ```

  

# 安装kubernetes

## 安装镜像源

- 添加docker的阿里云镜像源

  ```shell
  cd /etc/yum.repo
  wget https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
  ```

- 添加kubernetes的阿里云镜像源

  ```shell
  cat > /etc/yum.repos.d/kubernetes.repo << EOF
  [kubernetes]
  name=Kubernetes
  baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64
  enabled=1
  gpgcheck=0
  repo_gpgcheck=0
  gpgkey=https://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg https://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
  EOF
  ```

- 更新软件包索引

  ```shell
  yum makecache
  ```



## 安装docker并配置

- 查看docker的版本

  ```shell
  yum list docker-ce --showduplicates | sort -r
  ```

- 安装指定版本的docker

  ```shell
  yum -y install docker-ce-3:20.10.8-3.el7.x86_64 docker-ce-cli-3:20.10.8-3.el7.x86_64 containerd.io
  ```

- 启动docker服务
  ```shell
  systemctl start docker
  systemctl enable docker
  ```

- 设置阿里云镜像加速

  ```shell
  mkdir -p /etc/docker
  sudo tee /etc/docker/daemon.json <<-'EOF'
  {
    "exec-opts": ["native.cgroupdriver=systemd"],	
    "registry-mirrors": [
      "https://du3ia00u.mirror.aliyuncs.com",
      "https://hub-mirror.c.163.com",
      "https://mirror.baidubce.com"
    ],
    "live-restore": true,
    "log-driver":"json-file",
    "log-opts": {"max-size":"500m", "max-file":"3"},
    "max-concurrent-downloads": 10,
    "max-concurrent-uploads": 5,
    "storage-driver": "overlay2"
  }
  EOF
  ```

  ```shell
  systemctl daemon-reload
  ```

  ```shell
  systemctl restart docker
  ```



## 安装kubernetes

- 指定版本安装

  ```shell
  yum install -y kubelet-1.21.10 kubeadm-1.21.10 kubectl-1.21.10
  ```

- 修改cgroup driver的设置

  ```shell
  vim /etc/sysconfig/kubelet
  # 修改
  KUBELET_EXTRA_ARGS="--cgroup-driver=systemd"
  KUBE_PROXY_MODE="ipvs"
  ```

- 启动kubelet

  ```shell
  systemctl start kubelet
  systemctl enable kubelet
  ```



## 下载镜像所需文件

- 查看安装所需文件

  ```shell
  kubeadm config images list
  ```

- 下载安装所需文件

  ```shell
  docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/kube-apiserver:v1.21.10
  docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/kube-controller-manager:v1.21.10
  docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/kube-scheduler:v1.21.10
  docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/kube-proxy:v1.21.10
  docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/pause:3.4.1
  docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/etcd:3.4.13-0
  docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/coredns:v1.8.0
  ```

- 给coredns重新打tag

  ```shell
  docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/coredns:v1.8.0 registry.cn-hangzhou.aliyuncs.com/google_containers/coredns/coredns:v1.8.0
  ```

  

## 部署master节点

- 在节点上部署master节点

  ```shell
  # 由于默认拉取镜像地址k8s.gcr.io国内无法访问，这里需要指定阿里云镜像仓库地址
  kubeadm init \
    --apiserver-advertise-address=192.168.100.101 \
    --image-repository=registry.cn-hangzhou.aliyuncs.com/google_containers \
    --kubernetes-version=v1.21.10 \
    --service-cidr=10.96.0.0/16 \
    --pod-network-cidr=10.244.0.0/16
  ```

- 根据提示复制配置

  ```shell
  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config
  ```

- 关于添加node节点的token

```shell
# 生成一个新的token
kubeadm token create --print-join-command
# 生成一个永不过期的token
kubeadm token create --ttl 0 --print-join-command
```



## 部署网络插件

- 部署指令

  ```shell
  kubectl apply -f https://projectcalico.docs.tigera.io/v3.19/manifests/calico.yaml
  ```

- 查看进度

  ```shell
  kubectl get pods -n kube-system
  ```

  

## 查看节点状态

```shell
kubectl get nodes
```



## 设置kube-proxy的ipvs模式

```shell
kubectl edit cm kube-proxy -n kube-system
```

```shell
apiVersion: v1
data:
  config.conf: |-
    apiVersion: kubeproxy.config.k8s.io/v1alpha1
    bindAddress: 0.0.0.0
    bindAddressHardFail: false
    clientConnection:
      acceptContentTypes: ""
      burst: 0
      contentType: ""
      kubeconfig: /var/lib/kube-proxy/kubeconfig.conf
      qps: 0
    clusterCIDR: 10.244.0.0/16
    configSyncPeriod: 0s
    conntrack:
      maxPerCore: null
      min: null
      tcpCloseWaitTimeout: null
      tcpEstablishedTimeout: null
    detectLocalMode: ""
    enableProfiling: false
    healthzBindAddress: ""
    hostnameOverride: ""
    iptables:
      masqueradeAll: false
      masqueradeBit: null
      minSyncPeriod: 0s
      syncPeriod: 0s
    ipvs:
      excludeCIDRs: null
      minSyncPeriod: 0s
      scheduler: ""
      strictARP: false
      syncPeriod: 0s
      tcpFinTimeout: 0s
      tcpTimeout: 0s
      udpTimeout: 0s
    kind: KubeProxyConfiguration
    metricsBindAddress: ""
    mode: ""
    nodePortAddresses: null
      minSyncPeriod: 0s
      syncPeriod: 0s
    ipvs:
      excludeCIDRs: null
      minSyncPeriod: 0s
      scheduler: ""
      strictARP: false
      syncPeriod: 0s
      tcpFinTimeout: 0s
      tcpTimeout: 0s
      udpTimeout: 0s
    kind: KubeProxyConfiguration
    metricsBindAddress: ""
    mode: "ipvs" # 修改此处
...
```

```shell
kubectl delete pod -l k8s-app=kube-proxy -n kube-system
```



## 让node节点也能用kubectl

```shell
# 192.168.65.101 和 192.168.65.102
mkdir -pv ~/.kube
touch ~/.kube/config
```

```shell
# 192.168.65.100
scp /etc/kubernetes/admin.conf root@192.168.65.101:~/.kube/config
```



## 部署nginx

- 部署nginx

  ```shell
  kubectl create deployment nginx --image=nginx:1.14-alpine
  ```

- 暴露端口

  ```shell
  kubectl expose deployment nginx --port=80 --type=NodePort
  ```

- 查看服务状态

  ```shell
  kubectl get pods,svc
  ```

  



