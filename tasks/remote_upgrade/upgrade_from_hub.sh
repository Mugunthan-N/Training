#!/bin/sh
SRC_DIR=/home/temp/
MNT_DIR=/mnt/temp/
HUB_TEMP=/real/hub_temp/

remove_old_files(){
    echo "Removing old Files... "
    echo
    rm -rvf /real/tree
    rm -v /real/earlysetup.sh
    OLD_RFS=`find /real/rfs/rfs*.squash`
    echo "Deleted old files..."
}

copy_new_files(){
    echo "Copying new files..."
    echo
    cp -v $HUB_TEMP/rfs*.squash /real/rfs
    rm $OLD_RFS
    cp -v $HUB_TEMP/earlysetup.sh /real/
    cp -v $HUB_TEMP/tree.tar.gz /real/
    cp -v $HUB_TEMP/serialapi_controller_bridge_ZM5304_US.hex /real/
    echo "Copied new files..."
}

install(){
    echo "Extracting tree..."
    tar xvf /real/tree.tar.gz -C /real/
    echo "Stoping rentlyhub..."
    systemctl stop rentlyhub
    echo "Gpio work..."
    gpio 122 1 && gpio 121 0
    pg -f -r  /real/serialapi_controller_bridge_ZM5304_US.hex /dev/ttyS2
    rm -v /real/slave.js
}

remove_hub_temp(){
    rm -rvf $HUB_TEMP
}

do_upgrade(){
    remove_old_files
    copy_new_files
    install
    remove_hub_temp
    echo "Done...  Rebooting..."
    reboot
}

if [ `cd $HUB_TEMP && ls . | wc -l` -eq 4 ]; then
    echo "Found files... Upgrading..."
    do_upgrade
else
    echo "No file found... Transfer Files and try again..."
    remove_hub_temp
    exit 1
fi
