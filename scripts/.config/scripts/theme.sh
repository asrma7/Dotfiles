#!/bin/bash

export PATH="${PATH}:${HOME}/.local/bin/"

CURRENTIMG="$(<~/.cache/wal/wal )"
MODE=""

if [[ -e "${HOME}/.cache/wal/mode" ]]; then
    MODE="$(<~/.cache/wal/mode )"
else
    cd ${HOME}/.cache/wal && touch mode

    set -o noclobber
    echo "dark" >| ${HOME}/.cache/wal/mode

    MODE="dark"
fi

if [[ $MODE = "light" ]]; then

    MODE="dark"

    set -o noclobber
    echo "dark" >| ${HOME}/.cache/wal/mode

    gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
    gsettings set org.gnome.desktop.interface icon-theme "breeze-dark"
    gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

    notify-send "Changed to dark theme!" -u low
else

    MODE="light"

    set -o noclobber
    echo "light" >| ${HOME}/.cache/wal/mode

    gsettings set org.gnome.desktop.interface gtk-theme "Adwaita"
    gsettings set org.gnome.desktop.interface icon-theme "breeze"
    gsettings set org.gnome.desktop.interface color-scheme "prefer-light"

    notify-send "Changed to light theme!" -u low
fi
