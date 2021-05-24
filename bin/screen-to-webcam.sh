#/bin/bash

# Base on this section from the Arch Wiki
# https://wiki.archlinux.org/index.php/Screen_capture#Via_a_virtual_webcam_video_feed

# If not already configured, load required kernel module like this:
# modprobe v4l2loopback exclusive_caps=1 card_label=WfRecorder 

MODNAME=v4l2loopbackk

modinfo $MODNAME > /dev/null

if [[ $? != 0 ]]; then
    echo "Loading kernel module $MODNAME"
    sudo modprobe $MODNAME

fi

wf-recorder --muxer=v4l2 --codec=rawvideo --file=/dev/video2 -x yuv420p

