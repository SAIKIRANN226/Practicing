#!/bin/bash

ID=$(id -u)
DATE=$(date)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $ID -ne 0 ]
then 
    echo -e "$R ERROR: Please run this script with root user $N"
    exit 1
else
    echo -e "$Y Script started executing at ${DATE} $N"
fi

yum install mysql -y

if [ $? -ne 0 ]
then 
    echo -e "$R ERROR:: Installing mysql failed $N"
    exit 1
else
    echo -e "$G Installing mysql success $N"
fi

yum install git -y

if [ $? -ne 0 ]
then 
    echo -e "$R ERROR:: Installing git is failed $N"
    exit 1
else
    echo -e "$Y Intalling git is success $N"
fi 


