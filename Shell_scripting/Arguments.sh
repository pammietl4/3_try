# Arugments passing $1 -- fixed number of Arguments

!/bin/bash

# VPCID=$(aws ec2 describe-vpcs --region $1 | jq ".Vpcs[].VpcId" -r)

# for VPC in $VPCID; do
#     #echo $VPC                    # without adding any prefix
#     echo "====================================="
#     echo "THIS VPC ID is : $VPC" # with pre-fix
#     echo "====================================="             # print line in b/w ip's
# done

#*********************** $@ / $* you can pass multiple Arguments at a time **************************

for ITEM in $@; do
    VPCID=$(aws ec2 describe-vpcs --region $ITEM | jq ".Vpcs[].VpcId" -r)
    echo "Lets get the VPC ID $ITEM"
    for VPC in $VPCID; do
        #echo $VPC                    # without adding any prefix
        echo "====================================="
        echo "THIS VPC ID is : $VPC"                 # with pre-fix
        echo "=====================================" # print line in b/w ip's
    done
done
