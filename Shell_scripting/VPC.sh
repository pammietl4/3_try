#!/bin/bash

#This script is used to get the list of VPCs from AWS

Cat test.sh |jq ".[].ip" -r # finding the ip's from a file

aws ec2 describe-vpcs |jq ".Vpcs[].VpcId"   # IP's with invited comas
aws ec2 describe-vpcs |jq ".Vpcs[].VpcId" -r  # IP's without invited comas

VPCID=${aws ec2 describe-vpcs |jq ".Vpcs[].VpcId" -r}

