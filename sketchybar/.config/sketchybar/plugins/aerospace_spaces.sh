#!/usr/bin/env bash
set -euo pipefail
# Display focused workspaces in sketchybar

# if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
#     sketchybar --set $NAME background.drawing=on
# else
#     sketchybar --set $NAME background.drawing=off
# fi

SPACE_ID="$1"

if [ "${FOCUSED_WORKSPACE:-}" = "$SPACE_ID" ]; then
    sketchybar --set "space.$SPACE_ID" background.drawing=on
else
    sketchybar --set "space.$SPACE_ID" background.drawing=off
fi

# WORKSPACES=$(aerospace list-monitors | sed -E 's/^[0-9]+[[:space:]]+\|[[:space:]]+(.*)/\1/')
#
# get_displays() {
#   while (($#)); do
#     echo "$1"
#     shift
#   done
# }
#
# get_displays "$WORKSPACES"
