#!/bin/bash


rofi_command="rofi -theme .config/qtile/rofi/power/power.rasi"
uptime=$(uptime -p | sed -e 's/up //g')

# Options
shutdown="  "
reboot="  "
lock="  "
suspend="  "
logout="  "

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "UP - $uptime" -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        i3lock
        ;;
    $suspend)
        mpc -q pause
        amixer set Master mute
        systemctl suspend
        ;;
    $logout)
        openbox --exit
        ;;
esac
