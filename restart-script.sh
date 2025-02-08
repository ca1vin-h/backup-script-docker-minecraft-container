#!/bin/bash

# Check if both arguments were provided
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
    echo "Usage: $0 <container_id> <output_dir/> <server_name>"
    exit 1
fi

#container id is the input
CONTAINER=$1
OUTPUT_DIR=$2
SERVER_NAME=$3


sudo docker exec $CONTAINER rcon-cli tellraw @a '{"text":"Server restarting in 15 minutes!","color":"gold"}'

sleep 300

sudo docker exec $CONTAINER rcon-cli tellraw @a '{"text":"Server restarting in 10 minutes!","color":"gold"}'

sleep 300

sudo docker exec $CONTAINER rcon-cli tellraw @a '{"text":"Server restarting in 5 minutes!","color":"gold"}'

sleep 60

sudo docker exec $CONTAINER rcon-cli tellraw @a '{"text":"Server restarting in 4 minutes!","color":"gold"}'

sleep 60

sudo docker exec $CONTAINER rcon-cli tellraw @a '{"text":"Server restarting in 3 minutes!","color":"gold"}'

sleep 60

sudo docker exec $CONTAINER rcon-cli tellraw @a '{"text":"Server restarting in 2 minutes!","color":"gold"}'

sleep 60

sudo docker exec $CONTAINER rcon-cli tellraw @a '{"text":"Server restarting in 1 minute!","color":"red"}'

sleep 15

sudo docker exec $CONTAINER rcon-cli tellraw @a '{"text":"Server restarting in 45 seconds!","color":"red"}'

sleep 15

sudo docker exec $CONTAINER rcon-cli tellraw @a '{"text":"Server restarting in 30 seconds!","color":"red"}'

sleep 15

sudo docker exec $CONTAINER rcon-cli tellraw @a '{"text":"Server restarting in 15 seconds!","color":"red"}'

sleep 5

sudo docker exec $CONTAINER rcon-cli tellraw @a '{"text":"Server restarting in 10 seconds!","color":"red"}'

sleep 1

sudo docker exec $CONTAINER rcon-cli tellraw @a '{"text":"Server restarting in 9 seconds!","color":"red"}'

sleep 1

sudo docker exec $CONTAINER rcon-cli tellraw @a '{"text":"Server restarting in 8 seconds!","color":"red"}'

sleep 1

sudo docker exec $CONTAINER rcon-cli tellraw @a '{"text":"Server restarting in 7 seconds!","color":"red"}'

sleep 1

sudo docker exec $CONTAINER rcon-cli tellraw @a '{"text":"Server restarting in 6 seconds!","color":"red"}'

sleep 1

sudo docker exec $CONTAINER rcon-cli tellraw @a '{"text":"Server restarting in 5 seconds!","color":"red"}'

sleep 1

sudo docker exec $CONTAINER rcon-cli tellraw @a '{"text":"Server restarting in 4 seconds!","color":"red"}'

sleep 1

sudo docker exec $CONTAINER rcon-cli tellraw @a '{"text":"Server restarting in 3 seconds!","color":"red"}'

sleep 1

sudo docker exec $CONTAINER rcon-cli tellraw @a '{"text":"Server restarting in 2 seconds!","color":"red"}'

sleep 1

sudo docker exec $CONTAINER rcon-cli tellraw @a '{"text":"Server restarting in 1 second!","color":"red"}'

sleep 1

sudo docker exec $CONTAINER rcon-cli tellraw @a '{"text":"Server restarting.","color":"red"}'

sleep 1

sudo docker stop $CONTAINER

#set timestamp for backup file name
TIMESTAMP=$(TZ="America/New_York" date +"%Y-%m-%d_%H-%M-%S")

#Create backup name
BACKUP_PATH="${OUTPUT_DIR}${SERVER_NAME}-${TIMESTAMP}-backup.tar.gz"

# Make temporary directory
TEMP_DIR="/tmp/${SERVER_NAME}_backup"
sudo mkdir -p "$TEMP_DIR"

# Copy data from the container to the temporary directory
sudo docker cp "$CONTAINER:/data" "$TEMP_DIR"

#restart container for speed
sudo docker start $CONTAINER

# zip up the temporary folder into the backup path and compress with gzip
sudo tar -czvf $BACKUP_PATH $TEMP_DIR

# remove the temporary directory
sudo rm -rf "$TEMP_DIR"