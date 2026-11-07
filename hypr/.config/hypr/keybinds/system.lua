require("keybinds/helper")

createSubmap("SUPER + SHIFT + p","power", function()
    hl.bind("q", function()
        hl.timer(function()
            hl.dispatch(hl.dsp.dpms({ action = "disable" }))
        end, {timeout = 500, type = "oneshot"})
    end)

    hl.bind("o", function()
        hl.timer(function()
            hl.dispatch(hl.dsp.dpms({ action = "enable" }))
        end, {timeout = 500, type = "oneshot"})
    end)
    hl.bind("SUPER + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
    hl.bind("catchall", hl.dsp.submap("reset"))
    hl.bind("escape", hl.dsp.exit())
end)

