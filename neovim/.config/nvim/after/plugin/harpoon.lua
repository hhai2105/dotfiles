local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local bind = vim.keymap.set

bind("n", "<leader>a", mark.add_file)
bind("n", "<C-e>", ui.toggle_quick_menu)

bind("n", "Q", function() ui.nav_file(1) end)
bind("n", "W", function() ui.nav_file(2) end)
bind("n", "E", function() ui.nav_file(3) end)
bind("n", "R", function() ui.nav_file(4) end)
bind("n", "T", function() ui.nav_file(5) end)
bind("n", "Y", function() ui.nav_file(6) end)

require("harpoon").setup({
    -- enable tabline with harpoon marks
    tabline = true,
    tabline_prefix = "   ",
    tabline_suffix = "   ",

    menu = {
        width = vim.api.nvim_win_get_width(0) - 30,
    }
})

vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#63698c')
vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')
