#!/bin/bash -e

dtc -@ -Hepapr -I dts -O dtb -o "${ROOTFS_DIR}/boot/overlays/disable-gigabit-ethernet.dtbo" files/disable-gigabit-ethernet.dts

echo "dtoverlay=disable-gigabit-ethernet" >> "${ROOTFS_DIR}/boot/firmware/config.txt"
