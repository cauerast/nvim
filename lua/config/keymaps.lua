-- Keymaps

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Up, Down
vim.keymap.set('n', 'j', 'gj', { desc = 'Up', noremap = true})
vim.keymap.set('n', 'k', 'gk', { desc = 'Down', noremap = true})

-- Navigate between windows (tree / editor / terminal)
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Window left' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Window down' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Window up' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Window right' })
vim.keymap.set('t', '<Esc><Esc>', [[<C-\><C-n>]], { desc = 'Terminal: exit to normal mode' })
vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]], { desc = 'Terminal: window left' })
vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], { desc = 'Terminal: window up' })
