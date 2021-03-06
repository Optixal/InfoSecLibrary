#!/bin/bash
# Sample run and build docker script

SERVICE="mysqlserver"
PORT=3306

sudo docker build -t $SERVICE . && sudo docker run -dt -p $PORT:$PORT --name $SERVICE $SERVICE
