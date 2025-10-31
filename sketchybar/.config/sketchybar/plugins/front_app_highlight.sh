#!/usr/bin/env bash
set -euo pipefail
# https://coolors.co/palette/231942-5e548e-9f86c0-be95c4-e0b1cb

# Query current workspace from AeroSpace
CURRENT_WORKSPACE=$(aerospace list-workspaces --focused | awk '{print $1}')

# Reset all space icons' backgrounds
for i in {1..10}; do
  sketchybar --set space.$i background.color=0x40333333
done

# Highlight the current workspace icon
if [[ -n "$CURRENT_WORKSPACE" ]]; then
  sketchybar --set space.$CURRENT_WORKSPACE background.color=0xff5E548E
fi
