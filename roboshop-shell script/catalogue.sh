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

dnf module disable nodejs -y &>>LOGFILE

VALIDATE $? "disablling current nodejs version"

dnf module enable nodejs:18 -y &>>LOGFILE

VALIDATE $? "Enablling  nodejs 18 version"

dnf install nodejs -y &>>LOGFILE

VALIDATE $? "installing nodejs"

useradd roboshop

VALIDATE $? "creating user"  &>>LOGFILE

mkdir /app

VALIDATE $? "creating app directory"  &>>LOGFILE

curl -o /tmp/catalogue.zip https://roboshop-builds.s3.amazonaws.com/catalogue.zip

VALIDATE $? "downloading catalogue application"  &>>LOGFILE

cd /app 

unzip /tmp/catalogue.zip

npm install 

VALIDATE $? "installing nodejs dependencies" &>>LOGFILE

cp /home/centos/roboshop-shell script/catalogue.service /etc/systemd/system/catalogue.service

systemctl daemon-reload

VALIDATE $? "reload running demon"  &>>LOGFILE

systemctl enable catalogue

VALIDATE $? "Enabling catalogue application"  &>>LOGFILE

systemctl start catalogue

VALIDATE $? "Starting catalogue application"  &>>LOGFILE

cp /home/centos/tesetRepo/mango.repo /etc/yum.repos.d/mongo.repo

dnf install mongodb-org-shell -y

VALIDATE $? "Installing mongodb"  &>>LOGFILE

mongo --host mangodb.sadadevops.fun </app/schema/catalogue.js

VALIDATE $? "Updating mongodb host"  &>>LOGFILE