local map = vim.keymap.set

-- move tabs
map('n', 'tn', '<CMD>BufferNext<CR>')
map('n', 'tp', '<CMD>BufferPrevious<CR>')
-- close buffer
map('n', 'tc', '<CMD>BufferClose<CR>')
-- tab jump
map('n', 'tj', '<CMD>BufferPick<CR>')
