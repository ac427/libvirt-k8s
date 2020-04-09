#!/bin/bash
set -e

NAME='worker1'
DISK="./vms/$NAME"
DISKSIZE=15
CPU=2
MEMORY=2048
MAC='52:54:00:d4:53:9f'

virt-install --name $NAME --mac $MAC --ram $MEMORY --disk path=$DISK.raw,size=$DISKSIZE,format=raw,bus=virtio,cache=none --vcpus $CPU  --noreboot --os-type linux  --os-variant rhel7  --graphics none  --location http://mirrors.mit.edu/centos/7/os/x86_64/  --initrd-inject ./ks/centos7.ks --network network=k8s --extra-args="console=ttyS0 ks=file:/centos7.ks inst.sshd"
