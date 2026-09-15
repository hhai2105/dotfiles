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
    hl.bind("catchall", hl.dsp.submap("reset"))
    hl.bind("escape", hl.dsp.exit())
end)

