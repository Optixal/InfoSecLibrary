#!/bin/bash
# Sample run and build docker script

SERVICE="helloworld"
PORT=8000

sudo docker build -t $SERVICE . && sudo docker run -dt -p $PORT:$PORT --name $SERVICE $SERVICE
