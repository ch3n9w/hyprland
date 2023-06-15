a=$(wl-paste -p | sed ':a;N;$!ba;s/\n/ /g' | node ~/.config/hypr/bin/translate.js)
notify-send "󰊿 Google Translate" "$a"
