# fastdfs_tracker

FastDFS version : 5.08

### RUN
```` bash
docker run --name tracker1 -v ~/tracker_data1:/mnt/tracker johndric/fastdfs_tracker
````

### LOG
```` bash
docker attach tracker1
tail -f /mnt/tracker/logs/trackerd.log
````
