# clusterize
Turns a pool of machines with ssh access into a full-fledge Kubernetes cluster

## Why use clusterize?

clusterize is a side-project initiated during my DevOps training. I had several machines with ssh and root access at my disposal and I wanted to create a Kubernetes cluster using as much automation as possible.

My idea was: Terraform K8s nodes using the vagrant provider with ansible provisioned to make sure that kubeadm is running.

## Requirements

On your master machine, make sure you have Terraform and Ansible installed. On Ubuntu 16.04 Xenial, type

```sh
wget https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip
unzip terraform_0.11.7_linux_amd64.zip
sudo mv terraform /usr/bin
```
> Note: this version of clusterize was developped and tested with Terraform 0.11.7

To install Ansible:
```sh
sudo apt-get update
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible
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