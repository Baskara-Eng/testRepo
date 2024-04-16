#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
	echo "please execute command with root user"
	exit 10
else
	echo "you are root user"
fi

yum install mysql -y

