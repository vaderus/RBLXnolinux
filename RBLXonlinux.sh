#!/bin/sh

#variaveis e funções
DEPLIST_VOID="python3 python3-pip python3-wheel python3-setuptools python3-cairo python3-gobject cairo-devel desktop-file-utils xdg-user-dirs gtk-update-icon-cache shared-mime-info pkg-config gobject-introspection libpulseaudio-32bit freetype-32bit gnutls-32bit libgcc-32bit"

DEPLIST_DEBIAN="git python3-pip python3-setuptools python3-wheel python3-dev pkg-config mesa-utils libcairo2-dev gtk-update-icon-cache desktop-file-utils xdg-utils libgirepository1.0-dev gir1.2-gtk-3.0 gnutls-bin:i386"

INSTALLPKG_VOID() {
	sudo xbps-install $1
}

INSTALLPKG_DEBIAN() {
	sudo apt install $1
}

INSTALL_GRAPEJUICE() {
	git clone --depth=1 https://gitlab.com/brinkervii/grapejuice.git /tmp/grapejuice && python3 /tmp/grapejuice/install.py
}

INSTALL_WINE() {
	wget https://pastebin.com/raw/5SeVb005 -O /tmp/install.py && python3 /tmp/install.py
}

BEMVINDO() {
	read -p "Seja bem vindo ao RBLXonlinux.sh, este shell script irá instalar os programas Grapejuice e Wine em âmbos, Debian e Void Linux, para que seja possível jogar Roblox no Gnu/Linux.
Autor: Vader
License: GPL-3.0 License

Responda, qual distro vocẽ está usando neste computador? (responda com 0 - 1)
0 - Debian (e distros baseadas)
1 - Void Linux (versão glibc)
R: " DISTRO
}

#instalar dependências
clear
while BEMVINDO; do case $DISTRO in
	0)
		INSTALLPKG_DEBIAN $DEPLIST_DEBIAN ;;
	1)
		INSTALLPKG_VOID $DEPLIST_VOID ;;
	*)
		clear && echo "Por Favor, reponda com um número de 0 - 1" && exit 1 ;;
esac done

#instalar grapejuice & wine
clear
if [ ! -x $HOME/.local/bin/grapejuice/grapejuice ]; then
		echo "grapejuice already installed"
	else
      		INSTALL_GRAPEJUICE || error "A instalação do Grapejuice falhou, tente novamente" && exit 1
fi

if [ ! -x $HOME/.local/share/grapejuice/user/wine-download/wine-tkg-staging-fsync-git-7.1.r2.gc437a01e/bin/wine ]; then
		echo "wine already installed"
	else
		INSTALL_WINE || error "A instalação do Wine falhou, tente novamente" && exit 1
fi

#finalização
clear
echo "Obrigado por usar o meu script :). Agora o grapejuice está pronto para ser usado, não se esqueça de abri-lo e editar as fflags ou instalar o dxvk como mostrado no vídeo! -Vader"








