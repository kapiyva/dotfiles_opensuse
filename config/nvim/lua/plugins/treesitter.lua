require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "rust", "typescript" },
	sync_install = true,
	auto_install = false,
	highlight = {
		enable = true,
	},
})
