function commandWithReset(keybind, command)
    hl.bind(keybind, function()
        hl.dispatch(hl.dsp.exec_cmd(command))
        hl.dispatch(hl.dsp.submap("reset"))
    end)
end
