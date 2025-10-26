#!/usr/bin/env bash

if pgrep -xq "com.docker.backend"; then
  sketchybar --set $NAME icon.color=0xff55ff55
else
  sketchybar --set $NAME icon.color=0xff888888
fi
