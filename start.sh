#!/bin/bash

FASTDFS_BASE_PATH="/mnt/tracker"
FASTDFS_LOG_FILE="$FASTDFS_BASE_PATH/logs/storaged.log"
TRACKER_PID "$FASTDFS_BASE_PATH/data/fdfs_storaged.pid"

fdfs_trackerd /etc/fdfs/tracker.conf stop && fdfs_trackerd /etc/fdfs/tracker.conf start

TIMES=100
while [ ! -f "$TRACKER_PID" -a $TIMES -gt 0 ]
do 
    sleep 1
    TIMES=`expr $TIMES - 1`
done

# if the storage node start successfully, print the start time
if [ $TIMES -gt 0 ]; then
        echo "storage started successfully at $(date +%Y-%m-%d_%H:%M)"
        echo "please have a look at the log detail at $FASTDFS_LOG_FILE and $NGINX_ERROR_LOG"
        echo
        echo
        tail -f $FASTDFS_LOG_FILE  -f /mnt/storage/logs/storaged.log
else
        tail $FASTDFS_LOG_FILE
        echo "error at $FASTDFS_LOG_FILE 
fi

