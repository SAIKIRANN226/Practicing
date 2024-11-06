#!/bin/bash

ID=$(id -u)
DATE=$(date)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE() {
    if [ $1 -ne 0 ]
    then 
        echo -e "$2.... $R FAILED $N"
        exit 1
    else
        echo -e "$2.... $G  SUCCESS $N"
    fi
}

if [ $ID -ne 0 ]
then 
    echo -e "$R ERROR:: Please Run this script with root user $N"
    exit 1
else
    echo -e "$Y Script started executing at ${DATE} $N"
fi

for package in $@
do
   yum list installed $package
   if [ $? -ne 0 ]
   then 
        yum install $package -y
    else
        echo -e "$package is already installed......$Y SKIPPING
    fi
done

