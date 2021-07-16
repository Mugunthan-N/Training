#!/bin/bash
SRC_DIR=/home/temp/
MNT_DIR=/mnt/temp/
HUB_TEMP=/real/hub_temp/
DESTIP=root@192.168.43.252

extract_files(){
    echo "Extracting required files from new image"
    echo ">>> Enter the location of new img:"
    read IMG
    sudo umount $MNT_DIR
    sudo rm -rf $MNT_DIR
    sudo rm -rf $SRC_DIR
    sudo mkdir $MNT_DIR
    echo "mounting image to $MNT_DIR"
    sudo mount -rw -t ext4 -o loop,offset=1048576 $IMG $MNT_DIR
    sudo mkdir $SRC_DIR
    sudo chmod -R 777 $SRC_DIR
    echo "Copying required files from $MNT_DIR to $SRC_DIR "
    cp $MNT_DIR/rfs/rfs*.squash $SRC_DIR/
    unsquashfs $SRC_DIR/rfs*.squash
    cp squashfs-root/lib/firmware/zwave/serialapi_controller_bridge_ZM5304_US.hex $SRC_DIR
    rm -rf ./squashfs-root
    cd $MNT_DIR && tar -czvf $SRC_DIR/tree.tar.gz tree
    cp $MNT_DIR/earlysetup.sh $SRC_DIR
}

tranfer_files(){
    echo
    echo "Transfering new files to the hub..."
    echo
    ssh $DESTIP mkdir -p $HUB_TEMP
    echo "Transfering new rfs.squash to the hub..."
    scp $SRC_DIR/rfs*.squash $DESTIP:$HUB_TEMP
    echo "Transfering earlysetup.sh file to the hub..."
    scp $SRC_DIR/earlysetup.sh $DESTIP:$HUB_TEMP
    echo "Transfering tree tar file to the hub..."
    scp $SRC_DIR/tree.tar.gz $DESTIP:$HUB_TEMP
    echo "Transfering new Serial API file to the hub..."
    scp $SRC_DIR/serialapi_controller_bridge_ZM5304_US.hex $DESTIP:$HUB_TEMP
    echo "Copied new files..."
    echo
}

remove_old_files(){
    echo "Removing old Files... "
    echo
    echo "Removing tree... "
    ssh $DESTIP rm -rf /real/tree
    echo "Removing earlysetup... "
    ssh $DESTIP rm -rf /real/earlysetup.sh
    echo "Removing old rfs.squash... "
    ssh $DESTIP rm -rf /real/rfs/rfs*.squash
    echo "Deleted old files..."
}

copy_new_files(){
    echo "Copying new files..."
    ssh $DESTIP cp $HUB_TEMP/rfs*.squash /real/rfs
    ssh $DESTIP cp $HUB_TEMP/earlysetup.sh /real/
    ssh $DESTIP cp $HUB_TEMP/tree.tar.gz /real/
    ssh $DESTIP cp $HUB_TEMP/serialapi_controller_bridge_ZM5304_US.hex /real/
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
    ssh $DESTIP rm /real/slave.js
}

remove_hub_temp(){
    ssh $DESTIP rm -rf $HUB_TEMP
}

#extract_files
tranfer_files
remove_old_files
copy_new_files
install
remove_hub_temp
echo "Done...  Rebooting..."
ssh $DESTIP reboot
