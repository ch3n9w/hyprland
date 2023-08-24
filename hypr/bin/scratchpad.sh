#!/bin/bash

hasspecial=$(hyprctl clients -j | jq -r '.[] | select(.workspace.name=="special:scratchpad")')
if [ -z "$hasspecial" ]; then
  alacritty --class "scratchpad" &
  sleep 0.5
fi
hyprctl dispatch togglespecialworkspace scratchpad 
