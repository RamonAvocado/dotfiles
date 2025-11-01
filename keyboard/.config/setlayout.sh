#!/bin/bash
xkbcli compile-keymap --layout graphite --variant basic \
        --include "$HOME/.config/xkb" --include /usr/share/X11/xkb
