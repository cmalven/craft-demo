#!/usr/bin/env bash

DEV_MYSQL_HOST="localhost"
DEV_MYSQL_USER="root"
DEV_MYSQL_PASSWORD="root"

MYSQL_DATABASE="craft_demo"

DUMP_FILE_PATH=~/Dropbox/Projects/Personal/craft-demo/db
DEV_DUMP_FILE=db.sql

DEV_MYSQL_CONNECT="--host=$DEV_MYSQL_HOST --user=$DEV_MYSQL_USER --password=$DEV_MYSQL_PASSWORD $MYSQL_DATABASE"

# Create backups of dev db
/Applications/MAMP/Library/bin/mysqldump > $DUMP_FILE_PATH/$DEV_DUMP_FILE $DEV_MYSQL_CONNECT