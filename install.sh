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
| for GNU/Linux with Xfce desktop enviroment.              |
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

	    "$HOME/centrix/SCRIPTS/software.sh"
	    "$HOME/centrix/SCRIPTS/keybindings.sh"
	    "$HOME/centrix/SCRIPTS/desktop.sh"

	    # GIT CONFIGURATION
		echo ""
		read -p "You want to configure Git? [y/n] " optionGIT
		case $optionGIT in
    		    [yY])
        		read -p "Git name: " gitNAME
        		read -p "Git email: " gitEMAIL
	    			echo "[Wait...]"
    	    			sleep 1
    			git config --global user.name "$gitNAME"
    			git config --global user.email "$gitEMAIL"
            			echo "[Done!]"
            			sleep 1
    		     ;;
	
    		     [nN])
    		     ;;

    		     *)
    		     echo "Order not found."
    		     sleep 1
    		     ;;
		esac

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
