#!/bin/bash

wallpaper_dir="$HOME/Pictures/Wallpapers"
playlist="${wallpaper_dir}/wallpapers.m3u"

[[ -d $wallpaper_dir ]] || exit 1

mapfile -d '' -t gifs < <(
  find "$wallpaper_dir" -maxdepth 1 -type f \
    -iname '*.gif' -print0 | sort -z
)

((${#gifs[@]})) || exit 1

monitor=$(hyprctl monitors | awk '/^Monitor/{name=$2} /focused: yes/{print name}')

mpv_running=$(pgrep -x mpvpaper)

choice=$(
  {

    if [[ -n $mpv_running ]]; then
      printf 'Remove GIF Wallpaper\0icon\x1f%s\n' \
        "$HOME/.config/rofi/no_image.png"
    fi

    printf 'All GIFs\0icon\x1f%s\n' \
      "$HOME/.config/rofi/all_imgs.png"

    for gif in "${gifs[@]}"; do
      name=${gif##*/}
      printf '%s\0icon\x1fthumbnail://%s\n' "$name" "$gif"
    done
  } | rofi -dmenu -i -show-icons \
    -p "Wallpaper" \
    -theme "$HOME/.config/rofi/wallpaper.rasi"
)

[[ -n $choice ]] || exit 0

if [[ $choice == "Remove GIF Wallpaper" ]]; then
  pkill mpvpaper
  systemctl --user start change-bg.timer
  exit 0
fi

if [[ $choice == "All GIFs" ]]; then

  printf '%s\n' "${gifs[@]}" >"$playlist"

  options="loop-playlist=inf no-audio"
  source="$playlist"
else
  source=""

  for gif in "${gifs[@]}"; do
    if [[ ${gif##*/} == "$choice" ]]; then
      source="$gif"
      break
    fi
  done

  [[ -n $source ]] || exit 1

  options="loop-file=inf no-audio"
fi

[[ -n $mpv_running ]] && pkill -x mpvpaper

systemctl --user stop change-bg.timer
mpvpaper -fo "$options" "$monitor" "$source"
