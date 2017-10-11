#!/bin/bash
# Sample run and build docker script, requires Dockerfile

SERVICE="mysqlserver"
PORT=3306
MEMORY="64M"

docker build -t $SERVICE . && docker run -dt -p $PORT:$PORT --restart always --memory $MEMORY --name $SERVICE $SERVICE
