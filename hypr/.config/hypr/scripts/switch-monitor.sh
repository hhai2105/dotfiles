#!/bin/sh

OPTION=$(find $HOME/.config/hypr/monitor-setups -mindepth 1 -printf "%f\n" | rofi -dmenu)

if [ -z "$OPTION" ]
then
    exit 0
fi 

echo "source= $HOME/.config/hypr/monitor-setups/${OPTION}" 
echo "source= $HOME/.config/hypr/monitor-setups/${OPTION}" > ~/.config/hypr/monitor.conf
