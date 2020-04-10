
### create deployment

# example 1
```
[abc@master ~]$ kubectl create deployment --image nginx my-nginx
deployment.apps/my-nginx created
```

### expose port 

```
[abc@master ~]$ kubectl expose deployment my-nginx --port=80 --type=LoadBalancer
service/my-nginx exposed

```

### check service status

```
[abc@master ~]$ kubectl get services
NAME         TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
kubernetes   ClusterIP      10.96.0.1       <none>        443/TCP        11m
my-nginx     LoadBalancer   10.105.26.206   <pending>     80:30606/TCP   6s
```

### test with simple curl

```
[abc@master ~]$ curl localhost:30606
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
```

### scale deployment

```
[abc@master ~]$ kubectl scale deployment --replicas 2 my-nginx
deployment.apps/my-nginx scaled

```

### check pod status

```
[abc@master ~]$ kubectl get pods --all-namespaces
NAMESPACE     NAME                                       READY   STATUS    RESTARTS   AGE
default       my-nginx-9b596c8c4-59hxd                   1/1     Running   0          20s
default       my-nginx-9b596c8c4-999qb                   1/1     Running   0          7m44s
kube-system   calico-kube-controllers-5fc5dbfc47-p2927   1/1     Running   0          13m
kube-system   calico-node-dxf8w                          1/1     Running   0          13m
kube-system   calico-node-ptqvc                          1/1     Running   0          13m
kube-system   calico-node-wqtng                          1/1     Running   0          13m
kube-system   calico-node-zk6td                          1/1     Running   0          13m
kube-system   coredns-66bff467f8-bk4r5                   1/1     Running   0          18m
kube-system   coredns-66bff467f8-jck67                   0/1     Running   0          18m
kube-system   etcd-master                                1/1     Running   0          19m
kube-system   kube-apiserver-master                      1/1     Running   0          19m
kube-system   kube-controller-manager-master             1/1     Running   0          19m
kube-system   kube-proxy-4bpsn                           1/1     Running   0          17m
kube-system   kube-proxy-mnl9m                           1/1     Running   0          18m
kube-system   kube-proxy-p2j7p                           1/1     Running   0          17m
kube-system   kube-proxy-xwn4f                           1/1     Running   0          17m
kube-system   kube-scheduler-master                      1/1     Running   0          19m
```

### get detail description of pods

```
[abc@master ~]$ kubectl describe  pods
Name:         my-nginx-9b596c8c4-59hxd
Namespace:    default
Priority:     0
Node:         worker3/192.168.122.97
Start Time:   Fri, 10 Apr 2020 11:43:27 -0400
Labels:       app=my-nginx
              pod-template-hash=9b596c8c4
Annotations:  cni.projectcalico.org/podIP: 192.168.182.1/32
Status:       Running
IP:           192.168.182.1
IPs:
  IP:           192.168.182.1
Controlled By:  ReplicaSet/my-nginx-9b596c8c4
Containers:
  nginx:
    Container ID:   docker://a1ef06584ac69f17887e22fb44f0e95bf4d519cbd0bca63a31d61dd811e4520b
    Image:          nginx
    Image ID:       docker-pullable://docker.io/nginx@sha256:282530fcb7cd19f3848c7b611043f82ae4be3781cb00105a1d593d7e6286b596
    Port:           <none>
    Host Port:      <none>
    State:          Running
      Started:      Fri, 10 Apr 2020 11:43:45 -0400
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from default-token-s8mdr (ro)
Conditions:
  Type              Status
  Initialized       True 
  Ready             True 
  ContainersReady   True 
  PodScheduled      True 
Volumes:
  default-token-s8mdr:
    Type:        Secret (a volume populated by a Secret)
    SecretName:  default-token-s8mdr
    Optional:    false
QoS Class:       BestEffort
Node-Selectors:  <none>
Tolerations:     node.kubernetes.io/not-ready:NoExecute for 300s
                 node.kubernetes.io/unreachable:NoExecute for 300s
Events:
  Type    Reason     Age    From               Message
  ----    ------     ----   ----               -------
  Normal  Scheduled  2m16s  default-scheduler  Successfully assigned default/my-nginx-9b596c8c4-59hxd to worker3
  Normal  Pulling    2m16s  kubelet, worker3   Pulling image "nginx"
  Normal  Pulled     118s   kubelet, worker3   Successfully pulled image "nginx"
  Normal  Created    118s   kubelet, worker3   Created container nginx
  Normal  Started    118s   kubelet, worker3   Started container nginx


Name:         my-nginx-9b596c8c4-999qb
Namespace:    default
Priority:     0
Node:         worker1/192.168.122.95
Start Time:   Fri, 10 Apr 2020 11:36:03 -0400
Labels:       app=my-nginx
              pod-template-hash=9b596c8c4
Annotations:  cni.projectcalico.org/podIP: 192.168.235.129/32
Status:       Running
IP:           192.168.235.129
IPs:
  IP:           192.168.235.129
Controlled By:  ReplicaSet/my-nginx-9b596c8c4
Containers:
  nginx:
    Container ID:   docker://638d57828460c8023917c5baee52302cf04ed01ca0755221486ceab32e309f15
    Image:          nginx
    Image ID:       docker-pullable://docker.io/nginx@sha256:282530fcb7cd19f3848c7b611043f82ae4be3781cb00105a1d593d7e6286b596
    Port:           <none>
    Host Port:      <none>
    State:          Running
      Started:      Fri, 10 Apr 2020 11:36:13 -0400
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from default-token-s8mdr (ro)
Conditions:
  Type              Status
  Initialized       True 
  Ready             True 
  ContainersReady   True 
  PodScheduled      True 
Volumes:
  default-token-s8mdr:
    Type:        Secret (a volume populated by a Secret)
    SecretName:  default-token-s8mdr
    Optional:    false
QoS Class:       BestEffort
Node-Selectors:  <none>
Tolerations:     node.kubernetes.io/not-ready:NoExecute for 300s
                 node.kubernetes.io/unreachable:NoExecute for 300s
Events:
  Type    Reason     Age    From               Message
  ----    ------     ----   ----               -------
  Normal  Scheduled  9m40s  default-scheduler  Successfully assigned default/my-nginx-9b596c8c4-999qb to worker1
  Normal  Pulling    9m40s  kubelet, worker1   Pulling image "nginx"
  Normal  Pulled     9m30s  kubelet, worker1   Successfully pulled image "nginx"
  Normal  Created    9m30s  kubelet, worker1   Created container nginx
  Normal  Started    9m30s  kubelet, worker1   Started container nginx
```

