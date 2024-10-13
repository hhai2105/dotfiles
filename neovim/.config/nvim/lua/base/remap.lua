local bind = vim.keymap.set

bind("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })


bind("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
bind("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");
bind("n", "<leader><leader>", function()
    vim.cmd("so")
end)
bind("n", "<leader>pv", vim.cmd.Ex)

bind("v", "K", ":m '<-2<CR>gv=gv")
bind("v", "J", ":m '>+1<CR>gv=gv")

bind("n", "J", "mzJ`z")
bind("n", "<C-d>", "<C-d>zz")
bind("n", "<C-u>", "<C-u>zz")
bind("n", "n", "nzzzv")
bind("n", "N", "Nzzzv")
bind("n", "<leader>zig", "<cmd>LspRestart<cr>")
-- greatest remap ever
bind("", "<leader>p", [["_dP]])
bind("i", "<C-c>", "<Esc>")

bind("n", "<leader>w", "<C-w>")

bind("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
bind("n", "<leader>f", vim.lsp.buf.format)

bind("n", "<C-k>", "<cmd>cnext<CR>zz")
bind("n", "<C-j>", "<cmd>cprev<CR>zz")
bind("n", "<leader>k", "<cmd>lnext<CR>zz")
bind("n", "<leader>j", "<cmd>lprev<CR>zz")

bind("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
bind("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
bind("n", "<leader>cd", "<cmd>cd <CR>", { silent = true })

bind("n", "<leader>wd", "<cmd>quit<CR>")
bind("n", "<C-w>d", "<cmd>quit<CR>")
vim.keymap.set("n", "<leader>tx", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
