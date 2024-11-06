#!/bin/bash

ID=$(id -u)
DATE=$(date)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGFILE="/tmp/saikirann.log"

VALIDATE() {
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 ....$R FAILED $N"
        exit 1
    else 
        echo -e "$2....$G SUCCESS $N"
    fi
}

if [ $ID -ne 0 ]
then 
    echo -e "$R ERROR:: PLEASE RUN THIS SCRIPT WITH ROOT USER $N"
    exit 1
else
    echo -e "$Y This script is started executing at ${DATE} $N"
fi

for package in $@
do
    yum list installed $package &>> $LOGFILE
    if [ $? -ne 0 ]
    then 
        yum install $package -y &>> $LOGFILE
        VALIDATE $? "Installing ...$package"
    else
        echo -e "$Package $Y is already installed so $G SKIPPING $N"
    fi
done
