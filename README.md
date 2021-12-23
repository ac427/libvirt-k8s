# libvirt-k8s

Setup k8s cluster on your Linux Machine and use kvms

abc is my user id. you may have to update abc with whatever your id is. 

### ansible to setup laptop for libvirtd to install vms

``` 
[abc@foo ansible]$ ansible-playbook -i hosts -b  -k  local.yml
SSH password: 

PLAY [add repo] ***************************************************************************************************************************************************************************************************

TASK [Gathering Facts] ********************************************************************************************************************************************************************************************
ok: [localhost]

TASK [local : install RPM packages] *******************************************************************************************************************************************************************************
ok: [localhost]

TASK [local : copy] ***********************************************************************************************************************************************************************************************
ok: [localhost]

TASK [local : enable and start libvirtd] **************************************************************************************************************************************************************************
ok: [localhost]

TASK [local : create bridge network k8s] **************************************************************************************************************************************************************************
ok: [localhost]

TASK [local : start net-start k8s] ********************************************************************************************************************************************************************************
skipping: [localhost]

PLAY RECAP ********************************************************************************************************************************************************************************************************
localhost                  : ok=5    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   

```

### setting ups vm scripts

./master.sh
./worker1.sh etc

i am using 3 workers, if you want to add more then make sure to update the network.xml file in local role

make sure to store the secrets in ansible vault 
to get the secerts to join worker to cluster 

### setup k8s master
First setup the master node. Then get the secrets and update ansible vault ( check group_vars dir). Also, power off the worker nodes before setting up the master

to get discovery_token_ca_cert_hash run below on master node and store it in ansible valut 

```

[abc@master ~]$  echo -n sha256:;openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | sed 's/^.* //'

```

to get k8s_token run below and store it in ansible vault. you need master node provisoned first before you join workers

```

[abc@master ~]$ kubeadm  token list | grep bootstrap | awk '{print $1}'

```
sample file from `ansible-vault edit group_vars/all/vault.yml`

![Screenshot from 2021-12-23 14-52-53](https://user-images.githubusercontent.com/11317624/147286182-d8b2bdb7-2ccd-43ee-936b-1465b63fe7d2.png)


```

[abc@foo ansible]$ ansible-playbook -i hosts --ask-vault-pass -b  -k k8s.yml 

```

```
#you can get the same in join command
kubeadm token create --print-join-command

```

### setup workers
power on the worker vms and run ansible again

```

[abc@foo ansible]$ ansible-playbook -i hosts --ask-vault-pass -b  -k k8s.yml 

```

```

[abc@master ~]$ kubectl get nodes
NAME      STATUS   ROLES    AGE     VERSION
master    Ready    master   15m     v1.18.1
worker1   Ready    <none>   3m35s   v1.18.1
worker2   Ready    <none>   3m35s   v1.18.1
worker3   Ready    <none>   3m35s   v1.18.1

```

I will update [hand-on-examples](https://github.com/ac427/libvirt-k8s/tree/master/examples/) as I learn new stuff
