#!/bin/bash

# standard input   = 0
# standard output  = 1  -- it will display only successful command data
# standard error   = 2  -- it will display failed data
# /dev/null  -- special file ( it will show the output of the code but it will not store the output data )
# >  -- over writing the file
# >> -- appending the date to existing file
# tee 
# tee -a
# grep / egrep (-inwv) -- finding some specific name/word from a file
# top / htop -- cpu / memory information 

df -h
mahesh babu
ls -lart
megastar

# bash Output_redirectional.sh 1> /dev/null -- it will display failed records
# bash Output_redirectional.sh 2> /dev/null -- it will display success records

# 2&>1   -- redirecting stderr to stdout

# ps -ef | grep -i ec2-user  -- 
# ps -ef(input file) / grep 
#-i (case sensitive) -w (word match) -v (it will print not matching word) -E (multi search)

# ps -ef |grep -iE 'ec2-user|chrony'
# ps -ef |grep -iE 'ec2-user|chrony' |grep -v grep





