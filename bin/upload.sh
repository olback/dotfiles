#!/bin/bash

set -e

upload () {
    URL="https://tempfiles.ninja/api/upload?filename=$(basename $1)" 
    MIME=$(file --mime-type -b $1) 
    DOWNLOAD_URL=$(curl --data-binary @$1 -X POST -H "Content-Type: $MIME" $URL | jq -r '.download_url') 
    echo $DOWNLOAD_URL
    echo $DOWNLOAD_URL | wl-copy
}

upload $1
notify-send "File uploaded" -i document-open

