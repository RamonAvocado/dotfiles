#! /bin/bash

sudo pacman -Sy docker
sudo pacman -Sy docker-compose

sudo systemctl enable docker
