#!/bin/bash

cp $HOME/centrix/DESIGN/alacritty.toml .config/alacritty/
cp $HOME/centrix/DESIGN/bashrc $HOME/.bashrc

# WALLPAPER:
WALL=$HOME/centrix/DESIGN/wallpaper.png
for mon in $(xrandr --query | awk '/ connected/{print $1}'); do
  for ws in 0 1 2 3; do
    xfconf-query -c xfce4-desktop -n -t string \
      -p "/backdrop/screen0/monitor${mon}/workspace${ws}/last-image" \
      -s "$WALL"
  done
done

# WORKSPACES:
xfconf-query -c xfwm4 -p /general/scroll_workspaces -s false

# APLICAR PAQUETE DE ICONOS:
xfconf-query -c xsettings -p /Net/IconThemeName -s "Papirus"
xfconf-query -c xsettings -p /Net/ThemeName -s "Adwaita-dark"

# ELEVACION DE VENTANAS:
xfconf-query -c xfwm4 -p /general/focus_model --create -t string -s mouse

# NO ICONOS EN ESCRITORIO:
xfconf-query -c xfce4-desktop -p /desktop-icons/style -t int -s 0 --create

# COMPOSICION DE TITULOS DE VENTANAS:
xfconf-query -c xfwm4 -p /general/title_font --create -t string -s "JetBrains Mono Bold 9"
xfconf-query -c xfwm4 -p /general/title_alignment --create -t string -s "left"
xfconf-query -c xfwm4 -p /general/button_layout -s "|HMC"

# ESTRUCTURAR VENTANAS:
xfconf-query -c xfwm4 -p /general/tile_on_move

# CONFIGURAR PANEL:
xfconf-query -c xfce4-panel -p /panels -t int -s 1 -a
xfconf-query -c xfce4-panel -p /panels/panel-1/position -t string -s "p=10;x=0;y=0"
xfconf-query -c xfce4-panel -p /panels/panel-1/position-locked -t bool -s true
xfconf-query -c xfce4-panel -p /panels/panel-1/size -t int -s 30
xfconf-query -c xfce4-panel -p /panels/panel-1/length -t uint -s 100
xfconf-query -c xfce4-panel -p /panels/panel-1/icon-size -t uint -s 20

xfconf-query -c xfce4-panel -p /panels/panel-1/background-style --create -t int -s 1
xfconf-query -c xfce4-panel -p /panels/panel-1/background-rgba --create -t double -s 0.07451 -t double -s 0.07451 -t double -s 0.10196 -t double -s 1.0

# ASIGNAR ELEMENTOS AL PANEL:
xfconf-query -c xfce4-panel -p /plugins/plugin-1 --create -t string -s whiskermenu
xfconf-query -c xfce4-panel -p /plugins/plugin-2 --create -t string -s tasklist
xfconf-query -c xfce4-panel -p /plugins/plugin-3 --create -t string -s separator
xfconf-query -c xfce4-panel -p /plugins/plugin-4 --create -t string -s pager
xfconf-query -c xfce4-panel -p /plugins/plugin-5 --create -t string -s separator
xfconf-query -c xfce4-panel -p /plugins/plugin-6 --create -t string -s systray
xfconf-query -c xfce4-panel -p /plugins/plugin-7 --create -t string -s separator
xfconf-query -c xfce4-panel -p /plugins/plugin-8 --create -t string -s pulseaudio
xfconf-query -c xfce4-panel -p /plugins/plugin-9 --create -t string -s separator
xfconf-query -c xfce4-panel -p /plugins/plugin-10 --create -t string -s power-manager-plugin
xfconf-query -c xfce4-panel -p /plugins/plugin-11 --create -t string -s separator
xfconf-query -c xfce4-panel -p /plugins/plugin-12 --create -t string -s clock
xfconf-query -c xfce4-panel -p /plugins/plugin-13 --create -t string -s separator

# CONFIGURAR SEPARADORES DEL PANEL:
xfconf-query -c xfce4-panel -p /plugins/plugin-3/style --create -t uint -s 0
xfconf-query -c xfce4-panel -p /plugins/plugin-5/style --create -t uint -s 0
xfconf-query -c xfce4-panel -p /plugins/plugin-7/style --create -t uint -s 0
xfconf-query -c xfce4-panel -p /plugins/plugin-9/style --create -t uint -s 0
xfconf-query -c xfce4-panel -p /plugins/plugin-11/style --create -t uint -s 0
xfconf-query -c xfce4-panel -p /plugins/plugin-13/style --create -t uint -s 0

xfconf-query -c xfce4-panel -p /plugins/plugin-3/expand --create -t bool -s false
xfconf-query -c xfce4-panel -p /plugins/plugin-5/expand --create -t bool -s false
xfconf-query -c xfce4-panel -p /plugins/plugin-7/expand --create -t bool -s false
xfconf-query -c xfce4-panel -p /plugins/plugin-9/expand --create -t bool -s false
xfconf-query -c xfce4-panel -p /plugins/plugin-11/expand --create -t bool -s false
xfconf-query -c xfce4-panel -p /plugins/plugin-13/expand --create -t bool -s false
xfconf-query -c xfce4-panel -p /plugins/plugin-3/expand --create -t bool -s true

# CONFIGURAR ELEMENTOS DEL PANEL:
xfconf-query -c xfce4-panel -p /plugins/plugin-12/digital-layout --create -t uint -s 3
xfconf-query -c xfce4-panel -p /plugins/plugin-12/digital-time-font --create -t string -s "Sans Regular 11"
xfconf-query -c xfce4-panel -p /plugins/plugin-1/position-categories-alternate --create -t bool -s true

# CREAR ELEMENTOS DEL PANEL:
xfconf-query -c xfce4-panel -p /panels/panel-1/plugin-ids --create --force-array \
	-t int -s 1 \
	-t int -s 2 \
	-t int -s 3 \
	-t int -s 4 \
	-t int -s 5 \
	-t int -s 6 \
	-t int -s 7 \
	-t int -s 8 \
	-t int -s 9 \
	-t int -s 10 \
	-t int -s 11 \
	-t int -s 12 \
	-t int -s 13

xfce4-panel -r
