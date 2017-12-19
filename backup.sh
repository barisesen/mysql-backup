#!/bin/bash

## Config
# Backup folder directory
backup_dir="YOUR_BACKUP_DIR"

# Mysql credentials
mysql_user="YOUR_MYSQL_USER"
mysql_password="YOUR_MYSQL_PASSWORD"
mysql_database="YOUR_MYSQL_DATABASE_NAME"

# last backup file limit
# for example delete old 30 days old backups > backup_file_limit=30
backup_file_limit=30


# check directory is available
if [[ ! -e $backup_dir ]]; then
    mkdir $backup_dir
fi

# New file name
file=$backup_dir/`date +%Y%m%d_%H%M%S`.db

# Dump mysql database
mysqldump -u $mysql_user --password=$mysql_password $mysql_database > $file
gzip $file

# delete old backups
total=$(ls -lt $backup_dir | awk {'print $9'} | wc -l)
if [ $total -gt $backup_file_limit ];then
	old_file_count=$(( $total - $backup_file_limit ))
	old_files=$(ls -lt $backup_dir | awk {'print $9'} | tail -$old_file_count)
	for i in $old_files;do rm -rf $backup_dir/$i;done
fi

# Bug!
rm -rf ./$backup_file_limit
exit 1
