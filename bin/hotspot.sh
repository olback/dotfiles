#!/bin/sh

nmcli dev wifi hotspot ifname wlp1s0 ssid $(cat /etc/hostname) password "undefined"

