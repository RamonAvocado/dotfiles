#!/usr/bin/env bash
# window-source-picker.sh — Cambia la línea "source =" en window.conf
# Uso:
#   window-source-picker.sh             # menú y reemplaza source=
#   window-source-picker.sh --no-reload # no recarga Hyprland
#
# Requiere: sed (GNU). Opcional: fzf o rofi o gum para el picker.

set -euo pipefail

# --- rutas ---
WINDOWS_DIR="$HOME/.config/hypr/conf/windows"
TARGET_CONF="$HOME/.config/hypr/conf/window.conf"

RELOAD=1
if [[ "${1-}" == "--no-reload" ]]; then
  RELOAD=0
fi

# --- comprobaciones ---
if [[ ! -d "$WINDOWS_DIR" ]]; then
  echo "✖ No existe: $WINDOWS_DIR"
  exit 1
fi
if [[ ! -f "$TARGET_CONF" ]]; then
  echo "✖ No existe: $TARGET_CONF"
  exit 1
fi

mapfile -t CHOICES < <(find "$WINDOWS_DIR" -maxdepth 1 -type f -name '*.conf' -printf '%f\n' | sort)
if [[ "${#CHOICES[@]}" -eq 0 ]]; then
  echo "✖ No hay *.conf en $WINDOWS_DIR"
  exit 1
fi

# --- pickers ---
pick_with_fzf()   { printf '%s\n' "${CHOICES[@]}" | fzf --prompt="Ventanas > " --height=40% --reverse; }
pick_with_rofi()  { printf '%s\n' "${CHOICES[@]}" | rofi -dmenu -p "Ventanas"; }
pick_with_gum()   { gum choose "${CHOICES[@]}"; }
pick_with_select(){
  echo "Elige una opción y pulsa Enter:"
  select sel in "${CHOICES[@]}"; do
    [[ -n "${sel-}" ]] && { echo "$sel"; break; }
  done
}

SELECTION=""
if command -v fzf >/dev/null 2>&1; then
  SELECTION="$(pick_with_fzf || true)"
elif command -v rofi >/dev/null 2>&1; then
  SELECTION="$(pick_with_rofi || true)"
elif command -v gum >/dev/null 2>&1; then
  SELECTION="$(pick_with_gum || true)"
else
  SELECTION="$(pick_with_select || true)"
fi

[[ -z "$SELECTION" ]] && { echo "⚠ Cancelado."; exit 0; }

CHOSEN="$WINDOWS_DIR/$SELECTION"

if [[ ! -f "$CHOSEN" ]]; then
  echo "✖ Selección inválida: $CHOSEN"
  exit 1
fi

# Sustituye /home/<usuario> por ~ en la ruta
ABS_CHOSEN="$(readlink -f -- "$CHOSEN")"
RELATIVE_HOME="${ABS_CHOSEN/#$HOME/~}"

# --- backup seguro ---
TS="$(date +%Y%m%d-%H%M%S)"
cp -f -- "$TARGET_CONF" "$TARGET_CONF.$TS.bak"
echo "• Backup: $TARGET_CONF.$TS.bak"

# --- reemplazo de la línea source ---
# Coincide con: (espacios opcionales) source (espacios) = (espacios) lo-que-sea
# y lo sustituye por: source = <ABS_CHOSEN>
# Nota: usamos | como delimitador para evitar escapar / en la ruta.
if grep -Eq '^\s*source\s*=\s*.*$' "$TARGET_CONF"; then
  sed -i "s|^\s*source\s*=\s*.*$|source = $RELATIVE_HOME|" "$TARGET_CONF"
else
  # Si no había línea source, la añadimos al final
  printf '\nsource = %s\n' "$RELATIVE_HOME" >> "$TARGET_CONF"
fi

echo "✓ Actualizado: source = $RELATIVE_HOME"

# --- recarga Hyprland ---
if (( RELOAD )); then
  if command -v hyprctl >/dev/null 2>&1; then
    if hyprctl reload >/dev/null 2>&1; then
      echo "↻ Hyprland recargado."
    else
      echo "⚠ No se pudo recargar Hyprland (hyprctl falló)."
    fi
  else
    echo "ℹ hyprctl no encontrado; recarga manual si es necesario."
  fi
fi