# Example 2

```
[abc@master ~]$  kubectl apply -f https://raw.githubusercontent.com/ac427/bottle/master/hello-kubernetes.yaml
service/hello-kubernetes created
```

```
[abc@master ~]$ kubectl get service hello-kubernetes
NAME               TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
hello-kubernetes   LoadBalancer   10.106.57.31   <pending>     5000:31246/TCP   9s

```

### simple hello world bottle app. check [repo](https://github.com/ac427/bottle.git)
```
[abc@master ~]$ curl localhost:31246/hello
Hello World![abc@master ~]$ 

```

### I made an update to my [repo](https://github.com/ac427/bottle.git) to print the hostname with Hello World. 
The default policy looks like it always pulls the latest image

```
[abc@master ~]$ kubectl get pods
NAME                                READY   STATUS    RESTARTS   AGE
hello-kubernetes-84f5754b49-446r6   1/1     Running   0          9m2s
hello-kubernetes-84f5754b49-868sm   1/1     Running   0          9m4s
hello-kubernetes-84f5754b49-f8ww4   1/1     Running   0          8m56s
my-nginx-9b596c8c4-59hxd            1/1     Running   0          104m
my-nginx-9b596c8c4-999qb            1/1     Running   0          111m
[abc@master ~]$ kubectl get pod hello-kubernetes-84f5754b49-446r6 -o yaml   | grep Always
    imagePullPolicy: Always
  restartPolicy: Always
````

### After few minutes

```

[abc@master ~]$ !curl
curl localhost:31246/hello
Hello World! from hello-kubernetes-84f5754b49-f8ww4[abc@master ~]$ curl localhost:31246/hello
Hello World! from hello-kubernetes-84f5754b49-446r6[abc@master ~]$ curl localhost:31246/hello
Hello World! from hello-kubernetes-84f5754b49-f8ww4[abc@master ~]$ curl localhost:31246/hello
Hello World! from hello-kubernetes-84f5754b49-f8ww4[abc@master ~]$ curl localhost:31246/hello
Hello World! from hello-kubernetes-84f5754b49-f8ww4[abc@master ~]$ curl localhost:31246/hello
Hello World! from hello-kubernetes-84f5754b49-f8ww4[abc@master ~]$ curl localhost:31246/hello
Hello World! from hello-kubernetes-84f5754b49-f8ww4[abc@master ~]$ curl localhost:31246/hello
Hello World! from hello-kubernetes-84f5754b49-f8ww4[abc@master ~]$ curl localhost:31246/hello
Hello World! from hello-kubernetes-84f5754b49-f8ww4[abc@master ~]$ curl localhost:31246/hello
Hello World! from hello-kubernetes-84f5754b49-f8ww4[abc@master ~]$ curl localhost:31246/hello
Hello World! from hello-kubernetes-84f5754b49-868sm[abc@master ~]$ curl localhost:31246/hello
Hello World! from hello-kubernetes-84f5754b49-446r6[abc@master ~]$ 

```

### Image pull in logs
```
[abc@master ~]$ kubectl get events | grep Pulling
25m         Normal    Pulling             pod/hello-kubernetes-5b59d664dd-547xb    Pulling image "anantac/hello-world:latest"
25m         Normal    Pulling             pod/hello-kubernetes-5b59d664dd-56mgv    Pulling image "anantac/hello-world:latest"
25m         Normal    Pulling             pod/hello-kubernetes-5b59d664dd-8vmml    Pulling image "anantac/hello-world:latest"
11m         Normal    Pulling             pod/hello-kubernetes-84f5754b49-446r6    Pulling image "anantac/hello-world:latest"
11m         Normal    Pulling             pod/hello-kubernetes-84f5754b49-868sm    Pulling image "anantac/hello-world:latest"
11m         Normal    Pulling             pod/hello-kubernetes-84f5754b49-f8ww4    Pulling image "anantac/hello-world:latest"
12m         Normal    Pulling             pod/hello-kubernetes-fcd469cb9-5x2pj     Pulling image "anantac/hello-world:latest"
11m         Normal    Pulling             pod/hello-kubernetes-fcd469cb9-ck5qq     Pulling image "anantac/hello-world:latest"
12m         Normal    Pulling             pod/hello-kubernetes-fcd469cb9-ssv7m     Pulling image "anantac/hello-world:latest"
```
