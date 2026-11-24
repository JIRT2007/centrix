#!/bin/bash

# TERMINAL:
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Alt>q" --create -t string -s "alacritty"

# ESTRUCTURACIÓN DE VENTANAS:
for k in KP_Left KP_Right KP_Up KP_Down KP_Home KP_End KP_Page_Up KP_Next; do
	xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Super>$k" -r 2>/dev/null
done

xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Alt>c" --create -t string -s "close_window_key"
xfconf-query -c xfce4-keyboard-shortcuts -n -p '/xfwm4/custom/<Alt>Left'  -t string -s tile_left_key
xfconf-query -c xfce4-keyboard-shortcuts -n -p '/xfwm4/custom/<Alt>Right' -t string -s tile_right_key
xfconf-query -c xfce4-keyboard-shortcuts -n -p '/xfwm4/custom/<Alt>Up'    -t string -s maximize_window_key

# WHISKERMENU:
xfconf-query -c xfce4-keyboard-shortcuts -p /commands/custom/Super_L --create -t string -s "xfce4-popup-whiskermenu"

# XFCE4-APPFINDER:
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Alt>w" --create -t string -s "xfce4-appfinder"
