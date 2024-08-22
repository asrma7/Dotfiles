#!/bin/sh

# This script is used to generate the dot file for the given input

# Check if the input is provided
if [ $# -ne 1 ]; then
    echo "Usage: ndot <program_name>"
    exit 1
fi

mkdir -p ~/Dotfiles/$1/.config/$1
cd ~/Dotfiles/$1/.config/$1

nvim .
