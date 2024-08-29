-- Colors
function Colors()
  themes = {
    'catppuccin',
    'catppuccin-frappe',
    'catppuccin-macchiato',
    'catppuccin-mocha',
    'kanagawa',
    'kanagawa-dragon',
    'kanagawa-wave',
    'tokyonight',
    'tokyonight-moon',
    'tokyonight-night',
    'tokyonight-storm'
  }

  local theme = themes[math.random(1, #themes)]

  print('Choosed theme: ' .. theme)

  vim.cmd.colorscheme(theme)

  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

end

Colors()

--Fugitive
vim.keymap.set('n', '<leader>gs', vim.cmd.Git)


-- lsp-zero
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)


  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- see :help lsp-zero-guide:integrate-with-mason-nvim
-- to learn how to use mason.nvim with lsp-zero
require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    lsp_zero.default_setup,
  }
})

--
local cmp = require('cmp')

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<Left>'] = cmp.mapping.confirm({select = true}),
    ['<Right>'] = cmp.mapping.abort(),
    ['<Up>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
    ['<Down>'] = cmp.mapping.select_next_item({behavior = 'select'}),
  })
})

-- Telescope
local telescope = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', telescope.find_files, {})
vim.keymap.set('n', '<leader>pg', telescope.git_files, {})
vim.keymap.set('n', '<leader>pl', telescope.live_grep, {})
vim.keymap.set('n', '<leader>pb', telescope.buffers, {})
vim.keymap.set('n', '<leader>ph', telescope.help_tags, {})


-- Treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'c', 'lua', 'javascript', 'typescript', 'rust', 'dart', 'go', 'java' },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true
  }
}

-- nvim-colorizer
require 'colorizer'.setup()


