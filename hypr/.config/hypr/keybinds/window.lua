local superMod = "SUPER"
local shiftMod = "SHIFT"
local altMod = "ALT"

hl.bind(superMod .. " + " .. shiftMod .. " + q", hl.dsp.window.close())

hl.bind(superMod .. " + t", hl.dsp.window.float({ action = "toggle" }))
hl.bind(superMod .. " + f", hl.dsp.window.fullscreen({ action = "toggle" }))

-- Move focus with superMod + arrow keys
hl.bind(superMod .. " + h",  hl.dsp.focus({ direction = "left" }))
hl.bind(superMod .. " + j", hl.dsp.layout("cyclenext"))
hl.bind(superMod .. " + k",    hl.dsp.layout("cycleprev"))
hl.bind(superMod .. " + l",  hl.dsp.focus({ direction = "right" }))

hl.bind(superMod  .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))


hl.bind(superMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(superMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with superMod + scroll
hl.bind(superMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(superMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with superMod + LMB/RMB and dragging
hl.bind(superMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(superMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })



for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(superMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(superMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end


local monitorKeyMap = {"w", "e"}
local monitorMap = {"DP-5", "DP-4"}
for i = 1, 2 do
    local key = monitorKeyMap[i]
    hl.bind(superMod .. " + " .. key,             hl.dsp.focus({ monitor = monitorMap[i]}))
    hl.bind(superMod .. " + SHIFT + " .. key,     hl.dsp.workspace.move({ monitor = monitorMap[i] }))
end
