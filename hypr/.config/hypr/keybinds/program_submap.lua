require("keybinds/helper")

hyperhdr = "killall hyperhdr & sleep .3 && hyperhdr --pipewire"

screen = "~/.config/hypr/scripts/switch-monitor.sh"
soundcard = "~/.scripts/rofi/soundcard-choose"
youtube = "~/.scripts/rofi/rofi-youtube/rofi-youtube"
network = "~/.scripts/rofi/wifi"
bluetooth = "blueman-manager"
music = "~/.scripts/rofi/rofi-music/music.sh"
killscript = "~/.scripts/rofi/killscript.sh"


createSubmap("SUPER + o", "search", function()
    -- Set repeating binds for resizing the active window.
    commandWithReset("o", "~/.scripts/rofi/rofi-search/search search", {"SUPER"})
    commandWithReset("m", "~/.scripts/rofi/rofi-search/search quickmark", {"SUPER"})
    hl.bind("catchall", hl.dsp.submap("reset"))
end)

hl.bind("SUPER + p", hl.dsp.submap("general"))
hl.define_submap("general", function()
    commandWithReset("l", hyperhdr, {"SUPER"})
    -- rofi scripst
    commandWithReset("p", screen, {"SUPER"})
    commandWithReset("a", soundcard, {"SUPER"})
    commandWithReset("y", youtube, {"SUPER"})
    commandWithReset("b", bluetooth, {"SUPER"})
    commandWithReset("m", music, {"SUPER"})
    commandWithReset("k", killscript, {"SUPER"})


    hl.bind("catchall", hl.dsp.submap("reset"))
end)
