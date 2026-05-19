#!/bin/bash

echo "[INFO] Add user to Input Group..."
groupadd -aG input $(whoami)

echo " "
echo "[INFO] Install dependencies..."
echo " "

sudo pacman -S hyprpolkitagent hyprlock awww hypridle waybar nwg-displays matugen cava fastfetch rofi swaync "swaync 0.12" wlogout nm-applet bluez bluez-utils blueman btop

echo " "
echo "[INFO] Copying Config Files"
echo " "

cp -rf .config ~/.config

echo " "
echo "[INFO] Enabling Services"
echo " "

sudo systemctl enable --now bluetooth
