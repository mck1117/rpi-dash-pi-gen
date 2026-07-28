#!/bin/bash -e

install -m 644 files/80-can.network "${ROOTFS_DIR}/etc/systemd/network/"
install -m 644 files/80-can-hotplug.rules "${ROOTFS_DIR}/etc/udev/rules.d/"

on_chroot << EOF
    systemctl enable systemd-networkd

    systemctl disable NetworkManager-wait-online.service
EOF
