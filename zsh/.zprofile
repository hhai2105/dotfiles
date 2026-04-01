export LANG=en_US.UTF-8
export EDITOR=nvim
export _JAVA_AWT_WM_NONREPARENTING=1
export PATH="$PATH:$HOME/.scripts/tmux"
export XDG_CONFIG_HOME="$HOME/.config/"
export GTK_THEME=Arc-Dark
export WLR_NO_HARDWARE_CURSORS=1
export WINE_PREFIX=~/.wine

if [[ "$(tty)" = "/dev/tty1" ]]; then
    startx /home/hain/.config/X11/xinitrc
fi;

