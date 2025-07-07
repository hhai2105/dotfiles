local opt = vim.opt

opt.number = true
opt.autochdir = false
opt.clipboard:append({'unnamedplus'})


-- indenting
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true

opt.cursorline = true

opt.wrap = false

-- undo
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true
opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 45
-- opt.colorcolumn = "80"

vim.g.mapleader = " "

vim.opt.splitright = true
