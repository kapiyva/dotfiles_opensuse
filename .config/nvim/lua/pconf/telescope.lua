require('telescope').load_extension('coc')
require('telescope').load_extension('media_files')

require('telescope').setup({
  defaults = {
    file_ignore_patterns = { 'node_modules', 'venv', },
    -- path_display = {'shorten'},
  },
  extentions = {
    coc = {
      prefer_locations = true,
    },
    media_files = {
      filetypes = {"png","jpg","jpeg","svg"}
    }
  }
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fa', ":Telescope<cr>", {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})
vim.keymap.set('n', '<leader>fd', ":Telescope coc workspace_diagnostics<cr>", {})
vim.keymap.set('n', '<leader>fs', builtin.git_status, {})
vim.keymap.set('n', '<leader>fm', ":Telescope media_files<cr>", {})

