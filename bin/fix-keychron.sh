#!/bin/bash

sleep 1

echo 0 | tee /sys/module/hid_apple/parameters/fnmode

touch /root/trigger.txt

