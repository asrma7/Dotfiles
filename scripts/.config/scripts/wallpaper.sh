#!/usr/bin/env bash

# Directory for thumbnails
thumb_dir="$HOME/.cache/wallpapers_thumbs"
mkdir -p "$thumb_dir"

# Generate thumbnails
find ~/backgrounds/ -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif" \) | while read -r wallpaper; do
    thumb="$thumb_dir/$(basename "$wallpaper")"
    # Generate thumbnail if it doesn't exist
    if [ ! -f "$thumb" ]; then
        convert "$wallpaper" -resize 100x100 "$thumb" # Adjust size as needed
    fi
done

declare -A wallpapers

# List wallpapers with thumbnails and additional options
for wallpaper in $(find ~/backgrounds/ -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif" \));
do
    filename=$(basename "$wallpaper")
    filename_no_ext="${filename%.*}"
    # Replace hyphens and underscores with spaces, then capitalize each word
    filename_no_ext=$(echo "$filename_no_ext" | sed 's/[-_]/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2)); print}')
    thumb="$thumb_dir/$filename"
    wallpapers["$filename_no_ext"]="$wallpaper"
    wallpaper_list=$wallpaper_list"$filename_no_ext\0icon\x1f$thumb\n"
done

# Add the "Random" option (no info needed)
wallpaper_list=$(echo -En "Random  \n$wallpaper_list")

# Rofi menu
chosen_wallpaper=$(echo -en "$wallpaper_list" | rofi -dmenu -i -selected-row 0 -p "Wallpaper" -config ~/.config/rofi/wallpaper.rasi -show-icons)

if [ -z "$chosen_wallpaper" ]; then
    exit
fi

# Determine wallpaper based on the chosen item
case "$chosen_wallpaper" in
    "Random  ")
        wallpaper=$(find ~/backgrounds/ -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif" \) | shuf -n 1)
        ;;
    *)
        wallpaper=${wallpapers["$chosen_wallpaper"]}
        ;;
esac

# Set the wallpaper
swww img "$wallpaper" --transition-step 100 --transition-type wipe --transition-angle 30

wal -i "$wallpaper" --cols16

pywalfox update
pywal-discord -t default
# pywal-spicetify Dribbblish

. "$HOME/.config/mako/update-colors.sh"
. "$HOME/.config/spicetify/Themes/Pywal/update-colors.sh"

echo "Wallpaper set to: $wallpaper"

cp $(cat ~/.cache/wal/wal) /usr/share/sddm/themes/sugar-candy/Backgrounds/wallpaper

