require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"rust_analyzer",
		"ts_ls",
		"eslint",
		"lua_ls",
	},
})
