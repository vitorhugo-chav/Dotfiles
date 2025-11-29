#!/usr/bin/env bash

# Theme configuration
theme="$HOME/.config/rofi/powermenu.rasi"

# Options with icons (Nerd Fonts)
shutdown=" Shutdown"
reboot=" Reboot"
lock=" Lock"
suspend=" Suspend"
logout=" Logout"

# Confirmation
yes=' Yes'
no=' No'

# Build the options list
options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

# Open Rofi and capture the choice
chosen="$(echo -e "$options" | rofi -dmenu -p "Session" -theme "${theme}")"

# Execution logic
case ${chosen} in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        # Adjust here for your locker (hyprlock or swaylock)
        hyprlock || swaylock
        ;;
    $suspend)
        systemctl suspend
        ;;
    $logout)
        hyprctl dispatch exit
        ;;
esac