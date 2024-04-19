#!/bin/bash


SOURCE_DIR=/tmp/shellscript.logs

#check directory is exist or not 
if [ !d SOURCE_DIR=]
then
	echo "Source directory is not exist"
fi 

FILES_TO_DELETE=$(find $SOURCE_DIR -type f -mtime 14 -name "*.log")

while IFS= read -r line
do
	echo "Deleting line $line"
	rm -rf $line
done <<< $FILES_TO_DELETE
