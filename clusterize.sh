#!/bin/bash
#
# Initializes some scripts to Terraform
# provisioned K8s cluster nodes using a
# list of available hosts with their ip
# addresses on the local network.
#
# Checking for compatible shell version
#
SHELL_VERSION=$(bash --version | grep version | head -1 | awk '{print $4}' | cut -d\. -f1)
#
if [ $SHELL_VERSION -lt 4 ]
then
    echo "bash version is $SHELL_VERSION"
    echo "clusterize is compatible with version 4 and greater"
    exit 1
fi
#
# The ip of the nodes should be collected
# in a file named ip_list.txt
#
if [ ! -f "ip_list.txt" ]
then
    echo "Sorry, I can't find the list of available hosts."
    echo "please, create a list of IP named ip_list.txt to initiate deployment"
    exit 1
fi
#
ip_list=$(cat ip_list.txt)
#
# Associate a hostame with the ip
# and storing it in an associative array
#
i=1
declare -A host_names
#
touch /tmp/ip_host.txt
if [ ! -f "/tmp/ip_host.txt" ]
then
    touch /tmp/ip_host.txt
else
    rm -f /tmp/ip_host.txt
    touch /tmp/ip_host.txt
fi
#
for ip in $ip_list
do
    hostname="$(head -$i ./dic/SA_animals.dic | tail -1)"
    host_names[$ip]=$hostname
    echo "$ip => $hostname" >> /tmp/ip_host.txt
    i=$((i+1))
done
#
# Starting from scratch
#
if [ -d "./hosts" ]
then
    rm -f hosts/*
else
    mkdir hosts
fi
#
for ip in "${!host_names[@]}"
do
    mkdir ./hosts/"${host_names[$ip]}"
done
