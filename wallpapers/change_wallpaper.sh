#!/bin/bash

# Carpeta con las imágenes
WALLPAPER_DIR="$HOME/Documents/wallpapers"
# Tiempo en segundos entre cambios
INTERVALO=900  # 15 minutos

# Loop infinito
while true; do
    for imagen in "$WALLPAPER_DIR"/*; do
        # Asegúrate de que es un archivo regular
        [ -f "$imagen" ] || continue

        # Aplica el fondo con wal
        wal -i "$imagen"

        # Espera el intervalo
        sleep "$INTERVALO"
    done
done
