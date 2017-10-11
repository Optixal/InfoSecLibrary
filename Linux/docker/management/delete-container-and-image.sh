#!/bin/bash

if [ $# -lt 1 ]
then
    echo "Usage: $0 [container name]"
    exit 1
fi

docker stop $1
docker rm $1 && docker rmi $1

