function commandWithReset(keybind, command, prefix)
    hl.bind(keybind, function()
        hl.dispatch(hl.dsp.exec_cmd(command))
        hl.dispatch(hl.dsp.submap("reset"))
    end)
    if prefix then
        for _, value in ipairs(prefix) do
            hl.bind(value .. " + " .. keybind, function()
                hl.dispatch(hl.dsp.exec_cmd(command))
                hl.dispatch(hl.dsp.submap("reset"))
            end)
        end
    end

end

function createSubmap(keybind, name, func)
    hl.bind(keybind, hl.dsp.submap(name))
    hl.define_submap(name, func)
end

