vim.g.mapleader = ' '

vim.opt.nu = true
vim.opt.relativenumber = true

function set_indent(size) 
  vim.opt.tabstop = size
  vim.opt.softtabstop = size
  vim.opt.shiftwidth = size
end

vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append('@-@')

vim.opt.updatetime = 50

vim.cmd([[autocmd FileType * set formatoptions-=ro]])

set_indent(2)

vim.api.nvim_create_autocmd('FileType', {
  pattern = '*.java',
  callback = function()
    set_indent(4)
  end
})

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '*.java',
  callback = function()
    local output = vim.fn.system { 'mvn', 'compile' }
  end
})

