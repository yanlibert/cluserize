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
