#!/bin/bash
# Sample run and build docker script

SERVICE="webserver"
PORT=80

sudo docker build -t $SERVICE . && sudo docker run -dt -p $PORT:$PORT --name $SERVICE $SERVICE
