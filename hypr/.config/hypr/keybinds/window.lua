-- local superMod = "SUPER"
-- local shiftMod = "SHIFT"
-- local altMod = "ALT"

hl.bind("SUPER + SHIFT + q", hl.dsp.window.close())

hl.bind("SUPER + t", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + f", hl.dsp.window.fullscreen({ action = "toggle" }))

-- Move focus with superMod + arrow keys
hl.bind("SUPER + h",  hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + j", hl.dsp.layout("cyclenext"))
hl.bind("SUPER + k",    hl.dsp.layout("cycleprev"))
hl.bind("SUPER + l",  hl.dsp.focus({ direction = "right" }))

hl.bind("SUPER + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind("SUPER + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })



for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind("SUPER + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind("SUPER + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end


local monitorKeyMap = {"w", "e"}
local monitorMap = {"DP-5", "DP-4"}
for i = 1, 2 do
    local key = monitorKeyMap[i]
    hl.bind("SUPER + " .. key,             hl.dsp.focus({ monitor = monitorMap[i]}))
    hl.bind("SUPER + SHIFT + " .. key,     hl.dsp.workspace.move({ monitor = monitorMap[i] }))
end
