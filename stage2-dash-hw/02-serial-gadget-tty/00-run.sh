#!/bin/bash -e

# enable serial tty
on_chroot << EOF
    systemctl enable getty@ttyGS0.service
EOF

# enable autologin on serial tty
mkdir -p "${ROOTFS_DIR}/etc/systemd/system/getty@ttyGS0.service.d/"
install -v files/autologin.conf "${ROOTFS_DIR}/etc/systemd/system/getty@ttyGS0.service.d/"
