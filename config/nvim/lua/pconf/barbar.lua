local map = vim.keymap.set

-- move tabs
map('n', 'tn', '<Cmd>BufferNext<CR>')
map('n', 'tp', '<Cmd>BufferNext<CR>')
-- close buffer
map('n', 'tc', '<Cmd>BufferClose<CR>')
