#!/usr/bin/env zsh

llm_dir="$HOME/.scripts/llm"

# Pick model: arg > interactive > default (qwen.sh)
if [[ $# -ge 1 ]]; then
    script="$1"
    # Normalize: strip .sh if present, then re-add it
    script="${script%.sh}.sh"
elif [[ -n $TMUX ]]; then
    script=$(ls "$llm_dir"/qwen*.sh | fzf -1 | xargs basename)
else
    script=$(ls "$llm_dir"/qwen*.sh | fzf -1 | xargs basename)
fi

if [[ -z $script ]]; then
    exit 0
fi

session_name="llm"

if [[ -n $TMUX ]]; then
    # Already in tmux: switch to the session
    if ! tmux has-session -t=$session_name 2>/dev/null; then
        tmux new-session -ds $session_name -c $llm_dir
        tmux send-keys -t $session_name "cd $llm_dir && exec ./$(echo $script)" Enter
    fi
    tmux switch-client -t $session_name
elif [[ -t 0 ]]; then
    # Interactive terminal (no tmux): create session and attach
    if ! tmux has-session -t=$session_name 2>/dev/null; then
        tmux new-session -ds $session_name -c $llm_dir
        tmux send-keys -t $session_name "cd $llm_dir && exec ./$(echo $script)" Enter
    fi
    tmux attach-session -t $session_name
else
    # Non-interactive (autostart): create session only, no attach
    if ! tmux has-session -t=$session_name 2>/dev/null; then
        tmux new-session -ds $session_name -c $llm_dir
        tmux send-keys -t $session_name "cd $llm_dir && exec ./$(echo $script)" Enter
    fi
fi
