local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },{
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {}
  },{
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000
  },{
    'rebelot/kanagawa.nvim'
  },{
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },{
    'tpope/vim-fugitive'
  },{
    'williamboman/mason.nvim'
  },{
    'williamboman/mason-lspconfig.nvim'
  },{
    'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'
  },{
    'neovim/nvim-lspconfig'
  },{
    'hrsh7th/cmp-nvim-lsp'
  },{
    'hrsh7th/nvim-cmp'
  },{
    'L3MON4D3/LuaSnip'
  },{
    'vim-airline/vim-airline' 
  },{
    'vim-airline/vim-airline-themes'
  },{
    'jiangmiao/auto-pairs'
  }, {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = true
  }, {
    'norcalli/nvim-colorizer.lua',
    event = 'BufEnter',
    opts = { '*' }
  }
})

