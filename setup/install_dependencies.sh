#!/usr/bin/env bash
# --------------------------------------------------------------
# Arch Linux Dependency Installer
# Installs all required packages for your setup
# --------------------------------------------------------------

set -e  # Exit on error
set -o pipefail

# Colors
GREEN="\e[32m"
YELLOW="\e[33m"
RESET="\e[0m"

echo -e "${YELLOW}:: Updating system...${RESET}"
sudo pacman -Syu --noconfirm

# Check if yay (AUR helper) is installed
if ! command -v yay &>/dev/null; then
    echo -e "${YELLOW}:: yay not found, installing...${RESET}"
    sudo pacman -S --needed --noconfirm git base-devel
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si --noconfirm
    cd -
fi

# --------------------------------------------------------------
# Pacman packages
# --------------------------------------------------------------
PACMAN_PKGS=(
    wget unzip gum rsync git figlet xdg-user-dirs
    hyprland hyprpaper hyprlock hypridle hyprpicker
    xdg-desktop-portal-gtk xdg-desktop-portal-hyprland
    libnotify kitty qt5-wayland qt6-wayland fastfetch eza
    python-pip python-gobject python-screeninfo tumbler
    brightnessctl nm-connection-editor network-manager-applet
    imagemagick jq xclip neovim htop blueman grim slurp
    cliphist nwg-look qt6ct waybar rofi-wayland polkit-gnome
    zsh zsh-completions fzf pavucontrol papirus-icon-theme
    breeze flatpak swaync gvfs wlogout waypaper
    bibata-cursor-theme pacseek otf-font-awesome
    ttf-fira-sans ttf-fira-code ttf-firacode-nerd
    nwg-dock-hyprland power-profiles-daemon python-pywalfox vlc
)

# --------------------------------------------------------------
# AUR packages
# --------------------------------------------------------------
AUR_PKGS=(
    grimblast-git
)

echo -e "${YELLOW}:: Installing packages with pacman...${RESET}"
sudo pacman -S --needed --noconfirm "${PACMAN_PKGS[@]}"

echo -e "${YELLOW}:: Installing AUR packages with yay...${RESET}"
yay -S --needed --noconfirm "${AUR_PKGS[@]}"

echo -e "${GREEN}:: All packages installed successfully!${RESET}"

