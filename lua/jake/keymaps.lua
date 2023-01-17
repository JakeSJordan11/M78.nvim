-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Better viewing
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', 'g,', 'g,zvzz')
vim.keymap.set('n', 'g;', 'g;zvzz')

-- Better indent
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Paste over currently selected text without yanking it
vim.keymap.set('v', 'p', '"_dP')

-- Move Lines
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==')
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('i', '<A-j>', '<Esc>:m .+1<CR>==gi')
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==')
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv")
vim.keymap.set('i', '<A-k>', '<Esc>:m .-2<CR>==gi')

-- Resize window using <shift> arrow keys
vim.keymap.set('n', '<S-Up>', '<cmd>resize +2<CR>')
vim.keymap.set('n', '<S-Down>', '<cmd>resize -2<CR>')
vim.keymap.set('n', '<S-Left>', '<cmd>vertical resize -2<CR>')
vim.keymap.set('n', '<S-Right>', '<cmd>vertical resize +2<CR>')

-- control s save
vim.keymap.set('n', '<C-s>', '<cmd>w!<CR>')

-- switch buffers
vim.keymap.set('n', '<S-l>', ':bnext<CR>', { silent = true })
vim.keymap.set('n', '<S-h>', ':bprevious<CR>', { silent = true })
