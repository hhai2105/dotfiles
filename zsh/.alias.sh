alias ssn="sudo shutdown now"
alias killall="killall -9"
alias gc="git clone --recurse-submodules"
alias lspc="bear -- make -j$(nproc)"
alias pi="pip install --break-system-packages"
alias todoist="todoist-cli"
alias mainsail="ssh orangepi@192.168.1.151"
alias orangepi="ssh orangepi@192.168.1.151"
alias ls="ls -la --color=auto"
alias xmm="xmodmap ~/.Xmodmap"
alias storepackage="paru -Qen"
alias ga"git apply --3way"

bindkey -s '^F' "^u~/.scripts/tmux/sessionizer.sh^M"

source $HOME/.extract.sh

