local bind = vim.keymap.set

bind("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
bind("n", "<leader>.", "<CMD>Oil<CR>", { desc = "Open parent directory" })
bind("n", "<esc>", "<CMD>noh<CR>")
