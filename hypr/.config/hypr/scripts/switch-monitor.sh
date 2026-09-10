#!/bin/sh

OPTION=$(find $HOME/.config/hypr/monitor-setups -mindepth 1 -printf "%f\n" | rofi -dmenu)

if [ -z "$OPTION" ]
then
    exit 0
fi 

echo "require(\"monitor-setups/${OPTION}\")" 
echo "require(\"monitor-setups/${OPTION}\")" > ~/.config/hypr/monitor.conf
