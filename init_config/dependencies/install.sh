#!/bin/bash

# Installing tmuxp
sudo pacman -Syu python-pipx
pipx ensurepath
source ~/.bashrc

pipx install tmuxp

###
