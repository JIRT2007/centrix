#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
    exec sudo "$0" "$@"
fi

pacman -Syu

# SOFTWARE A BORRAR:
pacman -R xfce4-notes \
	xarchiver \
	mousepad \
	xfburn \
	xsane \
	nano \
	htop

# SOFTWARE A INSTALAR:
pacman -S xfce4-whiskermenu-plugin \
	xfce4-screenshooter \
	ttf-jetbrains-mono \
	gnome-themes-extra \
	papirus-icon-theme \
	xfce4-appfinder \
	xorg-xrandr \
	keepassxc \
	fastfetch \
	alacritty \
	firefox \
	blueman \
	tmux \
	btop \
	vim

#########################
### GIT CONFIGURATION ###
#########################
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

##################
### FreePASCAL ###
##################
echo ""
read -p "You want to install FreePascal Compiler? [y/n] " optionFPC
    case $optionFPC in
	[yY]) 
	pacman -S fpc
	;;
	
	[nN])
	;;
	
	*) 
	echo "Order not found."
	sleep 1
	;;
    esac
################
### KVM/QEMU ###
################
echo ""
read -p "You want to install KVM/Qemu? [y/n] " optionQEMU
    case $optionQEMU in
	[yY]) 
	pacman -S qemu-full	
	;;
	
	[nN])
	;;
	
	*) 
	echo "Order not found."
	sleep 1
	;;
    esac
###############
### DISCORD ###
###############
echo ""
read -p "You want to install Discord? [y/n] " optionDISCORD
    case $optionDISCORD in
	[yY])
	pacman -S discord		
	;;
	
	[nN])
	;;
	
	*)
	echo "Order not found."
	sleep 1
	;;
    esac

###############
### SPOTIFY ###
###############
echo ""
read -p "You want to install Spotify? [y/n] " optionSPOTIFY
    case $optionSPOTIFY in
	[yY])
	pacman -S spotify-launcher
	;;
	
	[nN])
	;;
	
	*) 
	echo "Order not found."
	sleep 1
	;;
    esac

################
### OBSIDIAN ###
################
echo ""
read -p "You want to install Obsidian? [y/n] " optionOBSIDIAN
    case $optionOBSIDIAN in
	[yY])
	pacman -S obsidian
	;;

	[nN])
	;;

	*)
	echo "Order not found."
	sleep 1
	;;
esac
