#!/usr/bin/env bash

# --- CONFIGURACIÓN ---
# Salir si algún comando falla
set -e

echo "🔍 Comprobando distribución..."

# --- DETECCIÓN DE DISTRO ---
if ! command -v pacman &> /dev/null; then
    echo "❌ Este script está pensado para Arch Linux (usa pacman)."
    exit 1
fi

echo "✅ Arch Linux detectado."

# --- FUNCIÓN PARA INSTALAR SI FALTA ---
install_if_missing() {
    local pkg=$1
    if ! pacman -Qi "$pkg" &> /dev/null; then
        echo "📦 Instalando $pkg..."
        sudo pacman -S --needed --noconfirm "$pkg"
    else
        echo "✔️ $pkg ya está instalado."
    fi
}

test_yay_or_paru() {
    local pkg=$1
    if command -v yay &> /dev/null; then
        yay -S --noconfirm $pkg
    elif command -v paru &> /dev/null; then
        paru -S --noconfirm $pkg
    else
        echo "⚠️ No se encontró un ayudante AUR (yay o paru)."
        echo "Instálalo manualmente con:"
        echo "   git clone https://aur.archlinux.org/zen-browser-bin.git"
        echo "   cd zen-browser-bin && makepkg -si"
    fi
}


# --- INSTALAR STOW ---
install_if_missing stow
install_if_missing swww
install_if_missing kitty
install_if_missing obsidian

# --- INSTALAR ZEN-BROWSER ---
# Zen Browser no está en los repos oficiales, pero sí en AUR.
# Intentamos instalarlo si existe 'yay' o 'paru', o damos instrucción manual.

if ! command -v zen-browser &> /dev/null; then
    echo "🌐 Instalando Zen Browser..."
    test_yay_or_paru zen-browser-bin
else
    echo "✔️ Zen Browser ya está instalado."
fi

if ! command -v nvim&> /dev/null; then
    echo "🌐 Instalando Nvim..."
    test_yay_or_paru neovim
else
    echo "✔️ Nvim ya está instalado."
fi

echo ""
echo "🎉 Instalación completada. Puedes usar 'stow' para gestionar tus dotfiles."

