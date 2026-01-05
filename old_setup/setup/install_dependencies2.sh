#!/usr/bin/env bash
# Smart Arch installer: splits official vs AUR automatically and tries sensible fallbacks

set -euo pipefail

YELLOW="\e[33m"; GREEN="\e[32m"; RED="\e[31m"; RESET="\e[0m"

need_cmd() { command -v "$1" >/dev/null 2>&1; }

echo -e "${YELLOW}:: Syncing package databases and updating...${RESET}"
sudo pacman -Syyu --noconfirm

if ! need_cmd yay; then
  echo -e "${YELLOW}:: Installing yay (AUR helper)...${RESET}"
  sudo pacman -S --needed --noconfirm git base-devel
  tmpdir="$(mktemp -d)"; trap 'rm -rf "$tmpdir"' EXIT
  git clone https://aur.archlinux.org/yay.git "$tmpdir/yay"
  (cd "$tmpdir/yay" && makepkg -si --noconfirm)
fi

# Desired packages (deduped)
WANTED=(
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
  grimblast-git  # known AUR, but resolver will place it correctly
  bibata-cursor-theme pacseek otf-font-awesome
  ttf-fira-sans ttf-fira-code ttf-firacode-nerd
  nwg-dock-hyprland power-profiles-daemon python-pywalfox vlc
)

# Fallbacks for tricky names (checked in this order if not in official repos)
# key = requested name; value = space-separated alternates
declare -A FALLBACKS=(
  [bibata-cursor-theme]="bibata-cursor-theme-bin bibata-cursor-theme"
  [pacseek]="pacseek-bin pacseek"
  [waypaper]="waypaper-bin waypaper"
  [wlogout]="wlogout"
  [python-screeninfo]="python-screeninfo"
  [python-pywalfox]="python-pywalfox pywalfox"
  [grimblast-git]="grimblast-git grimblast"
)

PACMAN_LIST=()
AUR_LIST=()
UNRESOLVED=()

in_official() { pacman -Si --color=never "$1" >/dev/null 2>&1; }
in_aur()      { yay -Si --color=never "$1"     >/dev/null 2>&1; }

resolve_and_bucket() {
  local want="$1"
  # 1) Official repo?
  if in_official "$want"; then PACMAN_LIST+=("$want"); return 0; fi

  # 2) Try fallbacks (first official, then AUR)
  local alts="${FALLBACKS[$want]:-$want}"
  for a in $alts; do
    if in_official "$a"; then PACMAN_LIST+=("$a"); return 0; fi
  done
  for a in $alts; do
    if in_aur "$a"; then AUR_LIST+=("$a"); return 0; fi
  done

  # 3) Last chance: check AUR for the original name
  if in_aur "$want"; then AUR_LIST+=("$want"); return 0; fi

  UNRESOLVED+=("$want")
  return 1
}

echo -e "${YELLOW}:: Resolving packages…${RESET}"
# Filter out already-installed packages early to speed things up
is_installed() { pacman -Q "$1" >/dev/null 2>&1 || yay -Q "$1" >/dev/null 2>&1; }

for pkg in "${WANTED[@]}"; do
  if is_installed "$pkg"; then
    echo -e "${GREEN}✓ Already installed:${RESET} $pkg"
    continue
  fi
  resolve_and_bucket "$pkg" || true
done

# Deduplicate arrays
dedup() {
  awk '!seen[$0]++' <(printf "%s\n" "$@")
}

PACMAN_LIST=($(dedup "${PACMAN_LIST[@]}"))
AUR_LIST=($(dedup "${AUR_LIST[@]}"))
UNRESOLVED=($(dedup "${UNRESOLVED[@]}"))

if ((${#PACMAN_LIST[@]})); then
  echo -e "${YELLOW}:: Installing official repo packages with pacman…${RESET}"
  sudo pacman -S --needed --noconfirm "${PACMAN_LIST[@]}"
fi

if ((${#AUR_LIST[@]})); then
  echo -e "${YELLOW}:: Installing AUR packages with yay…${RESET}"
  yay -S --needed --noconfirm "${AUR_LIST[@]}"
fi

if ((${#UNRESOLVED[@]})); then
  echo -e "${RED}!! Could not find these in repos or AUR (as named):${RESET}"
  printf '  - %s\n' "${UNRESOLVED[@]}"
  echo "You can rename them in the FALLBACKS map or tell me which exact PKGBUILD names to use."
fi

echo -e "${GREEN}:: Done!${RESET}"

