#!/usr/bin/zsh

function run {
    if ! pgrep $1 ;
  then
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
run waybar &
# run mailspring -b &
# run $HOME/.scripts/system/dynamic-wallpaper.sh &
