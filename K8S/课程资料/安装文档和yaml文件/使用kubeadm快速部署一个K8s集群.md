
kubeadm是官方社区推出的一个用于快速部署kubernetes集群的工具。

这个工具能通过两条指令完成一个kubernetes集群的部署：

```
# 创建一个 Master 节点
$ kubeadm init

# 将一个 Node 节点加入到当前集群中
$ kubeadm join <Master节点的IP和端口 >
```

## 1. 安装要求

在开始之前，部署Kubernetes集群机器需要满足以下几个条件：

- 一台或多台机器，操作系统 CentOS7.x-86_x64
- 硬件配置：2GB或更多RAM，2个CPU或更多CPU，硬盘30GB或更多
- 可以访问外网，需要拉取镜像，如果服务器不能上网，需要提前下载镜像并导入节点
- 禁止swap分区

## 2. 准备环境

| 角色   | IP           |
| ------ | ------------ |
| master | 192.168.1.11 |
| node1  | 192.168.1.12 |
| node2  | 192.168.1.13 |

```
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

# 将桥接的IPv4流量传递到iptables的链
cat > /etc/sysctl.d/k8s.conf << EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system  # 生效

# 时间同步
yum install ntpdate -y
ntpdate time.windows.com
```

## 3. 所有节点安装Docker/kubeadm/kubelet

Kubernetes默认CRI（容器运行时）为Docker，因此先安装Docker。

### 3.1 安装Docker

```
$ wget https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo -O /etc/yum.repos.d/docker-ce.repo
$ yum -y install docker-ce-18.06.1.ce-3.el7
$ systemctl enable docker && systemctl start docker
$ docker --version
Docker version 18.06.1-ce, build e68fc7a
```

```
$ cat > /etc/docker/daemon.json << EOF
{
  "registry-mirrors": ["https://b9pmyelo.mirror.aliyuncs.com"]
}
EOF
```

### 3.2 添加阿里云YUM软件源

```
$ cat > /etc/yum.repos.d/kubernetes.repo << EOF
[kubernetes]
name=Kubernetes
baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=0
repo_gpgcheck=0
gpgkey=https://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg https://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
EOF
```

### 3.3 安装kubeadm，kubelet和kubectl

由于版本更新频繁，这里指定版本号部署：

```
$ yum install -y kubelet-1.18.0 kubeadm-1.18.0 kubectl-1.18.0
$ systemctl enable kubelet
```

## 4. 部署Kubernetes Master

在192.168.31.61（Master）执行。

```
$ kubeadm init \
  --apiserver-advertise-address=192.168.44.146 \
  --image-repository registry.aliyuncs.com/google_containers \
  --kubernetes-version v1.18.0 \
  --service-cidr=10.96.0.0/12 \
  --pod-network-cidr=10.244.0.0/16
```

由于默认拉取镜像地址k8s.gcr.io国内无法访问，这里指定阿里云镜像仓库地址。

使用kubectl工具：

```bash
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
$ kubectl get nodes
```

## 5. 加入Kubernetes Node

在192.168.1.12/13（Node）执行。

向集群添加新节点，执行在kubeadm init输出的kubeadm join命令：

```
$ kubeadm join 192.168.1.11:6443 --token esce21.q6hetwm8si29qxwn \
    --discovery-token-ca-cert-hash sha256:00603a05805807501d7181c3d60b478788408cfe6cedefedb1f97569708be9c5
```

默认token有效期为24小时，当过期之后，该token就不可用了。这时就需要重新创建token，操作如下：

```
kubeadm token create --print-join-command
```

## 6. 部署CNI网络插件

```
wget https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
```

默认镜像地址无法访问，sed命令修改为docker hub镜像仓库。

```
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

kubectl get pods -n kube-system
NAME                          READY   STATUS    RESTARTS   AGE
kube-flannel-ds-amd64-2pc95   1/1     Running   0          72s
```

## 7. 测试kubernetes集群

在Kubernetes集群中创建一个pod，验证是否正常运行：

```
$ kubectl create deployment nginx --image=nginx
$ kubectl expose deployment nginx --port=80 --type=NodePort
$ kubectl get pod,svc
```

访问地址：http://NodeIP:Port  



# 8.coreDNS报错ContainerCreating

使用`kubectl get pods -n kube-system`检查各pod的状态发现coredns有ContainerCreating的提示

```shell
[root@master .kube]# kubectl get pods -n kube-system
NAME                             READY   STATUS              RESTARTS   AGE
coredns-7ff77c879f-m6dr8         0/1     ContainerCreating   0          48s
coredns-7ff77c879f-mdcf4         0/1     ContainerCreating   0          48s
etcd-master                      1/1     Running             0          60s
kube-apiserver-master            1/1     Running             0          60s
kube-controller-manager-master   1/1     Running             0          60s
kube-proxy-dq2g2                 1/1     Running             0          48s
kube-scheduler-master            1/1     Running             0          60s
```

