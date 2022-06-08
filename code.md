```shell
kubectl get namespace

kubectl get namespace default

kubectl get namespace default -o wide
kubectl get namespace default -o json
kubectl get namespace default -o yaml

kubectl describe namespace default

kubectl create namespace dev
kubectl delete namespace dev

kubectl create -f ns-dev.yaml
kubectl delete -f ns-dev.yaml

```

```yaml
# ns-dev.yaml
apiVersion: v1
kind: Namespace
metadata:
  name: dev
```



```shell
kubectl get pods -n kube-system

kubectl run nginx --image=nginx:1.17.1 --port=80 --namespace=dev
kubectl get pods -n dev
kubectl describe pod nginx -n dev
kubectl get pods -n dev -o yaml
kubectl delete pods nginx -n dev

kubectl create -f pod-nginx.yaml
kubectl delete -f pod-nginx.yaml
```

```yaml
#pod-nginx.yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  namespace: dev
spec:
  containers:
  - image: nginx:1.17.1
    imagePullPolicy: IfNotPresent
    name: pod
    ports:
    - name: nginx-port
      containerPort: 80
      protocol: TCP
```



```shell
kubectl label pod nginx version="1.0" -n dev
kubectl label pod nginx env="hotfix" -n dev

kubtctl label pod nginx version="2.0" -n dev --overwrite
kubectl label pod nginx env="release" -n dev --overwrite

kubectl get pods -n dev --show-labels
kubectl get pods -l version="1.0" -n dev --show-labels
kubectl get pods -l version="1.0",env="hotfix" -n dev --show-labels

kubctl label pod nginx dev- version- -n dev

kubectl create -f pod-nginx.yaml
kubectl delete -f pod-nginx.yaml
```



```yaml
# kubectl create -f pod-nginx.yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  namespace: dev
  labels:
    version: "3.0"
    env: "test"
spec:
  containers:
  - image: nginx:1.17.1
    imagePullPolicy: IfNotPresent
    name: pod
    ports:
    - name: nginx-port
      containerPort: 80
      protocol: TCP
```



```shell
kubectl create deployment nginx --image=nginx:1.17.1 -n dev
kubectl create deployment nginx --image=nginx:1.17.1 --replicas=5 -n dev

kubectl create -f deploy-nginx.yaml
kubectl delete -f deploy-nginx.yaml

kubectl get pods -n dev
kubectl get deployment -n dev
kubectl describe deployment nginx -n dev
kubectl delete deployment nginx -n dev

```

```yaml
# deploy-nginx.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx
  namespace: dev
spec:
  replicas: 5
  selector:
    matchLabels:
      run: nginx
  template:
    metadata:
      labels:
        run: nginx
    spec:
      containers:
      - image: nginx:1.17.1
        name: nginx
        ports:
        - containerPort: 80
          protocol: TCP
```



```shell
kubectl create deployment nginx --image=nginx:1.17.1 -n dev
kubectl scale deployment nginx --replicas=5 -n dev
kubectl expose deployment nginx --name=svc-nginx --type=ClusterIP --port=80 --target-port=80 -n dev

kubelet get service -n dev -o wide

kubectl delete service svc-nginx -n dev

kubectl create -f service svc-nginx.yaml
kubectl delete -f service svc-nginx.yaml
```



```yaml
apiVersion: v1
kind: Service
metadata:
  name: svc_nginx
  namespace: dev
spec:
  clusterIP: 10.109.179.231
  ports:
  - port: 80
    protocol: TCP
    targetPort: 80
  selector:
   run: nginx
 type: ClusterIP
```











