```
[abc@master ~]$ kubectl describe node worker1
Name:               worker1
Roles:              <none>
Labels:             beta.kubernetes.io/arch=amd64
                    beta.kubernetes.io/os=linux
                    kubernetes.io/arch=amd64
                    kubernetes.io/hostname=worker1
                    kubernetes.io/os=linux
Annotations:        kubeadm.alpha.kubernetes.io/cri-socket: /var/run/dockershim.sock
                    node.alpha.kubernetes.io/ttl: 0
                    projectcalico.org/IPv4Address: 192.168.122.95/24
                    projectcalico.org/IPv4IPIPTunnelAddr: 192.168.235.128
                    volumes.kubernetes.io/controller-managed-attach-detach: true
CreationTimestamp:  Fri, 10 Apr 2020 11:26:16 -0400
Taints:             <none>
Unschedulable:      false
Lease:
  HolderIdentity:  worker1
  AcquireTime:     <unset>
  RenewTime:       Fri, 10 Apr 2020 14:43:57 -0400
Conditions:
  Type                 Status  LastHeartbeatTime                 LastTransitionTime                Reason                       Message
  ----                 ------  -----------------                 ------------------                ------                       -------
  NetworkUnavailable   False   Fri, 10 Apr 2020 11:31:42 -0400   Fri, 10 Apr 2020 11:31:42 -0400   CalicoIsUp                   Calico is running on this node
  MemoryPressure       False   Fri, 10 Apr 2020 14:43:59 -0400   Fri, 10 Apr 2020 11:26:16 -0400   KubeletHasSufficientMemory   kubelet has sufficient memory available
  DiskPressure         False   Fri, 10 Apr 2020 14:43:59 -0400   Fri, 10 Apr 2020 11:26:16 -0400   KubeletHasNoDiskPressure     kubelet has no disk pressure
  PIDPressure          False   Fri, 10 Apr 2020 14:43:59 -0400   Fri, 10 Apr 2020 11:26:16 -0400   KubeletHasSufficientPID      kubelet has sufficient PID available
  Ready                True    Fri, 10 Apr 2020 14:43:59 -0400   Fri, 10 Apr 2020 11:31:06 -0400   KubeletReady                 kubelet is posting ready status
Addresses:
  InternalIP:  192.168.122.95
  Hostname:    worker1
Capacity:
  cpu:                2
  ephemeral-storage:  12786Mi
  hugepages-2Mi:      0
  memory:             1882028Ki
  pods:               110
Allocatable:
  cpu:                2
  ephemeral-storage:  12066383443
  hugepages-2Mi:      0
  memory:             1779628Ki
  pods:               110
System Info:
  Machine ID:                 ede5d17d6a9f49139fd12871bbaf79d5
  System UUID:                EDE5D17D-6A9F-4913-9FD1-2871BBAF79D5
  Boot ID:                    200e620d-6f72-4a04-b310-1c55df466c03
  Kernel Version:             3.10.0-1062.el7.x86_64
  OS Image:                   CentOS Linux 7 (Core)
  Operating System:           linux
  Architecture:               amd64
  Container Runtime Version:  docker://1.13.1
  Kubelet Version:            v1.18.1
  Kube-Proxy Version:         v1.18.1
PodCIDR:                      192.168.2.0/24
PodCIDRs:                     192.168.2.0/24
Non-terminated Pods:          (4 in total)
  Namespace                   Name                                 CPU Requests  CPU Limits  Memory Requests  Memory Limits  AGE
  ---------                   ----                                 ------------  ----------  ---------------  -------------  ---
  default                     hello-kubernetes-84f5754b49-446r6    0 (0%)        0 (0%)      0 (0%)           0 (0%)         85m
  default                     my-nginx-9b596c8c4-999qb             0 (0%)        0 (0%)      0 (0%)           0 (0%)         3h8m
  kube-system                 calico-node-dxf8w                    250m (12%)    0 (0%)      0 (0%)           0 (0%)         3h14m
  kube-system                 kube-proxy-4bpsn                     0 (0%)        0 (0%)      0 (0%)           0 (0%)         3h17m
Allocated resources:
  (Total limits may be over 100 percent, i.e., overcommitted.)
  Resource           Requests    Limits
  --------           --------    ------
  cpu                250m (12%)  0 (0%)
  memory             0 (0%)      0 (0%)
  ephemeral-storage  0 (0%)      0 (0%)
  hugepages-2Mi      0 (0%)      0 (0%)
Events:              <none>
```
