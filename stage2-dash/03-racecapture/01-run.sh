#!/bin/bash -e

# RC_TEMP="$(mktemp)"
RC_TEMP=files/racecapture.deb
wget -O "$RC_TEMP" https://autosportlabs-software.s3.us-west-2.amazonaws.com/racecapture_linux_raspberrypi_2.17.1.deb
dpkg-deb -x $RC_TEMP ${ROOTFS_DIR}
# rm -rf $RC_TEMP

install -m 644 files/racecapture.service "${ROOTFS_DIR}/etc/systemd/system/"

on_chroot << EOF
    systemctl enable racecapture.service
EOF
