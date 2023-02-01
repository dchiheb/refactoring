#!/bin/bash
#description : this script will backup the log file to a new location , rename it with the appropriate name including the timestamp
#and then archive +compresse it last thing this script will remove the current logfile.

# The name of the log file to backup
logfile="/home/bee/cronlog.log"

# The directory where the log file will be backed up
backup_dir="/home/bee/archive"

# Get the current date and time
timestamp=$(date +%Y%m%d%H%M%S)

# Create the backup directory if it doesn't exist
if [ ! -d $backup_dir ]; then
  mkdir $backup_dir
fi

# Backup the log file
cp $logfile $backup_dir

# Rename the backed up log file with the timestamp
mv $backup_dir/$logfile $backup_dir/${logfile}.$timestamp

# Archive the backed up log file
tar -cvf $backup_dir/${logfile}.$timestamp.tar $backup_dir/${logfile}.$timestamp

# Compress the archived log file
gzip $backup_dir/${logfile}.$timestamp.tar



