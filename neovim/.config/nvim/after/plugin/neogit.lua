-- init.lua
local neogit = require('neogit')
neogit.setup {}

vim.keymap.set('n', '<leader>gg', function() neogit.open({ kind = "vsplit" }) end)
