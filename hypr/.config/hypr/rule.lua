hl.window_rule ({
    name = "browser-window",
    match = {class = "brave-browser"},
    workspace = 4
})

hl.window_rule {
    name = "bitwarden",
    match = {class = "Bitwarden"},
    workspace = 20
}

hl.window_rule {
    name = "note",
    match = {class = "md.obsidian.Obsidian"},
    workspace = 5
}

hl.window_rule {
    name = "stremio",
    match = {class = "com.stremio.stremio"},
    workspace = 8
}

hl.window_rule {
    name = "steam",
    match = {class = "steam"},
    center = true,
    workspace = 9
}

hl.window_rule {
    name = "discord",
    match = {class = "discord"},
    center = true,
    workspace = 7
}


hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)


-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move  = "20 monitor_h-120",
    float = true,
})

