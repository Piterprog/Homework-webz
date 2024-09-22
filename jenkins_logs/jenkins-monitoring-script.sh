#!/bin/bash

LOG_DIR="/var/log/jenkins"
LOG_FILE="$LOG_DIR/floating_ip_monitor.log"

# Create the directory if it doesn't exist
if [ ! -d "$LOG_DIR" ]; then
    mkdir -p $LOG_DIR
    chown jenkins:jenkins $LOG_DIR
    chmod 755 $LOG_DIR
fi

# Create the file if it doesn't exist
if [ ! -f "$LOG_FILE" ]; then
    touch $LOG_FILE
    chown jenkins:jenkins $LOG_FILE
    chmod 644 $LOG_FILE
fi

# Make the request
response=$(curl -s http://172.18.0.100:80)

# Log the result
runtime=$(date)
container_name=${CONTAINER_NAME:-$(hostname)}
echo "[$runtime] Container: $container_name, Response: $response" >> $LOG_FILE
