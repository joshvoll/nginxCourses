#Create the script in the following location:
	#!/bin/sh
	# /usr/local/bin/rotate_nginx_access_log.sh

#Before running this script make sure it has executable permissions
#chmod +x /usr/local/bin/<shell script name>

#Also make sure you add a cronjob to your crontab that will rotate 
#based on your specifications (e.g. nightly, weekly, monthly etc.)

#Get Yesterday's date as YYYY-MM-DD
YESTERDAY=$(date -d 'yesterday' '+%Y-%m-%d')
PID_FILE=/run/nginx.pid
LOG_FILE=/var/log/error.log
OLD_FILE=/var/log/error-$YESTERDAY.log

#Rotate yesterday's log.
mv $LOG_FILE $OLD_FILE

#Tell nginx to open the log file
kill -USR1 $(cat $PID_FILE)