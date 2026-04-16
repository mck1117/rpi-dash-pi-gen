# remove stuff we don't need

on_chroot << EOF
    apt remove modemmanager avahi* bluez* wpasupplicant cloud-init -y
EOF
