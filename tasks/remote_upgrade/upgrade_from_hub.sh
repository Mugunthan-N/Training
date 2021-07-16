SRC_DIR=/home/tmp
SRCIP=mugunthan@192.168.43.13
echo
echo "Removing old Files... "
echo
echo "Removing Certificates... "
rm -rf /real/certs
echo "Removing corerfs... "
rm /real/corerfs.json
sync
#echo "zlink.js... "
#zlink.js
echo "Removing tree... "
rm -rf /real/tree
echo "Removing old rfs.squash... "
rm -rf /real/rfs/rfs*.squash
echo "Deleted old files..."
echo
echo "Copying new files from the source..."
echo
echo "Copying new rfs.squash from the source..."
scp $SRCIP:$SRC_DIR/rfs*.squash /real/rfs
echo "Copying earlysetup.sh file from the source..."
scp $SRCIP:$SRC_DIR/earlysetup.sh /real/
echo "Copying tree tar file from the source..."
scp $SRCIP:$SRC_DIR/tree.tar.gz /real/
echo "Copying new Serial API file from the source..."
scp $SRCIP:$SRC_DIR/serialapi_controller_bridge_ZM5304_US.hex /real/
echo "Copied new files..."
echo
echo "Extracting tree..."
tar xvf /real/tree.tar.gz
echo "Stoping rentlyhub..."
systemctl stop rentlyhub
echo "Gpio work..."
gpio 122 1 && gpio 121 0
echo "Serial API..."
pg -f -r  /real/serialapi_controller_bridge_ZM5304_US.hex /dev/ttyS2
echo "Done..."