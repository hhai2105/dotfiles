-- Switch to a submap called `resize`.
hl.bind("SUPER + SHIFT + p", hl.dsp.submap("power"))

-- Start a submap called "resize".
hl.define_submap("power", function()
    -- Set repeating binds for resizing the active window.
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

-- Switch to a submap called `resize`.
hl.bind("SUPER + o", hl.dsp.submap("search"))

-- Start a submap called "resize".
hl.define_submap("search", function()
    -- Set repeating binds for resizing the active window.
    hl.bind("o", hl.dsp.exec_cmd("~/.scripts/rofi/rofi-search/search search"))
    hl.bind("SUPER + o", hl.dsp.exec_cmd("~/.scripts/rofi/rofi-search/search search"))
    hl.bind("m", hl.dsp.exec_cmd("~/.scripts/rofi/rofi-search/search quickmark"))
    hl.bind("SUPER + m", hl.dsp.exec_cmd("~/.scripts/rofi/rofi-search/search quickmark"))
    hl.bind("catchall", hl.dsp.submap("reset"))
    hl.bind("m", hl.dsp.exit())

end)
