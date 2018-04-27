# clusterize
Turns a pool of machines with ssh access into a full-fledge Kubernetes cluster

## Why use clusterize?

clusterize is a side-project initiated during my DevOps training. I had several machines with ssh and root access at my disposal and I wanted to create a Kubernetes cluster using as much automation as possible.

My idea was: Packer build K8s nodes using the vagrant post-processor to ensure that kubeadm is provisioned in the vm.

## Requirements

On your master machine, make sure you have Vagrant and Packer installed. Installation on Ubuntu 16.04 Xenial goes as follows: 

Packer
```sh
wget https://releases.hashicorp.com/packer/1.2.3/packer_1.2.3_linux_amd64.zip
unzip packer_1.2.3_linux_amd64.zip
sudo mv packer /usr/bin
```

Vagrant
```sh
wget https://releases.hashicorp.com/vagrant/2.0.4/vagrant_2.0.4_x86_64.deb
sudo dpkg -i vagrant_2.0.4_x86_64.deb
```

## Use clusterize

clusterize is a set of scripts that will automate the deployment of a basic Kubernetes cluster using hosts accessible via ssh with root privileges.

Although it is tailored for my specific use case, it's possible to adapt those script with minimum efforts.

## Getting started

```sh
git clone https://github.com/yanlibert/clusterize
cd clusterize
./clusterize.sh
```
To be continued...