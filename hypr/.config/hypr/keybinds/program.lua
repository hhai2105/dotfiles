local superMod = "SUPER"
local controlMod = "CONTROL"
local shiftMod = "SHIFT"
local altMod = "ALT"


---------------------
---- MY PROGRAMS ----
---------------------
local browser = "brave --enable-features=UseOzonePlatform --ozone-platform=wayland" -- platform: x11, wayland
local editor = "ghostty -e ~/.scripts/tmux/sessionizer.sh"
local terminal = "ghostty"
local fileManager = "thunar"
local menu = "rofi -show drun"

hl.bind(superMod .. " + return", hl.dsp.exec_cmd(terminal))
hl.bind(superMod .. " + " .. shiftMod .. " + q", hl.dsp.window.close())
hl.bind(superMod .. " + " .. shiftMod .. " + r", function()
    hl.dispatch(hl.dsp.exec_cmd("~/.config/hypr/scripts/set-random-wallpaper.sh"))
    hl.dispatch(hl.dsp.exec_cmd("killall waybar && waybar"))
end)

hl.bind(controlMod .. " + " .. altMod .. " + w", hl.dsp.exec_cmd(browser))
hl.bind(controlMod .. " + " .. altMod .. " + d", hl.dsp.exec_cmd("~/.config/hypr/scripts/jump-to-existing.sh md.obsidian.Obsidian obsidian"))
hl.bind(controlMod .. " + " .. altMod .. " + m", hl.dsp.exec_cmd(" ~/.config/hypr/scripts/jump-to-existing.sh discord discord"))
hl.bind(controlMod .. " + " .. altMod .. " + g", hl.dsp.exec_cmd("~/.config/hypr/scripts/jump-to-existing.sh steam steam"))
hl.bind(controlMod .. " + " .. altMod .. " + p", hl.dsp.exec_cmd("~/.config/hypr/scripts/jump-to-existing.sh Bitwarden bitwarden-desktop"))
hl.bind(controlMod .. " + " .. altMod .. " + s", hl.dsp.exec_cmd("~/.config/hypr/scripts/jump-to-existing.sh com.stremio.stremio stremio "))

hl.bind(altMod .. " + space", hl.dsp.exec_cmd(menu))
