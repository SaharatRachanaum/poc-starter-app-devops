#!/bin/bash

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_DIR="./backups"
CONTAINER_NAME="psu_postgres"
DB_USER="postgres"
DB_NAME="psu_activities"

mkdir -p $BACKUP_DIR

echo "Starting backup for $DB_NAME..."
docker exec -t $CONTAINER_NAME pg_dump -U $DB_USER $DB_NAME > "$BACKUP_DIR/backup_$TIMESTAMP.sql"

if [ $? -eq 0 ]; then
  echo "Backup successfully created: $BACKUP_DIR/backup_$TIMESTAMP.sql"
else
  echo "Backup failed!"
  exit 1
fi