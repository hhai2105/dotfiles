source ~/.secrets
export LANG=en_US.UTF-8
export EDITOR=emacs
export _JAVA_AWT_WM_NONREPARENTING=1
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.local/bin"
export XDG_CONFIG_HOME="$HOME/.config/"
export GTK_THEME=Arc-Dark
# export LD_LIBRARY_PATH=/usr/lib64/nvidia/:/usr/lib32/nvidia:/usr/lib:${LD_LIBRARY_PATH}

NUMGPU=$(lspci | grep "VGA" | wc -l)
NUMNVIDIAGPU=$(lspci | grep "VGA.*NVIDIA" | wc -l)

if [[ "$(tty)" = "/dev/tty1" ]]; then
	if [[ "${NUMGPU}" = "1" ]] && [[ "${NUMNVIDIAGPU}" = "1" ]]; then
		nvidia-xrun dwm
	else;
		startx /home/hain/.config/X11/xinitrc
	fi
fi	
