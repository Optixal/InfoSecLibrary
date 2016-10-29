#!/bin/bash
# Sample run and build docker script for a python server

touch requirements.txt
docker build -t helloworld .
docker run -dt -p 6969:6969 --name helloworld helloworld
