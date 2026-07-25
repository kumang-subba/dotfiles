#!/bin/bash

editor=nvim
tty=ghostty

hyprConfigs="$HOME/.config/hypr"

menu(){
  printf "1. View Env-variables\n"
  printf "2. View Bindings\n"
  printf "3. View Window Rules\n"
  printf "4. View Tiling Binds\n"
  printf "5. View Monitors\n"
  printf "6. View Input\n"
  printf "7. View Look and feel\n"
}

main() {
    choice=$(menu | rofi -i -dmenu -theme ~/.config/rofi/config-hyprland.rasi | cut -d. -f1)
    case $choice in
        1)
            $tty -e $editor "$hyprConfigs/envs.conf"
            ;;
        2)
            $tty -e $editor "$hyprConfigs/bindings.conf"
            ;;
        3)
            $tty -e $editor "$hyprConfigs/windowrules.conf"
            ;;
        4)
            $tty -e $editor "$hyprConfigs/bindings/tiling.conf"
            ;;
        5)
            $tty -e $editor "$hyprConfigs/monitors.conf"
            ;;
        6)
            $tty -e $editor "$hyprConfigs/input.conf"
            ;;
        7)
            $tty -e $editor "$hyprConfigs/looknfeel.conf"
            ;;
        *)
            ;;
    esac
}

main
