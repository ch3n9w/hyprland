#!/bin/bash

hasspecial=$(hyprctl clients -j | jq -r '.[] | select(.workspace.name=="special")')
if [ -z "$hasspecial" ]; then
  alacritty --class "scratchpad" &
  sleep 0.5
else
  hyprctl dispatch togglespecialworkspace
fi
