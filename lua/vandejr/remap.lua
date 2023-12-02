vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

vim.keymap.set('x', '<leader>p', [["_dP]])

vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set('n', '<leader><Tab>', vim.cmd.tabnew)
vim.keymap.set('n', '<S-Tab>', vim.cmd.tabclose)
vim.keymap.set('n', '<Tab>', vim.cmd.tabnext)
vim.keymap.set('n', '<M-Tab>', vim.cmd.tabprev)

vim.keymap.set('n', '<leader>`', function()
  vim.cmd('belowright split')
  vim.cmd('resize10')
  vim.cmd('term')
end)


local isLow = false
vim.keymap.set('n', '<C-`>', function()
  if isLow then
    vim.cmd('resize10')
  else
    vim.cmd('resize1')
  end
  isLow = not isLow
end)

vim.keymap.set('n', 'Q', vim.cmd.quit)

vim.keymap.set('t', '<leader><CR>', [[<C-\><c-n>]])

