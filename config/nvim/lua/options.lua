local options = {
  backup = false,
  swapfile = false,
  writebackup = false,
  number = true,
  mouse = a,
  smartindent = true,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  list = true,
  splitbelow = true,
  splitright = true,
  signcolumn = yes,
  fileformat = unix,
  timeout = false,
  laststatus = 3,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.shortmess:append("I")

vim.g.mapleader = ","
vim.keymap.set('n', '<Esc><Esc>', ':nohl<CR>')

-- Terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.api.nvim_create_user_command("T", function()
  vim.cmd("tabnew |terminal")
end, {})

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  command = "startinsert",
})
