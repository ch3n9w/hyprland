#!/bin/sh

function handle {
  if [[ ${1:0:12} == "monitoradded" ]]; then
    hyprctl dispatch moveworkspacetomonitor "1 DP-4"
    hyprctl dispatch moveworkspacetomonitor "2 DP-4"
    hyprctl dispatch moveworkspacetomonitor "3 DP-4"
    hyprctl dispatch moveworkspacetomonitor "4 DP-4"
    hyprctl dispatch moveworkspacetomonitor "5 DP-4"
    hyprctl dispatch moveworkspacetomonitor "6 DP-4"
    hyprctl dispatch moveworkspacetomonitor "7 DP-4"
    hyprctl dispatch moveworkspacetomonitor "8 DP-4"
    hyprctl dispatch moveworkspacetomonitor "9 DP-4"
  fi
}

socat - UNIX-CONNECT:/tmp/hypr/.socket2.sock | while read line; do handle $line; done
