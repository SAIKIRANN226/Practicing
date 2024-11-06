#!/bin/bash

ID=$(id -u)
DATE=$(date)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $ID -ne 0 ]
then 
    echo -e "$R ERROR:: PLEASE RUN THIS SCRIPT WITH ROOT USER $N"
    exit 1
else
    echo -e "$Y This script is started executing at ${DATE} $N"
fi

yum install mysql 
if [ $? -ne 0 ]
then 
    echo -e "$R Installing mysql is failed $N"
    exit 1
else    
    echo -e "$G Installing mysql is SUCCESS $N"
fi 

