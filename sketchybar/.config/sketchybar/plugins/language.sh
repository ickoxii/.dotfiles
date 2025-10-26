#!/usr/bin/env bash

SOURCE=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleCurrentKeyboardLayoutInputSourceID | tr '.' ' ' | awk '{print $4}')

case "$SOURCE" in
  'US') LABEL="EN" ;;
  'PinyinKeyboard') LABEL="中" ;;
  *) LABEL="$SOURCE" ;;
esac

sketchybar --set $NAME label="$LABEL"
