#!/usr/bin/env zsh

if [[ $# -eq 1 ]]; then
    selected=$1
else
    choices=$(find -L ~/code ~/ ~/.config -mindepth 1 -maxdepth 1 -type d)
    selected=$(echo $choices | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    printf "tmux new-session -s $selected_name -c $selected"
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    printf "tmux new-session -ds $selected_name -c $selected"
    tmux new-session -ds $selected_name -c $selected
fi

if [[ -z $TMUX ]]; then
    printf "tmux attach-session -t $selected_name"
    tmux attach-session -t $selected_name
else
    printf "tmux switch-client -t $selected_name"
    tmux switch-client -t $selected_name
fi
