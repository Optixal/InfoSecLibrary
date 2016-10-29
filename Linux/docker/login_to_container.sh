#!/bin/bash

if [ $# -lt 1 ]
then
    echo "Usage: $0 [container name]"
    exit 1
fi

sudo docker exec -i -t $1 /bin/bash
# or
# sudo docker attach [name]
