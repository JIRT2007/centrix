#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
    exec sudo "$0" "$@"
fi

apt update
apt upgrade -y

# SOFTWARE A BORRAR:
apt purge -y debian-reference- \
	libreoffice-* \
	quodlibet \
	xarchiver \
	synaptic \
	exfalso \
	xfburn \
	xterm \
	xsane \
	nano \
	lynx

apt autoremove -y

# SOFTWARE A INSTALAR:
apt install -y xfce4-whiskermenu-plugin \
	xfce4-screenshooter \
	fonts-jetbrains-mono \
	papirus-icon-theme \
	keepassxc \
	fastfetch \
	alacritty \
	blueman \
	tmux \
	curl \
	wget \
	btop \
	vim

##################
### FreePASCAL ###
##################
echo ""
read -p "You want to install FreePascal Compiler? [y/n] " optionFPC
    case $optionFPC in
	[yY]) 
	apt install -y fpc
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
	apt install -y qemu-system-x86
	mkdir -p ISOs/VMs
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
	wget -O discord.deb "https://discord.com/api/download?platform=linux&format=deb"
	apt install -y ./discord.deb
	rm discord.deb
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
	curl -sS https://download.spotify.com/debian/pubkey_5384CE82BA52C83A.asc | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
	echo "deb https://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
	apt update && apt upgrade && apt install -y spotify-client
	;;
	
	[nN])
	;;
	
	*) 
	echo "Order not found."
	sleep 1
	;;
    esac

################
### VSCODIUM ###
################
echo ""
read -p "You want to install VSCodium? [y/n] " optionVSCODIUM
    case $optionVSCODIUM in
	[yY])
	VSCODIUM=$(curl -s https://api.github.com/repos/vscodium/vscodium/releases/latest | grep -Po '"tag_name": "\K[^"]*')
	wget -O vscodium.deb "https://github.com/VSCodium/vscodium/releases/download/${VSCODIUM}/codium_${VSCODIUM}_amd64.deb"
	apt install -y ./vscodium.deb
	rm vscodium.deb
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
	OBSIDIAN=$(curl -s https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest | grep -Po '"tag_name": "v\K[^"]*')
	wget -O obsidian.deb "https://github.com/obsidianmd/obsidian-releases/releases/latest/download/obsidian_${OBSIDIAN}_amd64.deb"
	apt install -y ./obsidian.deb
	rm obsidian.deb
	;;

	[nN])
	;;

	*)
	echo "Order not found."
	sleep 1
	;;
esac
