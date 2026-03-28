#!/bin/bash -e

RC_PACKAGE=files/racecapture_linux_raspberrypi_2.17.1.deb

if [ ! -f ${RC_PACKAGE} ]; then
    wget `curl -s 'https://podium.live/api/v1/applications/1/latest.json?expand=1&platform=rpi' | jq -r .release.url` -O "$RC_PACKAGE"
fi

dpkg-deb -x $RC_PACKAGE ${ROOTFS_DIR}

install -m 644 files/run_racecapture_wrapper.sh "${ROOTFS_DIR}/opt/racecapture/"
install -m 644 files/racecapture.service "${ROOTFS_DIR}/etc/systemd/system/"

on_chroot << EOF
    chmod +x /opt/racecapture/run_racecapture_wrapper.sh
    systemctl enable racecapture.service
EOF
