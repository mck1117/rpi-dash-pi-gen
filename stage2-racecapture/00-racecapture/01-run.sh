#!/bin/bash -e

RC_PACKAGE=files/racecapture_linux_raspberrypi_2.17.1.deb

if [ ! -f ${RC_PACKAGE} ]; then
    wget -O "$RC_PACKAGE" https://autosportlabs-software.s3.us-west-2.amazonaws.com/racecapture_linux_raspberrypi_2.17.1.deb
fi

dpkg-deb -x $RC_PACKAGE ${ROOTFS_DIR}

install -m 644 files/run_racecapture_wrapper.sh "${ROOTFS_DIR}/opt/racecapture/"
install -m 644 files/racecapture.service "${ROOTFS_DIR}/etc/systemd/system/"

on_chroot << EOF
    chmod +x /opt/racecapture/run_racecapture_wrapper.sh
    systemctl enable racecapture.service
EOF
