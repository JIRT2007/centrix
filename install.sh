#!/bin/bash
clear
cat << "EOF"

    ██████╗███████╗███╗   ██╗████████╗██████╗ ██╗██╗  ██╗
   ██╔════╝██╔════╝████╗  ██║╚══██╔══╝██╔══██╗██║╚██╗██╔╝
   ██║     █████╗  ██╔██╗ ██║   ██║   ██████╔╝██║ ╚███╔╝ 
   ██║     ██╔══╝  ██║╚██╗██║   ██║   ██╔══██╗██║ ██╔██╗ 
   ╚██████╗███████╗██║ ╚████║   ██║   ██║  ██║██║██╔╝ ██╗
    ╚═════╝╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝╚═╝╚═╝  ╚═╝     
*----------------------------------------------------------*
| Welcome to Centrix !!                                    |                  
| This is not an operating system, it is a customization   |
| for Debian GNU/Linux and its derivatives,                |
| with Xfce desktop enviroment.                            |
| In tribute to the community and inspired by Loc-OS.      |
|                                                          |
| Developed by JIRT2007.                                   |
*----------------------------------------------------------*
| [y] INSTALL Centrix.                                     |
| [n] EXIT.                                                |
*----------------------------------------------------------*
EOF

read -p "Enter your order: " optionMAIN
case $optionMAIN in

	[yY])
	    mkdir -p $HOME/.config/alacritty
	    mkdir -p $HOME/.config/fastfetch

	    "$HOME/centrix/SCRIPTS/software.sh"
	    "$HOME/centrix/SCRIPTS/keybindings.sh"
	    "$HOME/centrix/SCRIPTS/desktop.sh"

	    sleep 1
		echo "[INSTALLATION COMPLETE]"
	    sleep 1
		echo "[THE SYSTEM WILL BE RESTART IN 3 SECONDS]"
	    sleep 3
		sudo reboot -h now
	;;

	[nN])
	clear
	exit 0
	;;

	*)
	echo "Order not found."
	sleep 1
	;;
esac
