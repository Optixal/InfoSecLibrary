#!/bin/bash

if [ $# -lt 1 ]
then
    echo "Usage: $0 [container name]"
    exit 1
fi

sudo docker stop $1
sudo docker rm $1 && sudo docker rmi $1

echo "Successfully deleted $1!"

