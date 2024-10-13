-- This file can be loaded by calling `lua require('plugins')` from your init.vim 

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function(use)
use 'wbthomason/packer.nvim'
  
use ({
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  requires = { {'nvim-lua/plenary.nvim'} }
})

use ("stevearc/oil.nvim")

use ("nvim-tree/nvim-web-devicons")

use 'feline-nvim/feline.nvim'
use( "nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"}) 

use ("nvim-treesitter/playground")

use ("mbbill/undotree")

use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { {"nvim-lua/plenary.nvim"} }
}

use {
  "NeogitOrg/neogit",
  requires = {
      {"nvim-lua/plenary.nvim"},
      {"sindrets/diffview.nvim"},
      {"nvim-telescope/telescope.nvim"},
  }
}

use ("norcalli/nvim-colorizer.lua")
use ("tpope/vim-surround")

use "terrortylor/nvim-comment"
use("lewis6991/gitsigns.nvim")
use ("ahmedkhalf/project.nvim")

use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}

use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},

    -- Snippets
    {'saadparwaiz1/cmp_luasnip'},
    {'L3MON4D3/LuaSnip'},
    {'rafamadriz/friendly-snippets'},
  }
}
end)
