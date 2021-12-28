#!/bin/bash

kill -9 $(ps aux | grep /usr/bin/gammastep | head -1 | awk '{print $2}')

/usr/bin/gammastep -c $HOME/.config/gammastep/config.ini

