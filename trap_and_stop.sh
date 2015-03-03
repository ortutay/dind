#!/bin/bash
trap "service docker stop ; exit" SIGINT SIGTERM
echo "Process $$ will capture SIGINT and SIGTERM and stop docker"

while :
do
    sleep 1
done
