#!/usr/bin/zsh

function run {
    # Extract the base command name (strip path, stop at first arg)
    local cmd
    cmd=$(echo $1 | sed 's|.*/||')
    if ! pgrep -x "$cmd" >/dev/null; then
        $@&
    fi
}

#cursor active at boot
run ollama serve &
run ibus-daemon -d &
run mpDris2 &
run mpd &
run udiskie &
run blueman-applet &
run dunst &
run mpv --input-ipc-server=/tmp/mpvsocket &
run hyprpaper &
$HOME/.config/hypr/scripts/set-random-wallpaper.sh &
# Start LLM server via run.sh (creates tmux session, no attach needed)
$HOME/.scripts/llm/run.sh qwenlite.sh &
run waybar &
# run mailspring -b &
# run $HOME/.scripts/system/dynamic-wallpaper.sh &
