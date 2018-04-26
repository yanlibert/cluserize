#!/bin/bash
#
# Initializes some scripts to Terraform
# provisioned K8s cluster nodes using a
# list of available hosts with their ip
# addresses on the local network.
# 
# The ip of the nodes should be collected
# in a file named ip_list.txt
#
#
if [ ! -f "ip_list.txt" ]
then
    echo "Sorry, I can't find the list of available hosts."
    echo "please, create a list of IP named ip_list.txt to initiate deployment"
    exit 1
fi
#
list=$(cat ip_list.txt)
#
# Associate a hostame with the ip
#
i=1
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
for machine in $list
do
    hostname="$(head -$i ./dic/SA_animals.dic | tail -1)"
    echo "$machine => $hostname" >> /tmp/ip_host.txt
    i=$((i+1))
done
#
