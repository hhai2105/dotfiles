local bind = vim.keymap.set

bind("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })



bind("n", "<leader><leader>", function()
    vim.cmd("so")
end)
bind("v", "K", ":m '<-2<CR>gv=gv")
bind("v", "J", ":m '>+1<CR>gv=gv")

bind("n", "J", "mzJ`z")
bind("n", "n", "nzzzv")
bind("n", "N", "Nzzzv")

bind("n", "<leader>zig", "<cmd>LspRestart<cr>")
-- greatest remap ever
bind("", "<leader>p", [["_dP]])
bind("i", "<C-c>", "<Esc>")

bind("n", "<leader>w", "<C-w>")

bind("n", "<C-f>", "<cmd>silent !tmux neww ~/.scripts/tmux/sessionizer.sh<CR>")
bind("n", "<leader>f", vim.lsp.buf.format)

bind("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
bind("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
bind("n", "<leader>cd", "<cmd>cd <CR>", { silent = true })

bind("n", "<leader>wd", "<cmd>quit<CR>")
bind("n", "<C-w>d", "<cmd>quit<CR>")
bind("n", "<leader>tx", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
