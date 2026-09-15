require("keybinds/helper")

hl.bind("SUPER + SHIFT + p", hl.dsp.submap("power"))
hl.define_submap("power", function()
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

hl.bind("SUPER + o", hl.dsp.submap("search"))
hl.define_submap("search", function()
    -- Set repeating binds for resizing the active window.
    commandWithReset("o", "~/.scripts/rofi/rofi-search/search search")
    commandWithReset("SUPER + o", "~/.scripts/rofi/rofi-search/search search")

    commandWithReset("m", "~/.scripts/rofi/rofi-search/search quickmark")
    commandWithReset("SUPER + m", "~/.scripts/rofi/rofi-search/search quickmark")

    hl.bind("catchall", hl.dsp.submap("reset"))

end)

hl.bind("SUPER + p", hl.dsp.submap("general"))
hl.define_submap("general", function()
    commandWithReset("l", "killall hyperhdr & sleep .2 && hyperhdr --pipewire")
    commandWithReset("SUPER + l", "killall hyperhdr & sleep .2 && hyperhdr --pipewire")
    hl.bind("catchall", hl.dsp.submap("reset"))
end)
