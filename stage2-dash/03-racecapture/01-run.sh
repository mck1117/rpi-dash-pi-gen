#!/bin/bash -e

dpkg-deb -x files/racecapture_linux_raspberrypi_2.17.1.deb ${ROOTFS_DIR}

install -m 644 files/racecapture.service "${ROOTFS_DIR}/etc/systemd/system/"

on_chroot << EOF
    systemctl enable racecapture.service
EOF
