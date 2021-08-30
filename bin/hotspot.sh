#!/bin/sh

nmcli dev wifi hotspot ifname wlp9s0 ssid $(cat /etc/hostname) password "undefined"

