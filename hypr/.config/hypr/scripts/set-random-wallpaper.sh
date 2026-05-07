#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers/minimal"
CURRENT_DIR="$HOME/Pictures/Wallpapers/current"

# Get list of wallpaper files (exclude directories and current folder)
mapfile -t WALLPAPERS < <(find "$WALLPAPER_DIR" -maxdepth 1 -type f \( -name "*.jpg" -o -name "*.png" \))

# Check if we have at least 2 wallpapers
if [ ${#WALLPAPERS[@]} -lt 2 ]; then
    echo "Error: Need at least 2 wallpapers to choose from"
    exit 1
fi

# Select 2 random unique wallpapers
RANDOM1=$((RANDOM % ${#WALLPAPERS[@]}))
WALLPAPER1="${WALLPAPERS[$RANDOM1]}"

# Ensure we get a different second wallpaper
RANDOM2=$((RANDOM % ${#WALLPAPERS[@]}))
while [ $RANDOM2 -eq $RANDOM1 ]; do
    RANDOM2=$((RANDOM % ${#WALLPAPERS[@]}))
done
WALLPAPER2="${WALLPAPERS[$RANDOM2]}"

# Copy to current directory
cp "$WALLPAPER1" "$CURRENT_DIR/wallpaper1.jpg"
cp "$WALLPAPER2" "$CURRENT_DIR/wallpaper2.jpg"

# Get monitor names using hyprctl
MONITORS=($(hyprctl monitors -j 2>/dev/null | jq -r '.[].name'))

# Fallback to hyprpaper.conf monitors if hyprctl fails
if [ ${#MONITORS[@]} -eq 0 ]; then
    MONITORS=($(grep "^wallpaper" "$HOME/.config/hypr/hyprpaper.conf" | cut -d',' -f1 | cut -d'=' -f2))
fi

# Apply to monitors (first wallpaper to first monitor, second to second)
if [ ${#MONITORS[@]} -ge 1 ]; then
    hyprctl hyprpaper wallpaper "${MONITORS[0]},$CURRENT_DIR/wallpaper1.jpg" 2>/dev/null
fi
if [ ${#MONITORS[@]} -ge 2 ]; then
    hyprctl hyprpaper wallpaper "${MONITORS[1]},$CURRENT_DIR/wallpaper2.jpg" 2>/dev/null
fi

echo "Set wallpapers:"
echo "  ${MONITORS[0]:-Monitor 1}: $(basename "$WALLPAPER1")"
echo "  ${MONITORS[1]:-Monitor 2}: $(basename "$WALLPAPER2")"
