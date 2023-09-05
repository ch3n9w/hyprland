#!/bin/bash

current_workspace=$(hyprctl activewindow | grep "workspace: " | cut -d' ' -f2)
current_monitor=$(hyprctl monitors -j | jq -r '.[] | select(.focused==true).name')
current_monitor_ws=($(hyprctl workspaces -j | jq -r ".[] | select(.monitor==\"$current_monitor\") | select(.name!=\"special\") | .name"))
current_ws=$(hyprctl monitors -j | jq -r '.[] | select(.focused==true) | .activeWorkspace | .name')
echo $current_ws

length=${#current_monitor_ws[@]}
current_monitor_sorted_ws=($(for element in "${current_monitor_ws[@]}"; do echo "$element"; done | sort -n))
echo $current_monitor_sorted_ws
next_ws=0
case $1 in
  Left)
    for((i=0;i<$length;i++)) do
      ws=${current_monitor_sorted_ws[$i]}
      if [ $ws -eq $current_ws ]
      then
        if [ $i -eq 0 ]
        then
          next_ws_index=$((${#current_monitor_sorted_ws[@]}-1))
          next_ws=${current_monitor_sorted_ws[next_ws_index]}
          break
          else
          next_ws_index=$(($i-1))
          next_ws=${current_monitor_sorted_ws[next_ws_index]}
        fi
      fi
    done
    if [ $next_ws -eq $current_ws ]
    then
      exit
    fi
    echo $next_ws
    hyprctl dispatch workspace $next_ws
    ;;
  Right)
    for((i=0;i<$length;i++)) do
      ws=${current_monitor_sorted_ws[$i]}
      if [ $ws -eq $current_ws ]
      then
        last_index=$(($length-1))
        if [ $i = $last_index ]
        then
          next_ws_index=0
          next_ws=${current_monitor_sorted_ws[next_ws_index]}
          break
        else
          next_ws_index=$(($i+1))
          next_ws=${current_monitor_sorted_ws[next_ws_index]}
        fi
      fi
    done
    if [ $next_ws -eq $current_ws ]
    then
      exit
    fi
    echo $next_ws
    hyprctl dispatch workspace $next_ws
    ;;
esac
