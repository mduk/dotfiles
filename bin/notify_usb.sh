#!/bin/bash

export DISPLAY=":0"
su daniel -c "/usr/bin/notify-send \"$DEVNAME connected\" \"$ID_VENDOR $ID_MODEL\""

OPTIONS=""
if [[ "$ID_FS_TYPE" == "vfat" ]]; then
  OPTIONS="-o \"umask=033,gid=1000,uid=1000\""
fi

mount -t $ID_FS_TYPE $DEVNAME /mnt/usb/$ID_FS_TYPE 2>&1 >> /tmp/usb.tmp
