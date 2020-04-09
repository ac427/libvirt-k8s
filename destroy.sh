#!/bin/bash

virsh destroy master 
virsh undefine master
virsh destroy worker1 
virsh undefine worker1
virsh destroy worker2
virsh undefine worker2
virsh destroy worker3
virsh undefine worker3
