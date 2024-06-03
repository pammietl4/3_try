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

# *********** prompt for entering the number (Boolean Operators -- OR condition) *****************

# read -p "Enter the Name:" STRING
# if [ ${STRING} == 'SUPERSTAR' -o ${STRING} == 'superstar' -o ${STRING} == 'Superstar' ]; then  #-o is (OR) operator
#     echo "He is Mahesh Babu"
# else
#     echo "He is not an Actor"
# fi

# *********** prompt for entering the number Driving License (Boolean Operators  -- AND condition) *****************

read -r -p "Please provide your DOB:" YOB
CURRENT_AGE=$(expr 2024 - $YOB)
#echo $CURRENT_AGE
if [ $CURRENT_AGE -lt 18 ]; then
    echo "Your $CURRENT_AGE is less than 18, please wait till you reach the Age limit"
elif [ $CURRENT_AGE -gt 18 -a $CURRENT_AGE -lt 50 ]; then
    echo "You'r $CURRENT_AGE Years old, you can apply for the Driving license"
elif [ $CURRENT_AGE -gt 50 -a $CURRENT_AGE -lt 100 ]; then
    echo "You'r $CURRENT_AGE Years old, please provide Medical Bills to get the Driving license"
else
    echo "You'r $CURRENT_AGE Years old, you are not recomanded to Drive for your safety"
fi
