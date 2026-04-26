#!/bin/sh

OPTION=$(find monitor-setups -mindepth 1 -printf "%f\n" | rofi -dmenu)
echo "source= ./monitor-setups/${OPTION}" 

echo "source= ./monitor-setups/${OPTION}" > ~/.config/hypr/monitor.conf
