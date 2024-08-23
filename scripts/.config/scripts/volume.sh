#!/bin/bash

iDIR="$HOME/.config/mako/icons"

# Get Volume
get_volume() {
    volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}' | tr -d '.' | sed 's/^0*//')
    muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $3}' | tr -d '[]')
    if [ -n "$muted" ]; then
        volume=$muted
    elif [ -z "$volume" ]; then
        volume=0
    fi
    echo "$volume"
}

# Get icons
get_icon() {
	current=$(get_volume)
	if [[ "$current" -eq "0" ]]; then
		echo "$iDIR/volume-mute.png"
	elif [[ ("$current" -ge "0") && ("$current" -le "30") ]]; then
		echo "$iDIR/volume-low.png"
	elif [[ ("$current" -ge "30") && ("$current" -le "60") ]]; then
		echo "$iDIR/volume-mid.png"
	elif [[ ("$current" -ge "60") && ("$current" -le "100") ]]; then
		echo "$iDIR/volume-high.png"
	fi
}

# Notify
notify_user() {
	notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$(get_icon)" "Volume : $(get_volume)"
}

# Increase Volume
inc_volume() {
	wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+ && notify_user
}

# Decrease Volume
dec_volume() {
	wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && notify_user
}

# Toggle Mute
toggle_mute() {
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && notify_user
}

# Toggle Mic
toggle_mic() {
    wpctl set-mute @DEFAULT_SOURCE@ toggle
}

# Execute accordingly
if [[ "$1" == "--get" ]]; then
	get_volume
elif [[ "$1" == "--inc" ]]; then
	inc_volume
elif [[ "$1" == "--dec" ]]; then
	dec_volume
elif [[ "$1" == "--toggle" ]]; then
	toggle_mute
elif [[ "$1" == "--toggle-mic" ]]; then
	toggle_mic
elif [[ "$1" == "--get-icon" ]]; then
	get_icon
else
	get_volume
fi
