rm -r hypr waybar zathura rofi dunst swaylock 
cp -r ~/.config/hypr ./
cp -r ~/.config/swaylock ./
cp -r ~/.config/waybar ./
rm ./waybar/bin/forest
rm ./waybar/config.hypr
rm ./waybar/style.css.sway
rm ./waybar/config.sway
cp -r ~/.config/zathura ./
cp -r ~/.config/rofi ./
cp -r ~/.config/dunst ./


