#!/bin/sh

OPTION=$(find $HOME/.config/hypr/monitor-setups -mindepth 1 -printf "%f\n" | rofi -dmenu)
echo "source= $HOME/.config/hypr/monitor-setups/${OPTION}" 

echo "source= $HOME/.config/hypr/monitor-setups/${OPTION}" > ~/.config/hypr/monitor.conf
