vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

vim.keymap.set('x', '<leader>p', [["_dP]])

vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set('n', '<leader><Tab>', vim.cmd.tabnew)
vim.keymap.set('n', '<S-Tab>', vim.cmd.tabclose)
vim.keymap.set('n', '<Tab>', vim.cmd.tabnext)
vim.keymap.set('n', '<M-Tab>', vim.cmd.tabprev)
