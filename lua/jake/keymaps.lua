local keymap = vim.keymap.set

-- Remap for dealing with word wrap
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Better viewing
keymap('n', 'n', 'nzzzv')
keymap('n', 'N', 'Nzzzv')
keymap('n', 'g,', 'g,zvzz')
keymap('n', 'g;', 'g;zvzz')

-- Better indent
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')

-- Paste over currently selected text without yanking it
keymap('v', 'p', '"_dP')

-- Move Lines
keymap('n', '<A-j>', ':m .+1<CR>==')
keymap('v', '<A-j>', ":m '>+1<CR>gv=gv")
keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi')
keymap('n', '<A-k>', ':m .-2<CR>==')
keymap('v', '<A-k>', ":m '<-2<CR>gv=gv")
keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi')

-- Resize window using <shift> arrow keys
keymap('n', '<S-Up>', '<cmd>resize +2<CR>')
keymap('n', '<S-Down>', '<cmd>resize -2<CR>')
keymap('n', '<S-Left>', '<cmd>vertical resize -2<CR>')
keymap('n', '<S-Right>', '<cmd>vertical resize +2<CR>')

-- control s save
keymap('n', '<C-s>', '<cmd>w!<CR>')

-- switch buffers
keymap('n', '<S-l>', ':bnext<CR>', { silent = true })
keymap('n', '<S-h>', ':bprevious<CR>', { silent = true })

keymap('n', '/', '<cmd>SearchBoxIncSearch<CR>', { noremap = true })
keymap('n', ':', '<cmd>FineCmdline<CR>', { noremap = true })
