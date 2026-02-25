-- setup commands
vim.api.nvim_create_user_command("SetupLocalConfig", function()
	local script = vim.fn.expand("$MYVIMRC/lua/scripts/setup_local_config.lua")
	vim.cmd("luafile " .. script)
end, { desc = "Set up project-local .nvim" })

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

-- lazygitバッファではESCを本来の動作に戻す
vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*lazygit*",
	callback = function()
		vim.keymap.set("t", "<Esc>", "<Esc>", { buffer = true })
	end,
})

