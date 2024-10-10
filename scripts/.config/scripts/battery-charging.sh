#!/bin/sh

iDIR="$HOME/.config/mako/icons"

# Send a notification when the laptop is plugged in/unplugged
# Add the following to /etc/udev/rules.d/60-power.rules (replace USERNAME with your user)

# ACTION=="change", SUBSYSTEM=="power_supply", ATTR{type}=="Mains", ATTR{online}=="0", ENV{DISPLAY}=":0", ENV{XAUTHORITY}="/home/USERNAME/.Xauthority" RUN+="/usr/bin/su USERNAME -c '/home/USERNAME/.local/bin/battery-charging discharging'"
# ACTION=="change", SUBSYSTEM=="power_supply", ATTR{type}=="Mains", ATTR{online}=="1", ENV{DISPLAY}=":0", ENV{XAUTHORITY}="/home/USERNAME/.Xauthority" RUN+="/usr/bin/su USERNAME -c '/home/USERNAME/.local/bin/battery-charging charging'"

export XAUTHORITY=~/.Xauthority
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

CHARGING_FILE=/tmp/batterycharging
DISCHARGING_FILE=/tmp/batterydischarging

BATTERY_STATE=$1
BATTERY_LEVEL=$(acpi -b | grep "Battery 0" | grep -P -o '[0-9]+(?=%)')
# My battery takes a couple of seconds to recognize as charging, so this is a hacky way to deal with it
case "$BATTERY_STATE" in
	"charging") BATTERY_CHARGING="Charging" ; BATTERY_ICON="charging" ;;
	"discharging") BATTERY_CHARGING="Disharging" ; BATTERY_ICON="discharging" ;;
esac

# Send notification if the battery is charging/discharging
# If the battery is charging and has not shown notification yet

if [ "$BATTERY_STATE" = "charging" ] && [ ! -f $CHARGING_FILE ]; then
    notify-send "${BATTERY_CHARGING}" "${BATTERY_LEVEL}% of battery charged." -u normal -i "$iDIR/battery-${BATTERY_ICON}.png" -t 5000 -r 9991
    touch $CHARGING_FILE
    rm $DISCHARGING_FILE
    # If the battery is discharging and has not shown notification yet
elif [ "$BATTERY_STATE" = "discharging" ] && [ ! -f $DISCHARGING_FILE ]; then
    notify-send "${BATTERY_CHARGING}" "${BATTERY_LEVEL}% of battery charged." -u normal -i "$iDIR/battery-${BATTERY_ICON}.png" -t 5000 -r 9991
    touch $DISCHARGING_FILE
    rm $CHARGING_FILE
    fi

# notify-send "${BATTERY_CHARGING}" "${BATTERY_LEVEL}% of battery charged." -u normal -i "$iDIR/battery-${BATTERY_ICON}.png" -t 5000 -r 9991

