#!/bin/bash

# # ******* Arithmetic Operators ********
# + (Addition )       -- 4th priority
# - (substraction)    -- 5th priority (least priority)
# * (multiplication)  -- 1st priority
# / (division)        -- 2nd priority
# % (modules)         -- 3rd priority  == division 2)10(5
#                                                    10
#                                                    --
#                                                     0

# X=$(expr 10 / 5)
# X=$(expr 10 % 2)
# X=$(expr 5 - 3 \* 6 / 2)

# # ********* print Even & Odd Numbers *************************

# Set -x # debugging mode -- it will show the logs
# for I in {2..100}; do
#     if [ $(expr $I % 2) -eq 0 ]; then
#         echo "$I is an Even Number"
#     else
#         echo "$I is an Odd Number"
#     fi
# done

# # ***************** only Even no printing ******************

# Set -x # debugging mode -- it will show the logs
# for I in {2..100}; do
#     if [ $(expr $I % 2) -eq 0 ]; then
#         echo "$I is an Even Number"
#     fi
# done

# **************** only odd no printing ******************

# Set -x # debugging mode -- it will show the logs
# for I in {2..100}; do
#     if [ $(expr $I % 2) -ne 0 ]; then
#         echo "$I is an Odd Number"
#     fi
# done

# #************ while executing the script we need to provide the number then it will display it is Even / odd *********

# NUM=$1
# if [[ $(expr $NUM % 2) -ne 0 ]]; then
#     echo "$NUM is an Odd Number"
# else
#     echo "$NUM is an Even Number"
#     echo "you have not passed any Arguments, please provide it EX: 22"
# fi

# #*********  while executing the script if you don't pass any Arguments it should throuhs error ************

# if [ $# -ne 1 ]; then
#     echo "you have not passed any Arguments, please provide it EX: 22"
# else
#     NUM=$#
#     if [[ $(expr $NUM % 2) -ne 0 ]]; then
#         echo "$NUM is an Odd Number"
#     else
#         echo "$NUM is an Even Number"
#     fi
# fi

# *********** prompt for entering the number *****************

read -p "Enter the Number:" NUM
NUM=$1
if [[ $(expr $NUM % 2) -ne 0 ]]; then
    echo "$NUM is an Odd Number"
else
    echo "$NUM is an Even Number"
fi
