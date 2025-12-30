#!/bin/bash

cd /opt/racecapture
LD_PRELOAD=/usr/lib/aarch64-linux-gnu/libmount.so.1 ./race_capture -c graphics:show_cursor:0 -a -m cursor -c kivy:keyboard_mode:systemandmulti -c graphics:rotation:90
