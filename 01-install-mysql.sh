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

if [ $? -ne 0 ]
then 
	echo "mysql installtion is failed"
else
	echo "mysql installation is success"
fi
