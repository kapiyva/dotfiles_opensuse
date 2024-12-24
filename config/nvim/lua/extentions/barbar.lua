local map = vim.keymap.set

-- move tabs
map('n', 'tn', '<Cmd>BufferNext<CR>')
map('n', 'tp', '<Cmd>BufferPrevious<CR>')
-- close buffer
map('n', 'tc', '<Cmd>BufferClose<CR>')
-- tab jump
map('n', 'tj', '<Cmd>BufferPick<CR>')
