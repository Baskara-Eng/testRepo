#!/bin/bash

ID=$(id -u)

TIMESTAMP=$(date +%F-H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "scipt started executing at $TIMESTAMP" &>> $LOGFILE

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

#echo "all arguements passed : $@"

for package in $@
do
	yum list installed $package &>> $LOGFILE
	if [ $? -ne 0 ]
	then 
		yum install $package -y &>> $LOGFILE
		VALIDATE $? "$package"
	else
		echo "package is installed already "
	fi
done
