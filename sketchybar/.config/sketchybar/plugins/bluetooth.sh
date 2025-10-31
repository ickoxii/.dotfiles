#!/usr/bin/env bash
set -euo pipefail
# system_profiler -json SPBluetoothDataType
# use jq to parse if connected or not?
# dropdown menu to show all connected and unconnected but known devices
# TODO:
#  - [ ] add list of unconnected
#  - [ ] give functionality to buttons
#  - [ ] create border and stuff like that

DATA=$(system_profiler -json SPBluetoothDataType)
STATUS=$(echo ${DATA} | jq -r '.SPBluetoothDataType[0].controller_properties.controller_state')
CONNECTED=$(echo ${DATA} | jq -r '.SPBluetoothDataType[0].device_connected[] | keys[]')
UNCONNECTED=$(echo ${DATA} | jq -r '.SPBluetoothDataType[0].device_not_connected[] | keys[]')

if [[ "$STATUS" == "attrib_on" ]]; then
  if [[ -n "$CONNECTED" ]]; then
    sketchybar --remove '/bluetooth\.device\.*/' >/dev/null 2>&1
    sketchybar --set "$NAME" icon.color=0xffffffff

    INDEX=0
    while IFS= read -r DEVICE; do
      [[ -z "$DEVICE" ]] && continue
      sketchybar --add item "bluetooth.device.$INDEX" popup."$NAME" \
                 --set "bluetooth.device.$INDEX" label="$DEVICE" \
                 icon="󰂯" icon.color=0xffffffff
      ((INDEX++))
    done <<< "$CONNECTED"

    # 👇 This line is what makes click toggling work
    sketchybar --set "$NAME" popup.drawing=off
  else
    sketchybar --set "$NAME" icon.color=0xffffffff popup.drawing=off
  fi
elif [[ "$STATUS" == "attrib_off" ]]; then
  sketchybar --set "$NAME" icon.color=0xff888888 popup.drawing=off
else
  sketchybar --set "$NAME" icon.color=0xffcccc00 popup.drawing=off
fi
