#!/bin/bash

MONGO_DATABASE="test"
APP_NAME="app_name"

MONGO_HOST="127.0.0.1"
MONGO_PORT="27017"
TIMESTAMP=`date +%F-%H%M`
MONGODUMP_PATH="/usr/bin/mongodump"
BACKUPS_DIR="/home/webonise/backupdata/$APP_NAME"
BACKUP_NAME="$APP_NAME-$TIMESTAMP"


$MONGODUMP_PATH -d $MONGO_DATABASE


mkdir -p $BACKUPS_DIR
mv dump $BACKUP_NAME
tar -zcvf $BACKUPS_DIR/$BACKUP_NAME.tgz $BACKUP_NAME
rm -rf $BACKUP_NAME
