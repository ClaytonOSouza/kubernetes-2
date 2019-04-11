#!/bin/bash

HOSTS=$(head -n7 /etc/hosts)
echo -e '$HOSTS' > /etc/hosts
echo '192.168.10.10 master.k8s.com' >> /etc/hosts
echo '192.168.10.20 minion1.k8s.com' >> /etc/hosts
echo '192.168.10.30 minion2.k8s.com' >> /etc/hosts
echo '192.168.10.40 minion3.k8s.com' >> /etc/hosts
apt-get update
apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common dirmngr vim telnet curl
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo 'deb https://apt.kubernetes.io/ kubernetes-xenial main' > /etc/apt/sources.list.d/kubernetes.list
echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl 
sed -Ei 's/(.*swap.*)/#\1/g' /etc/fstab
swapoff -a
mkdir -p /root/.ssh
cp /vagrant/files/id_rsa* /root/.ssh
chmod 400 /root/.ssh/id_rsa*
cp /vagrant/files/id_rsa.pub /root/.ssh/authorized_keys
usermod -G docker -a vagrant
