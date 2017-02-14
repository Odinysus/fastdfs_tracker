FROM johndric/fastdfs_base
MAINTAINER <caidongqiang@hotmail.com>

COPY tracker.conf /etc/fdfs/tracker.conf

VOLUME /mnt/tracker

CMD ["fdfs_trackerd /etc/fdfs/tracker.conf stop && fdfs_trackerd /etc/fdfs/tracker.conf start"]
