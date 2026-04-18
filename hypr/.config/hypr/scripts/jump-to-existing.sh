#!/bin/sh
# Jump to workspace containing a window with the given class name, or launch the executable if not found
# Usage: jump-to-existing.sh <class_name> <executable>

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <class_name> <executable>"
    exit 1
fi

CLASS_NAME="$1"
EXECUTABLE="$2"

# Get all clients and find the one matching the class name
WINDOW_DATA=$(hyprctl clients -j | jq -r ".[] | select(.class == \"$CLASS_NAME\") | \"\(.workspace.id) \(.address)\"")

if [ -z "$WINDOW_DATA" ]; then
    # No window found, launch the executable
    $EXECUTABLE &
    exit 0
fi

# Get the first matching workspace ID and window address
WORKSPACE_ID=$(echo "$WINDOW_DATA" | head -n1 | awk '{print $1}')
WINDOW_ADDR=$(echo "$WINDOW_DATA" | head -n1 | awk '{print $2}')

# Switch to the workspace
hyprctl dispatch workspace "$WORKSPACE_ID"

# Focus the specific window
hyprctl dispatch focuswindow address:"$WINDOW_ADDR"
