#!/bin/bash

echo "[INFO] Add user to Input Group..."
groupadd -aG input $(whoami)

echo " "
echo "[INFO] Install dependencies..."
echo " "

sudo pacman -S --needed - < ./main_packages

if command -v yay &> /dev/null 2>&1
then
    yay -S --needed - < ./aur_packages
elif command -v paru &> /dev/null 2>&1
then
    paru -S --needed - < ./aur_packages
else
    echo "Either paru or yay must be installed"
    exit
fi

echo " "
echo "[INFO] Copying Config Files"
echo " "

/bin/cp -rf .config ~/.config/

echo " "
echo "[INFO] Enabling Services"
echo " "

sudo systemctl enable --now bluetooth
