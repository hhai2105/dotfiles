
source ~/.secrets
export LANG=en_US.UTF-8
export EDITOR=nvim
export _JAVA_AWT_WM_NONREPARENTING=1
export PATH="$PATH:$HOME/.scripts/tmux"
# export PATH="$PATH:$HOME/.local/bin"
export XDG_CONFIG_HOME="$HOME/.config/"
export GTK_THEME=Arc-Dark
export WLR_NO_HARDWARE_CURSORS=1
export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/nvidia_icd.json
export WINE_PREFIX=~/.wine
# export LD_LIBRARY_PATH=/usr/lib64/nvidia/:/usr/lib32/nvidia:/usr/lib:${LD_LIBRARY_PATH}

NUMGPU=$(lspci | grep "VGA" | wc -l)
NUMNVIDIAGPU=$(lspci | grep "VGA.*NVIDIA" | wc -l)

if [[ "$(tty)" = "/dev/tty1" ]]; then
#	hyprland
 	if [[ "${NUMGPU}" = "1" ]] && [[ "${NUMNVIDIAGPU}" = "1" ]]; then
 		# nvidia-xrun dwm
 		startx /home/hain/.config/X11/xinitrc
 	else;
 		startx /home/hain/.config/X11/xinitrc
 	fi
fi
