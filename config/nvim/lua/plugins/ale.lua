vim.g.ale_fix_on_save = 1

vim.g.ale_linters = {
	lua = { "stylua" },
	typescript = { "eslint", "cspell" },
	javascript = { "eslint", "cspell" },
	rust = { "cspell" },
}
vim.g.ale_fixers = {
	lua = { "stylua" },
	typescript = { "eslint", "prettier" },
	javascript = { "eslint", "prettier" },
}

vim.g.ale_completion_enabled = 0
