### Nodes
* Describe Node 
  kubectl describe node <insert-node-name-here> [stdout](https://github.com/ac427/libvirt-k8s/tree/master/examples/stdout/node_details.md)
  (documentation)[https://kubernetes.io/docs/concepts/architecture/nodes/]

* Schedule Maintanance

  #### Drain a node

  ```
  kubectl drain $NODENAME

  ```
  For pods with no replica set, you need to bring up a new copy of the pod, and assuming it is not part of a service, redirect clients to it.
  
  > Note: By default kubectl drain will ignore certain system pods on the node that cannot be killed; see the kubectl drain   documentation for more details.
  
  There is also 
  ```
  kubectl cordon $NODENAME
  ` ``
  I am still not sure if there is any difference between drain vs cordon  

  #### Make the node schedulable again:

  ```
  kubectl uncordon $NODENAME

  ```
  (documentation)[https://kubernetes.io/docs/tasks/administer-cluster/cluster-management/]
