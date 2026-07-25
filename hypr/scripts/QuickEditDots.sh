#!/bin/bash

editor=nvim
tty=ghostty

dotsDir="$HOME/dotfiles"

menu(){
  printf "1.   Alacritty\n"
  printf "2.   Starship\n"
  printf "3.   Tmux\n"
  printf "4. 󰰷  Zsh\n"
  printf "5.   Nvim\n"
}

main() {
    choice=$(menu | rofi -i -dmenu -theme ~/.config/rofi/config-dots.rasi | cut -d. -f1)
    case $choice in
        1)
            $tty -e $editor "$dotsDir/alacritty/alacritty.toml"
            ;;
        2)
            $tty -e $editor "$dotsDir/starship/starship.toml"
            ;;
        3)
            $tty -e $editor "$dotsDir/tmux/tmux.conf"
            ;;
        4)
            $tty -e $editor "$dotsDir/zsh/.zshrc"
            ;;
        5)
            $tty -e $editor "~/.config/nvim/init.lua"
            ;;
        *)
            ;;
    esac
}

main
