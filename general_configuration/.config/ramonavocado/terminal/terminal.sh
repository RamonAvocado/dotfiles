TERMINAL="kitty"

# Si hay argumentos, los pasa al terminal como comando
if [ $# -gt 0 ]; then
    exec "$TERMINAL" -e "$@"
else
    exec "$TERMINAL"
fi