```shell
[root@master flannel]# kubectl describe pods coredns-7ff77c879f-m6dr8 -n kube-system
  Warning  FailedCreatePodSandBox  5m46s (x4 over 5m49s)  kubelet, master    (combined from similar events): Failed to create pod sandbox: rpc error: code = Unknown desc = failed to set up sandbox container "40739d05d9db3b0ed23c395f78b1bb5a7ec5bc1d6c60fa762ff3b1f2aa56ac5a" network for pod "coredns-7ff77c879f-m6dr8": networkPlugin cni failed to set up pod "coredns-7ff77c879f-m6dr8_kube-system" network: open /run/flannel/subnet.env: no such file or directory
  Normal   SandboxChanged          57s (x289 over 5m57s)  kubelet, master    Pod sandbox changed, it will be killed and re-created.
```

根据日志发现是因为缺少了一个`/run/flannel/subnet.env`文件

百度之后发现这个文件的内容大致如下

```shell
FLANNEL_NETWORK=10.244.0.0/16
FLANNEL_SUBNET=10.244.0.1/24
FLANNEL_MTU=1450
FLANNEL_IPMASQ=true
```

重新启动kubelet服务

```shell
systemctl restart kubelet
```

再次查看相关的节点状态发现已经回复正常

```shell
[root@master flannel]# kubectl get pods -n kube-system
NAME                             READY   STATUS    RESTARTS   AGE
coredns-7ff77c879f-m6dr8         1/1     Running   0          10m
coredns-7ff77c879f-mdcf4         1/1     Running   0          10m
etcd-master                      1/1     Running   0          10m
kube-apiserver-master            1/1     Running   0          10m
kube-controller-manager-master   1/1     Running   0          10m
kube-proxy-dq2g2                 1/1     Running   0          10m
kube-scheduler-master            1/1     Running   0          10m
```



# 9.flannel提示protocol not available

```shell
[root@master flannel]# kubectl get pods -n kube-system
NAME                             READY   STATUS    RESTARTS   AGE
coredns-7ff77c879f-m6dr8         1/1     Running   0          13m
coredns-7ff77c879f-mdcf4         1/1     Running   0          13m
etcd-master                      1/1     Running   0          13m
kube-apiserver-master            1/1     Running   0          13m
kube-controller-manager-master   1/1     Running   0          13m
kube-flannel-ds-qrhmx            0/1     Error     2          24s
kube-proxy-dq2g2                 1/1     Running   0          13m
kube-scheduler-master            1/1     Running   0          13m
```

通过`kubectl logs -f kube-flannel-ds-qrhmx -n kube-system`发现发错

```shell
[root@master flannel]# kubectl logs -f kube-flannel-ds-qrhmx -n kube-system
I0529 14:46:13.008480       1 main.go:207] CLI flags config: {etcdEndpoints:http://127.0.0.1:4001,http://127.0.0.1:2379 etcdPrefix:/coreos.com/network etcdKeyfile: etcdCertfile: etcdCAFile: etcdUsername: etcdPassword: version:false kubeSubnetMgr:true kubeApiUrl: kubeAnnotationPrefix:flannel.alpha.coreos.com kubeConfigFile: iface:[] ifaceRegex:[] ipMasq:true ifaceCanReach: subnetFile:/run/flannel/subnet.env publicIP: publicIPv6: subnetLeaseRenewMargin:60 healthzIP:0.0.0.0 healthzPort:0 iptablesResyncSeconds:5 iptablesForwardRules:true netConfPath:/etc/kube-flannel/net-conf.json setNodeNetworkUnavailable:true}
W0529 14:46:13.008577       1 client_config.go:614] Neither --kubeconfig nor --master was specified.  Using the inClusterConfig.  This might not work.
I0529 14:46:13.107440       1 kube.go:121] Waiting 10m0s for node controller to sync
I0529 14:46:13.107513       1 kube.go:398] Starting kube subnet manager
I0529 14:46:14.108338       1 kube.go:128] Node controller sync successful
I0529 14:46:14.108353       1 main.go:227] Created subnet manager: Kubernetes Subnet Manager - master
I0529 14:46:14.108357       1 main.go:230] Installing signal handlers
I0529 14:46:14.108430       1 main.go:463] Found network config - Backend type: vxlan
I0529 14:46:14.108457       1 match.go:195] Determining IP address of default interface
E0529 14:46:14.108516       1 main.go:270] Failed to find any valid interface to use: failed to get default interface: protocol not available
```



