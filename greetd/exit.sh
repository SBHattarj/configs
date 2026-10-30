#!/usr/bin/env zsh

command=$(echo "Poweroff\nReboot" | rofi -config /etc/greetd/rofi-config.rasi -cache-dir /etc/greetd/.rofi-cache -dmenu -p "What do you do?")
if [[ "$command" == "Poweroff" ]]; then
    systemctl poweroff
fi
if [[ "$command" == "Reboot" ]]; then
    systemctl reboot
fi
