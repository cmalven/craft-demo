#!/usr/bin/env bash

DEV_MYSQL_HOST="localhost"
DEV_MYSQL_USER="root"
DEV_MYSQL_PASSWORD="root"

MYSQL_DATABASE="craft_demo"

DUMP_FILE_PATH=~/Desktop/tnr_db_backups
STAGING_DUMP_FILE=staging_dump_$DATE.sql
DEV_DUMP_FILE=dev_dump_$DATE.sql

STAGING_MYSQL_CONNECT="--host=$STAGING_MYSQL_HOST --user=$STAGING_MYSQL_USER --password=$STAGING_MYSQL_PASSWORD $MYSQL_DATABASE"
DEV_MYSQL_CONNECT="--host=$DEV_MYSQL_HOST --user=$DEV_MYSQL_USER --password=$DEV_MYSQL_PASSWORD $MYSQL_DATABASE"

# Create a folder to store backups in
if ! [ -d $DUMP_FILE_PATH ]; then
  mkdir $DUMP_FILE_PATH
fi

# Create backups of both dev and staging dbs
/Applications/MAMP/Library/bin/mysqldump > $DUMP_FILE_PATH/$DEV_DUMP_FILE $DEV_MYSQL_CONNECT
mysqldump > $DUMP_FILE_PATH/$STAGING_DUMP_FILE $STAGING_MYSQL_CONNECT

# Import the dumped dev db into staging db
mysql $STAGING_MYSQL_CONNECT < $DUMP_FILE_PATH/$DEV_DUMP_FILE