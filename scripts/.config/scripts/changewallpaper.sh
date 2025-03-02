#!/bin/bash

# Directory containing wallpapers
wallpaper_dir=~/backgrounds/

# Function to recursively find image files
find_images() {
  find "$1" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif" \)
}

# Check if the wallpaper directory exists and is not empty
if [[ -d $wallpaper_dir && $(find_images "$wallpaper_dir") ]]; then
  # Select a random wallpaper from all image files (including subdirectories)
  random_wallpaper=$(find_images "$wallpaper_dir" | shuf -n 1)

  # Set the wallpaper using swww with transition effects
  swww img "$random_wallpaper" --transition-step 100 --transition-type wipe --transition-angle 30

  . $HOME/.config/mako/update-colors.sh

  echo "Wallpaper set to: $random_wallpaper"
else
  echo "Wallpaper directory is either missing or does not contain any images."
fi
