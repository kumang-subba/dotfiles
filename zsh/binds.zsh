# run neovim
function run_nvim () {
    echo
    nvim
    zle accept-line
}
zle -N run_nvim
bindkey '^N' run_nvim

# function run_ranger () {
#     echo
#     ranger --choosedir=$HOME/.rangerdir < $TTY
#     LASTDIR=`cat $HOME/.rangerdir`
#     cd "$LASTDIR"
#     zle accept-line
# }
# zle -N run_ranger

# superfile
spf() {
    os=$(uname -s)

    # Linux
    if [[ "$os" == "Linux" ]]; then
        export SPF_LAST_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/superfile/lastdir"
    fi

    # macOS
    if [[ "$os" == "Darwin" ]]; then
        export SPF_LAST_DIR="$HOME/Library/Application Support/superfile/lastdir"
    fi

    command spf "$@"

    [ ! -f "$SPF_LAST_DIR" ] || {
        . "$SPF_LAST_DIR"
        rm -f -- "$SPF_LAST_DIR" > /dev/null
    }
}

# superfile widget
_spf_widget() {
    zle -I
    spf
    zle reset-prompt
}

zle -N _spf_widget
bindkey '^E' _spf_widget

# fzf history
fh() {
    local cmd
    cmd=$(awk -F';' 'NF > 1 && $2 != "" {print $2}' ~/.zsh_history |
        tac |
        awk '!seen[$0]++' |
        fzf --no-sort --exact) || return

    if [[ -n "$cmd" ]]; then
        BUFFER="$cmd"
        CURSOR=${#BUFFER}
        zle accept-line
    fi
}
zle -N fh
bindkey '^R' fh

bindkey '^G' autosuggest-accept
bindkey '^s' autosuggest-execute
bindkey '^e' vi-forward-word
bindkey '^b' vi-backward-word
bindkey '^o' vi-beginning-of-line
bindkey '^a' vi-end-of-line

bindkey -s ^h "tmux-attach-open^M"
bindkey -s ^f "tmux-sessionizer^M"
bindkey -s ^y "tmux-cht.sh^M"
