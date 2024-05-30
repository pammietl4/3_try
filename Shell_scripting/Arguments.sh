# Arugments passing $1 -- fixed number of Arguments

#!/bin/bash

# VPCID=$(aws ec2 describe-vpcs --region $1 | jq ".Vpcs[].VpcId" -r)

# for VPC in $VPCID; do
#     #echo $VPC                    # without adding any prefix
#     echo "====================================="
#     echo "THIS VPC ID is : $VPC" # with pre-fix
#     echo "====================================="             # print line in b/w ip's
# done

#*********************** $@ / $* you can pass multiple Arguments at a time **************************

# for ITEM in $@; do
#     VPCID=$(aws ec2 describe-vpcs --region $ITEM | jq ".Vpcs[].VpcId" -r)
#     echo "Lets get the VPC ID $ITEM"
#     for VPC in $VPCID; do
#         #echo $VPC                    # without adding any prefix
#         echo "====================================="
#         echo "THIS VPC ID is : $VPC"                 # with pre-fix
#         echo "=====================================" # print line in b/w ip's
#     done
# done

#*************** $# count of Arguments you have passed -- if it is 0 ask system to through error  ********

# for ITEM in $@; do
#     VPCID=$(aws ec2 describe-vpcs --region $ITEM | jq ".Vpcs[].VpcId" -r)
#     #echo "Lets get the VPC ID $ITEM"

#     for VPC in $VPCID; do
#         #echo $VPC                    # without adding any prefix
#         #echo "====================================="
#         #echo $VPC
#         echo "This Argument is from $# : $VPC"
#         #echo "=====================================" # print line in b/w ip's
#     done
#     echo "====================="
#     echo "you have passed $# Arguments"
# done

#********** if you don't pass any Arguments system should through error ******************

#echo "you have passed $# Arguments"
if [ $# -gt 0 ]; then
    for ITEM in $@; do
        VPCID=$(aws ec2 describe-vpcs --region $ITEM | jq ".Vpcs[].VpcId" -r)
        #echo "Lets get the VPC ID $ITEM"

        for VPC in $VPCID; do
            #echo $VPC                    # without adding any prefix
            #echo "====================================="
            #echo $VPC
            echo "This Argument is from $# : $VPC"
            #echo "=====================================" # print line in b/w ip's
        done
        echo "====================="
        echo "you have passed $# Arguments"
    done
else
    echo "you have not passed any Arguments, please provide it EX: us-east-1"
fi
