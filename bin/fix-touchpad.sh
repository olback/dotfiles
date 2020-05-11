# xinput set-prop 9 320 1, 0

#!/bin/bash

device_id=$(xinput | grep MSFT | awk '{print $6}' | rev | cut -c -2 | rev | tail -n 1)
echo "Device ID: $device_id"
prop_id=$(xinput list-props $device_id | grep 'Click Method Enabled (' | awk '{print $5}' | cut -c 2-4)
echo "Prop ID: $prop_id"
xinput set-prop $device_id $prop_id 1, 0
