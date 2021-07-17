#!/bin/bash
SRC_DIR=/home/temp/
MNT_DIR=/mnt/temp/
HUB_TEMP=/real/hub_temp/
HUB_SCRIPT=upgrade_from_hub.sh
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
    echo
    scp $HUB_SCRIPT $DESTIP:/root/
    echo "Copied new files..."
    echo
    ssh $DESTIP source /root/$HUB_SCRIPT
    echo "Invocked Script..."
    echo
}

extract_files
tranfer_files