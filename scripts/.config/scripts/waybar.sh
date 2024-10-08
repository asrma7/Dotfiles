#!/bin/bash

CONFIG_FILES="$HOME/.config/waybar/config.jsonc $HOME/.config/waybar/style.css $HOME/.cache/wal/colors-waybar.css"

trap "killall waybar" EXIT

while true; do
    waybar -c ~/.config/waybar/config.jsonc -s ~/.config/waybar/style.css &
    inotifywait -e create,modify $CONFIG_FILES
    killall waybar
done
