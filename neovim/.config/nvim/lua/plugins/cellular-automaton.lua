local bind = vim.keymap.set

return {
    'eandrju/cellular-automaton.nvim' ,
    config = function()
        bind("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>");
    end
}
