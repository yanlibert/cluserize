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
On the node machine, you should also have Vagrant installed and an account named ubuntu with a ssh key pair set up and root access.

## Use clusterize

clusterize is a set of scripts that will automate the deployment of a basic Kubernetes cluster using hosts accessible via ssh with root privileges.

Although it is tailored for my specific use case, it's possible to adapt those script with minimum efforts.

## Getting started

```sh
git clone https://github.com/yanlibert/clusterize
cd clusterize
./clusterize.sh
```

To make sure that your Vagrant node gets suspended when the host is shut down and up again when the host is up, simply copy the vagrant-boxes script to ```/etc/init.d``` and update the boot and shutdown sequence

```sh
sudo mv ./vagrant-boxes /etc/init.d/.
sudo update-rc.d vagrant-boxes defaults 99 01
```
Number 99 is the sequence number and should be larger than (in my case Virtualbox number 20, which by the way is the default on Debian distros). The second number is the sequence when shutting down the computer. So, it might be good to do first of all.

All the credit to the script vagrant-boxes goes to Olle Gustafsson, please visit his website for more information [https://www.ollegustafsson.com/en/vagrant-suspend-resume/](https://www.ollegustafsson.com/en/vagrant-suspend-resume/)

To remove this service:
sudo update-rc.d -f vagrant-boxes remove