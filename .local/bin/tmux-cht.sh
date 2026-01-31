#!/usr/bin/env bash
selected=`cat ~/.config/tmux/.tmux-cht-languages ~/.config/tmux/.tmux-cht-command | fzf`

if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query
tput cuu1
tput el

if grep -qs "$selected" ~/.config/tmux/.tmux-cht-languages; then
    query=$(echo "$query" | tr ' ' '+')
    curl -s cht.sh/$selected/$query | less
else
    curl -s cht.sh/$selected~$query | less
fi
