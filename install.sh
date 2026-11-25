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
| for Debian GNU/Linux and Devuan GNU/Linux with           |
| Xfce desktop enviroment.                                 |
|                                                          |
| Developed by JIRT2007.                                   |
| https://github.com/JIRT2007                              |
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

	    # SELECCIÓN DE DISTRIBUCIÓN DE GNU/LINUX:
	    read -p "[1: Debian/Devuan] [2: ArchLinux] " optionDISTRO
	    case $optionDISTRO in

	    	1) # DEBIAN/DEVUAN:
	    	    "$HOME/centrix/SCRIPTS/software_debian.sh"
	    	;;

    	    	2) # ARCHLINUX:
	    	    "$HOME/centrix/SCRIPTS/software_arch.sh"
	    	;;
	    
    	    	*)
	    	echo "Order not found."
	    	sleep 1
	    	;;

	    esac

	    "$HOME/centrix/SCRIPTS/keybindings.sh"
	    "$HOME/centrix/SCRIPTS/desktop.sh"

	    sleep 1
		echo "[INSTALLATION COMPLETE]"
	    sleep 1
		echo "[THE SYSTEM WILL BE RESTART IN 3 SECONDS]"
	    sleep 3
		sudo reboot
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
