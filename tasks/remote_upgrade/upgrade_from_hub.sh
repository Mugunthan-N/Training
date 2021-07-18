#!/bin/sh
SRC_DIR=/home/temp/
MNT_DIR=/mnt/temp/
HUB_TEMP=/real/hub_temp/
SRCIP=mugunthan@192.168.43.13

tranfer_files(){
    echo
    echo "Transfering new files from the source..."
    echo
    mkdir -vp $HUB_TEMP
    echo "Transfering new rfs.squash from the source..."
    scp $SRCIP:$SRC_DIR/rfs*.squash $HUB_TEMP
    echo "Transfering earlysetup.sh file from the source..."
    scp $SRCIP:$SRC_DIR/earlysetup.sh $HUB_TEMP
    echo "Transfering tree tar file from the source..."
    scp $SRCIP:$SRC_DIR/tree.tar.gz $HUB_TEMP
    echo "Transfering new Serial API file from the source..."
    scp $SRCIP:$SRC_DIR/serialapi_controller_bridge_ZM5304_US.hex $HUB_TEMP
    echo "Transfered new files..."
    echo
}

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

#tranfer_files
if [ `cd $HUB_TEMP && ls . | wc -l` -eq 4 ]; then
    echo "Found files... Upgrading..."
    do_upgrade
else
    echo "No file found... Transfer Files and try again..."
    remove_hub_temp
    exit 1
fi
