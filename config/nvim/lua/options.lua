-- options
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.number = true
vim.opt.mouse = a
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.list = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.signcolumn = yes
vim.opt.fileformat = unix
vim.opt.timeout = false
vim.opt.laststatus = 3
vim.opt.shortmess:append("I")

-- key config
vim.g.mapleader = ","
vim.keymap.set("n", "<Esc><Esc>", ":nohl<CR>")

-- Terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.api.nvim_create_user_command("T", function()
	vim.cmd("tabnew |terminal")
end, {})

vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	command = "startinsert",
})
