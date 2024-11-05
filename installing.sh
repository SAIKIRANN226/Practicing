#!/bin/bash

ID=$(id -u)
DATE=$(date)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $ID -ne 0 ]
then 
    echo "$R ERROR: Please run this script with root user $N"
    exit 1
else
    echo "$Y Script started executing at ${DATE} $N"
fi

yum install mysql -y

if [ $? -ne 0 ]
then 
    echo "$R ERROR:: Installing mysql failed $N"
    exit 1
else
    echo "$G Installing mysql success $N"
fi


