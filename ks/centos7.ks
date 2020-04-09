lang en_US
text
keyboard us
timezone America/New_York --isUtc
# Reboot after installation
reboot
#Root password
rootpw "passw0rd"
url --url=http://mirrors.mit.edu/centos/7/os/x86_64/
repo --name=epel --baseurl=http://download.fedoraproject.org/pub/epel/7/x86_64/
bootloader --location=mbr --append="rhgb quiet crashkernel=auto"
services --disabled=NetworkManager --enabled=network 
network --bootproto=dhcp --onboot=on --noipv6 

autopart --type=lvm
zerombr
# Partition clearing information
clearpart --drives=vda --all
selinux --disabled
firewall --disabled
firstboot --disable
user --name=abc --password=passw0rd
%packages
@base
%end

%post  --log=/var/log/my-post-log
echo "################################"
echo "# Running Post Configuration   #"
echo "################################"
yum -y install epel-release
mkdir -p { /root/.ssh /home/abc/.ssh }

cat <<EOF >> /root/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDLDMi1Hr5oC41oDtau077nnH4Ie5cQD0PGqhdadUihNlXFbKPApZoLgfq/34vYniTYnZuk7J5bEW/RIKoS1jkh1Xe4mLY8vWy1cyKrO27ZZsIsdI14rRrLGXXOocLC3TOnFZQADjbhBy8bGbgYAJjV0i4TApcIzO47wPL7JzwqcFMvgrT+BlmSH2heOYauFrLpt0YY341X32ThI14N0UBYZ2Ssb7xokxqMq3dG9LWAuy6z7ZB6WrUG3QDIEgC+UrcOUmc6d5q0J7aZO/jrZPaNBWnkZWGsKOBrcuqyPq0VNZhrn2xOTYfCX5ywLbFmAw+NCaC45gqe8MvaCg9f++7 abc@master
EOF


cp /root/.ssh/authorized_keys /home/abc/.ssh/authorized_keys
chown -R abc:abc /home/abc

chmod 0440 /root/.ssh/authorized_keys 
chmod 0440 /home/abc/.ssh/authorized_keys

cat <<EOF >> /etc/sudoers.d/abc
abc ALL=(ALL) NOPASSWD:ALL
EOF

%end
