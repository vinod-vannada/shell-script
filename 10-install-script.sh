#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR: you must have sudo access to execute this script"
    exit 1 #other than 0
fi

dnf list installed mysql

if [ $? -ne 0 ]
then # not installed
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "Installing MySQL ... FAILURE"
        exit 1
    else
        echo "Imstalling MySQL ... SUCCESS"
    fi   
else 
    echo "MySQL is already... INSTALLED"
fi

dnf list installed git

if [ $? -ne 0 ]
then # not installed
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo "Installing git ... FAILURE"
        exit 1
    else
        echo "Imstalling git ... SUCCESS"
    fi   
else 
    echo "Git is already... INSTALLED"
fi

