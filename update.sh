rm -r hypr waybar rofi dunst swaylock applications
cp -r ~/.config/hypr ./
cp -r ~/.config/swaylock ./
cp -r ~/.config/waybar ./
rm ./waybar/bin/forest
cp -r ~/.config/rofi ./
cp -r ~/.config/dunst ./
cp -r ~/.local/share/applications ./
