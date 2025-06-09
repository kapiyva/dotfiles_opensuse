require("lint").linters_by_ft = {
	typescript = { "eslint" },
	typescriptreact = { "eslint" },
	javascript = { "eslint" },
	javascriptreact = { "eslint" },
	lua = { "luac" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
		require("lint").try_lint("cspell")
	end,
})
