#!/bin/bash

if [ $# -lt 1 ]
then
    echo "Usage: $0 [container name]"
    exit 1
fi

docker exec -it $1 /bin/bash
# or
# docker attach [name] # Doesn't work most of the time
