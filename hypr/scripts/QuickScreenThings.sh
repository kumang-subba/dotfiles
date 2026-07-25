#!/bin/bash

editor=nvim
tty=ghostty

dotsDir="$HOME/dotfiles"

menu(){
  printf "1. ScreenShot Region\n"
  printf "2. ScreenShot Window\n"
  printf "3. ScreenShot Display\n"
  printf "4. ScreenRecord Region\n"
  printf "5. ScreenRecord Region + Audio\n"
  printf "6. ScreenRecord Window\n"
  printf "7. ScreenRecord Window + Audio\n"
  printf "8. Color Picker\n"
}

main() {
    choice=$(menu | rofi -i -dmenu -theme ~/.config/rofi/config-screen-things.rasi | cut -d. -f1)
    case $choice in
        1)
            cmd-screenshot
            ;;
        2)
            cmd-screenshot window
            ;;
        3)
            cmd-screenshot output
            ;;
        4)
            cmd-screenrecord region
            ;;
        5)
            cmd-screenrecord region audio
            ;;
        6)
            cmd-screenrecord output
            ;;
        7)
            cmd-screenrecord output audio
            ;;
        8)
            pkill hyprpicker || hyprpicker -a
            ;;
        *)
            ;;
    esac
}

main
