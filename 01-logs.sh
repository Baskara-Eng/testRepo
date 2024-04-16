#!/bin/bash

ID=$(id -u)

echo "scipt name $0"

if [ $ID -ne 0 ]
then 
	echo "please execute command with root user"
	exit 1
else
	echo "you are root user"
fi

VALIDATE(){
	if[ $1 -ne 0 ]
	then 
		echo "$2 installtion is failed"
		exit 1
	else
		echo "$2 installtion is success"
	fi
}



yum install mysql -y

VALIDATE $? "mysql"

yum install git -y

VALIDATE $? "git"