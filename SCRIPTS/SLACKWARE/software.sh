#!/bin/bash

# EJECUCION DE SCRIPT COMO ROOT:
if [ "$(id -u)" -ne 0 ]; then
    echo "This script requires root privileges."
    exec su -c "exec bash $(printf '%q' "$0") $(printf '%q ' "$@")"
fi

########################################
### PROGRAMAS REPOSITORIOS SLACKWARE ###
########################################

# ACTUALIZAR SISTEMA:
slackpkg update && slackpkg upgrade-all

# ELIMINAR PROGRAMAS:
slackpkg remove \
	links \
	lynx \
	nano \
	htop

# INSTALAR PROGRAMAS:
slackpkg install \
	firefox \
	blueman \
	tmux

slackpkg upgrade mozilla-nss


###################
### DIRECTORIOS ###
###################

# GENERAR DIRECTORIOS PROGRAMAS:
mkdir -p $HOME/slackbuilds/papirus
mkdir -p $HOME/slackbuilds/keepassxc
mkdir -p $HOME/slackbuilds/jetbrains
mkdir -p $HOME/slackbuilds/btop

# GENERAR DIRECTORIOS DEPENDENCIAS:
mkdir -p $HOME/slackbuilds/libminizip
mkdir -p $HOME/slackbuilds/botan


####################
### DEPENDENCIAS ###
####################

# DESCARGAR SLACKBUILD:
wget -P $HOME/slackbuilds/libminizip/ https://slackbuilds.org/slackbuilds/15.0/libraries/libminizip.tar.gz
wget -P $HOME/slackbuilds/botan/ https://slackbuilds.org/slackbuilds/15.0/libraries/Botan.tar.gz


# DESCOMPRIMIR SLACKBUILD:
tar -xvf $HOME/slackbuilds/libminizip/libminizip.tar.gz -C $HOME/slackbuilds/libminizip/
tar -xvf $HOME/slackbuilds/botan/Botan.tar.gz -C $HOME/slackbuilds/botan/


# DESCARGAR CODIGO FUENTE:
wget -P $HOME/slackbuilds/libminizip/libminizip/ https://github.com/madler/zlib/releases/download/v1.2.13/zlib-1.2.13.tar.xz
wget -P $HOME/slackbuilds/botan/Botan/ https://botan.randombit.net/releases/Botan-3.14.1.tar.xz


# PERMISOS:
chmod +x $HOME/slackbuilds/libminizip/libminizip/libminizip.SlackBuild
chmod +x $HOME/slackbuilds/botan/Botan/Botan.SlackBuild


# COMPILAR SLACKBUILD:
bash $HOME/slackbuilds/libminizip/libminizip/libminizip.SlackBuild
bash $HOME/slackbuilds/botan/Botan/Botan.SlackBuild


# INSTALAR SLACKBUILD:
installpkg /tmp/libminizip-1.2.13-x86_64-1_SBo.tgz
installpkg /tmp/Botan-3.14.1-x86_64-1_SBo.tgz


############################
### PROGRAMAS SLACKBUILD ###
############################

# DESCARGAR SLACKBUILD:
wget -P $HOME/slackbuilds/papirus https://slackbuilds.org/slackbuilds/15.0/desktop/papirus-icon-theme.tar.gz
wget -P $HOME/slackbuilds/keepassxc/ https://slackbuilds.org/slackbuilds/15.0/office/keepassxc.tar.gz
wget -P $HOME/slackbuilds/jetbrains/ https://slackbuilds.org/slackbuilds/15.0/system/ttf-nerd-fonts-jetbrains-mono.tar.gz
wget -P $HOME/slackbuilds/btop/ https://slackbuilds.org/slackbuilds/15.0/system/btop.tar.gz

# DESCOMPRIMIR SLACKBUILD:
tar -xvf $HOME/slackbuilds/papirus/papirus-icon-theme.tar.gz -C $HOME/slackbuilds/papirus/
tar -xvf $HOME/slackbuilds/keepassxc/keepassxc.tar.gz -C $HOME/slackbuilds/keepassxc/
tar -xvf $HOME/slackbuilds/jetbrains/ttf-nerd-fonts-jetbrains-mono.tar.gz -C $HOME/slackbuilds/jetbrains/
tar -xvf $HOME/slackbuilds/btop/btop.tar.gz -C $HOME/slackbuilds/btop/

# DESCARGAR CODIGO FUENTE:
wget -P $HOME/slackbuilds/papirus/papirus-icon-theme https://github.com/PapirusDevelopmentTeam/papirus-icon-theme/archive/20260801/papirus-icon-theme-20260801.tar.gz
wget -P $HOME/slackbuilds/keepassxc/keepassxc/ https://github.com/keepassxreboot/keepassxc/releases/download/2.7.12/keepassxc-2.7.12-src.tar.xz
wget -P $HOME/slackbuilds/jetbrains/ttf-nerd-fonts-jetbrains-mono/ https://github.com/ryanoasis/nerd-fonts/releases/download/v3.5.1/JetBrainsMono.tar.xz
wget -P $HOME/slackbuilds/btop/btop/ https://github.com/aristocratos/btop/archive/v1.4.4/btop-1.4.4.tar.gz


# PERSMISOS:
chmod +x $HOME/slackbuilds/papirus/papirus-icon-theme/papirus-icon-theme.SlackBuild
chmod +x $HOME/slackbuilds/keepassxc/keepassxc/keepassxc.SlackBuild
chmod +x $HOME/slackbuilds/jetbrains/ttf-nerd-fonts-jetbrains-mono/ttf-nerd-fonts-jetbrains-mono.SlackBuild
chmod +x $HOME/slackbuilds/btop/btop/btop.SlackBuild

# COMPILAR SLACKBUILD:
bash $HOME/slackbuilds/papirus/papirus-icon-theme/papirus-icon-theme.SlackBuild
bash $HOME/slackbuilds/keepassxc/keepassxc/keepassxc.SlackBuild
bash $HOME/slackbuilds/jetbrains/ttf-nerd-fonts-jetbrains-mono/ttf-nerd-fonts-jetbrains-mono.SlackBuild
bash $HOME/slackbuilds/btop/btop/btop.SlackBuild

# INSTALAR SLACKBUILD:
installpkg /tmp/papirus-icon-theme-20260801-noarch-1_SBo.tgz
installpkg /tmp/keepassxc-2.7.12-x86_64-1_SBo.tgz
installpkg /tmp/ttf-nerd-fonts-jetbrains-mono-3.5.1-noarch-1_SBo.tgz
installpkg /tmp/btop-1.4.4-x86_64-1_SBo.tgz
