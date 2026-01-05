#!/bin/bash

distro=${1:-arch}

if [[ $distro == "arch" ]]; then
	sudo pacman -S tmux
else
	echo $distro
fi

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
