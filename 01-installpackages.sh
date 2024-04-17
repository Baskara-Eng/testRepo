#!/bin/bash

ID=$(id -u)

TIMESTAMP=$(date +%F-H-%M-%S)
LOG="/tmp/$0-$TIMESTAMP.log"

if [ $ID -ne 0 ]
then
	echo "please run command with root user"
	exit 1
else
	echo "you are root user"
fi

VALIDATE(){
	if [ $1 -ne 0 ]
	then
		echo "$2 installtion is failed"
	else
		echo "$2 installtion is success"
	fi
}

yum install mysql -y 

VALIDATE $? "mysql"

yum install git -y

VALIDATE $? "git"

echo "all arguements passed : $@"