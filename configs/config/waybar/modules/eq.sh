#!/bin/sh

set -e

sleep 0.1

readarray -t EQRC < ~/.config/pulse/equalizerrc

EQ_PROFILE=${EQRC[4]}
EQ_ENABLED=${EQRC[5]}
TOOLTIP=""
CLASS=""
if [ $EQ_ENABLED == "1" ]; then
    TOOLTIP="Equalizer is enabled: $EQ_PROFILE"
    CLASS="eq-on"
else
    TOOLTIP="Equalizer is disabled"
    CLASS="eq-off"
fi

echo -n '{ "alt": "'$EQ_PROFILE'", "tooltip": "'$TOOLTIP'", "class": "'$CLASS'" }'

