#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE() {
    if [ $1 -ne 0 ]
    then
        echo -e "$2....$R FAILED"
        exit 1
    else
        echo -e "$2....$G SUCCESS"
    fi
}

DATE=$(date)
LOGFILE="/tmp/saikiran.logfile"

if [ $ID -ne 0 ]
then 
    echo -e "$R ERROR:: Please run this scrip with root user $N"
    exit 1
else
    echo -e "$Y Script started executing ${DATE} $N"
fi


yum install mysql -y &>> LOGFILE
VALIDATE $? "Installing mysql"

yum install git -y &>> LOGFILE
VALIDATE $? "Installing git"
