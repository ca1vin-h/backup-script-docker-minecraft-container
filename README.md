# Restart Script for Docker Minecraft Container

## Overview
This Bash script automates the process of restarting a Dockerized Minecraft server based on the [itzg/docker-minecraft-server](https://github.com/itzg/docker-minecraft-server). It provides scheduled warning messages to players before stopping the server, backs up the world data, and then restarts the server. This task should be scheduled to run automatically, for example, using a cron job.

## Usage
```sh
./restart-script.sh <container_id> <output_dir/> <server_name>
```

### Arguments
- `<container_id>`: The ID or name of the running Docker container hosting the Minecraft server.
- `<output_dir/>`: The directory where the server backup will be stored.
- `<server_name>`: The name of the server (used for backup file naming).

## Features
- Sends a series of countdown warnings to players before restart.
- Stops the server gracefully.
- Creates a timestamped backup of the server's world data.
- Restarts the server immediately after stopping.
- Stores the backup in a user-specified output directory.

## Dependencies
- Docker (installed and running)
- `rcon-cli` (installed within the Docker container for sending in-game messages)
- Sufficient disk space for backup storage

## Example
```sh
./restart-script.sh minecraft_server /backups/ my_minecraft_world
```
This example will:
1. Warn players about the restart.
2. Stop the Docker container `minecraft_server`.
3. Backup the server world data to `/backups/`.
4. Restart the `minecraft_server` container.

## Backup Naming Convention
Backups are saved as:
```
<output_dir>/<server_name>-YYYY-MM-DD_HH-MM-SS-backup.tar.gz
```
Example:
```
/backups/my_minecraft_world-2025-02-07_12-30-00-backup.tar.gz
```

## Notes
- The script assumes the server data is located at `/data` inside the container.
- The timezone for timestamps is set to `America/New_York`.
- Ensure the script is executed with appropriate permissions (`sudo` may be required for Docker operations).
- This script is intended to be run automatically, such as via a cron job, to ensure regular backups and server restarts.

## License
This script is provided under the MIT License. Modify and distribute freely.

