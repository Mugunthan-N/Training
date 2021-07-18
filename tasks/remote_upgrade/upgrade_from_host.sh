#!/bin/bash
SRC_DIR=/home/temp/
MNT_DIR=/mnt/temp/
HUB_TEMP=/real/hub_temp/
DESTIP=root@192.168.43.252

extract_files(){
    echo "Extracting required files from new image"
    echo ">>> Enter the location of new img:"
    read IMG
    sudo umount -v $MNT_DIR
    sudo rm -vrf $MNT_DIR
    sudo rm -vrf $SRC_DIR
    sudo mkdir $MNT_DIR
    echo "mounting image to $MNT_DIR"
    sudo mount -vrw -t ext4 -o loop,offset=1048576 $IMG $MNT_DIR
    sudo mkdir -v $SRC_DIR
    sudo chmod -R 777 $SRC_DIR
    echo "Copying required files from $MNT_DIR to $SRC_DIR "
    cp -v $MNT_DIR/rfs/rfs*.squash $SRC_DIR/
    unsquashfs $SRC_DIR/rfs*.squash
    cp -v squashfs-root/lib/firmware/zwave/serialapi_controller_bridge_ZM5304_US.hex $SRC_DIR
    rm -rf ./squashfs-root
    cd $MNT_DIR && tar -czvf $SRC_DIR/tree.tar.gz tree
    cp -v $MNT_DIR/earlysetup.sh $SRC_DIR
}

tranfer_files(){
    echo
    echo "Transfering new files to the hub..."
    echo
    ssh $DESTIP mkdir -vp $HUB_TEMP
    echo "Transfering new rfs.squash to the hub..."
    scp $SRC_DIR/rfs*.squash $DESTIP:$HUB_TEMP
    echo "Transfering earlysetup.sh file to the hub..."
    scp $SRC_DIR/earlysetup.sh $DESTIP:$HUB_TEMP
    echo "Transfering tree tar file to the hub..."
    scp $SRC_DIR/tree.tar.gz $DESTIP:$HUB_TEMP
    echo "Transfering new Serial API file to the hub..."
    scp $SRC_DIR/serialapi_controller_bridge_ZM5304_US.hex $DESTIP:$HUB_TEMP
    echo "Transfered new files..."
    echo
}

remove_old_files(){
    echo "Removing old Files... "
    echo
    ssh $DESTIP rm -rvf /real/tree
    ssh $DESTIP rm -v /real/earlysetup.sh
    OLD_RFS=`ssh $DESTIP find /real/rfs/rfs*.squash`
    echo "Deleted old files..."
}

copy_new_files(){
    echo "Copying new files..."
    echo
    ssh $DESTIP cp -v $HUB_TEMP/rfs*.squash /real/rfs
    ssh $DESTIP rm -v $OLD_RFS
    ssh $DESTIP cp -v $HUB_TEMP/earlysetup.sh /real/
    ssh $DESTIP cp -v $HUB_TEMP/tree.tar.gz /real/
    ssh $DESTIP cp -v $HUB_TEMP/serialapi_controller_bridge_ZM5304_US.hex /real/
    echo "Copied new files..."
}

install(){
    echo "Extracting tree..."
    ssh $DESTIP tar xvf /real/tree.tar.gz -C /real/
    echo "Stoping rentlyhub..."
    ssh $DESTIP systemctl stop rentlyhub
    echo "Gpio work..."
    ssh $DESTIP gpio 122 1 && gpio 121 0
    echo "Serial API..."
    ssh $DESTIP pg -f -r  /real/serialapi_controller_bridge_ZM5304_US.hex /dev/ttyS2
    echo "Removing slave.js..."
    ssh $DESTIP rm -v /real/slave.js
}

remove_hub_temp(){
    ssh $DESTIP rm -rvf $HUB_TEMP
}

do_upgrade(){
    remove_old_files
    copy_new_files
    install
    remove_hub_temp
    echo "Done...  Rebooting..."
    ssh $DESTIP reboot
}

get_sum()
{
    for i in $SRC_DIR/*; do
        MD5_SUM=`md5sum $i`
        SRC_MD5+=${MD5_SUM:0:32}
    done
    for i in `ssh $DESTIP ls $HUB_TEMP`; do
        MD5_SUM=`ssh $DESTIP md5sum $HUB_TEMP/$i`
        DEST_MD5+=${MD5_SUM:0:32}
    done
}

extract_files
tranfer_files
get_sum
if [ $SRC_MD5 == $DEST_MD5 ]; then
    echo "Transfer Suceeded... Upgrading hub..."
    do_upgrade
else
    echo "Transfer failed... try again..."
    remove_hub_temp
    exit 1
fi
