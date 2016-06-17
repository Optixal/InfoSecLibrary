#!/bin/bash

clear

echo -n "Enter payload's name: "
read PAYLOAD
echo -e "\nSearching for $PAYLOAD payload..."
if [ -f payload/$PAYLOAD ]
then
	echo -e "$PAYLOAD payload loaded successfully!\n"
else
	echo "Failed: Unable to find $PAYLOAD payload. Exiting..."
	exit 1
fi
echo -n "Enter remote IP: "
read IP
echo -n "Enter remote user: "
read USER
echo -n "Enter remote user's password: "
read PASSWORD

scp payload/$PAYLOAD $USER@$IP:
ssh $USER@$IP
